#!/bin/bash
# setup-python.sh - Convert docs template to Python package setup
#
# NOTE: We use SINGLE $ for variables (e.g., $PKG_NAME).
#       Do NOT use $$ (that expands to the Process ID in Bash!).
#       $$ is only for Makefiles or escaping in specific contexts.

set -e

echo "Converting to Python Package Mode..."

# Ask for package name
read -p "Enter your Python package name (e.g., my_project): " PKG_NAME

# Validate naming
if [[ ! "$PKG_NAME" =~ ^[a-zA-Z][a-zA-Z0-9_]*$ ]]; then
    echo "❌ Error: Package name must start with a letter and contain only letters, numbers, and underscores.."
    exit 1
fi

# Ask for the origin of user's code
echo ""
echo "Where is your Python code?"
echo "  1. Local folder on this computer"
echo "  2. Separate git repository"
echo "  3. Starting fresh (create skeleton)"
read -p "Enter choice [1-3]: " SOURCE_CHOICE

case "$SOURCE_CHOICE" in
  1)
    read -p "Enter path to your package folder: " LOCAL_PATH
    if [ -d "$LOCAL_PATH" ]; then
      cp -r "$LOCAL_PATH" "./$PKG_NAME"
      echo "✅ Copied from $LOCAL_PATH"
    else
      echo "❌ Path not found: $LOCAL_PATH"
      exit 1
    fi
    ;;
  2)
    read -p "Enter git repository URL: " GIT_URL
    git submodule add "$GIT_URL" "$PKG_NAME"
    echo "✅ Added as git submodule"
    ;;
  3)
    mkdir -p "$PKG_NAME"
    touch "$PKG_NAME/__init__.py"
    cat > "$PKG_NAME/sample.py" << EOF
"""Sample module for testing."""

def hello():
    """Return a greeting."""
    return "Hello, World!"
EOF
    echo "✅ Created skeleton package"
    ;;
  *)
    echo "Invalid choice"
    exit 1
    ;;
esac

# 2. Update pyproject.toml
# Using Python rather than StreamEDitor for cross-platform compatibility
echo "   Updating pyproject.toml..."

export PKG_NAME="$PKG_NAME" # Export for Python to access

python3 << 'PYTHON_SCRIPT'
from pathlib import Path
import os
import re

pkg_name = os.environ.get('PKG_NAME', 'my_project')  # Read from environment
pyproject = Path('pyproject.toml')
content = pyproject.read_text()

# Replace package-mode = false with true
content = content.replace('package-mode = false', 'package-mode = true')

# Add packages definition after [tool.poetry] section
if 'packages = []' not in content:
    pattern = r'(\[tool\.poetry\].*?)(\n)'      # Find [tool.poetry] section
    match = re.search(pattern, content, re.DOTALL)
    if match:
        insertion = f'\npackages = [\n    {{ include = "{pkg_name}" }}\n]\n'     # Use pkg_name variable
        content = content[:match.end()-1] + insertion + content[match.end()-1:]

pyproject.write_text(content)
print("   ✅ pyproject.toml updated")
PYTHON_SCRIPT

# 3. Create package directory structure (only if not already created by Choice 3)
echo "   Creating package directory structure..."

# Only create if it doesn't exist yet (Choice 3 already created it)
if [ ! -d "$PKG_NAME" ]; then
    mkdir -p "$PKG_NAME"
    touch "$PKG_NAME/__init__.py"
fi
# Only create sample module if it doesn't exist
if [ ! -f "$PKG_NAME/sample_module.py" ]; then
    cat > "$PKG_NAME/sample_module.py" << EOF

"""
Sample module for testing autodoc integration:
"""

def hello_world():
    """
    A simple function to demonstrate autodoc.

    Returns:
        str: A greeting message.
    """
    return "Hello, World!"

class Calculator:
    """
    A simple calculator class.
    """
    def add(self, a, b):
        """Add two numbers."""
        return a + b
EOF
    echo "   ✅ Created sample_module.py"
fi
# 4. Remove mock imports in conf.py which was preventing errors when it looked for a python module
echo "   Cleaning up docs/source/conf.py..."

export PKG_NAME="$PKG_NAME"  # Export for Python to access

python3 << 'PYTHON_SCRIPT'
from pathlib import Path
import os
import re

conf_file = Path('docs/source/conf.py')
if not conf_file.exists():
    print("   ⚠️ conf.py not found, skipping cleanup.")
    exit(0)

content = conf_file.read_text()
lines = content.splitlines()

# Filter out the specific line
# We check if the line contains the specific assignment to be safe
filtered_lines = [
    line for line in lines
    if "autodoc_mock_imports" not in line or "'pymodulefordocs'" not in line
]

# Join back and write
new_content = "\n".join(filtered_lines)
# Ensure file ends with a newline if it had one originally
if content.endswith("\n"):
    new_content += "\n"

conf_file.write_text(new_content)
print("   ✅ Removed mock import line from conf.py")
PYTHON_SCRIPT

# 5. Updating API reference
echo "   Updating docs/source/modules.rst..."
cat > docs/source/modules.rst << EOF
API Reference
=============

.. automodule:: $PKG_NAME
   :members:
   :undoc-members:
   :show-inheritance:
EOF

# 6. Installing Poetry package with development extras
echo "   Installing Poetry in development mode..."
poetry install --with dev

echo ""
echo "✅ Setup Complete!"
echo ""
echo "Next Steps:"
echo "1. Edit your Python files (e.g., '$PKG_NAME/__init__.py') to add your actual code."
echo "2. Add descriptions (docstrings) inside the code for your functions/classes so Sphinx can auto-generate your docs."
# 2. Add docstrings to your functions/classes.
#    Sphinx uses these to automatically generate the API documentation.
#    Example:
#      def my_function(arg):
#          """
#          Brief description.
#
#          Args:
#              arg (type): Description of arg.
#
#          Returns:
#              type: Description of return value.
#          """
#          pass
echo "3. Run 'poetry run sphinx-build -b html docs/source docs/_build/html' to test."
echo "4. (if needed) Update 'docs/source/modules.rst' to include any new modules added after autogeneration."
# 4. Update 'docs/source/modules.rst' to include the new API reference if needed.
#    You only need to do this if you added a NEW .py file (module) to your project.
#    If you only changed code inside existing files, skip this step.
#    To add a new module, add a line like:
#      .. automodule:: my_project.new_module
#         :members:
echo ""
echo "Your package is now ready for documentation!"
