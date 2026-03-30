# Re-Enabling Python Project Integration
## What's Currently Disabled

| Component | Status | Why It's Off |
|-----------|--------|--------------|
| `sphinx.ext.autodoc` | ✅ Enabled in `conf.py` | No code to document |
| `modules.rst` | ✅ Exists | References non-existent `pymodulefordocs` package |
| `pyproject.toml` | ✅ `package-mode = false` | Tells Poetry this isn't a Python package |
| `pymodulefordocs/` | ❌ Missing | No actual Python package directory |

### Quick Comparison: Pure Docs vs. Python Package
| Feature | Pure Docs Template | Python Package Template |
|---------|-------------------|------------------------|
| `package-mode` | `false` | `true` |
| `modules.rst` | Placeholder | Autodoc directives |
| `conf.py` path | Not needed | `sys.path.insert()` |
| Dependencies | Sphinx only | Sphinx + your package |
| Build command | `sphinx-build` | `poetry install` + `sphinx-build` |
| Best for | User guides, wikis | API references, SDK docs |

---
## Step-by-Step Re-Enablement
### 1. Convert to Python Package Mode

#### Update pyproject.toml:
```
[tool.poetry]
package-mode = true  # ← Change from false to true
packages = [
    { include = "your_package_name" }  # ← Add your actual package
]
```

**Example**:
```
[tool.poetry]
name = "your-project"
version = "0.1.0"
package-mode = true
packages = [
    { include = "your_project" }
]
```
### 2. Create Your Python Package Structure
```
your-project/
├── your_project/           # ← Your actual Python package
│   ├── __init__.py
│   ├── module1.py
│   └── module2.py
├── docs/
│   ├── source/
│   │   ├── conf.py
│   │   ├── index.rst
│   │   └── modules.rst
│   └── _build/
├── pyproject.toml
└── README.md
```
### 3. Update docs/source/conf.py

#### Configure Extensions:
Add the following to your `docs/source/conf.py` file:

```python
extensions = [
    'sphinx.ext.autodoc',      # Auto-generate docs from docstrings
    'sphinx.ext.viewcode',     # Add links to source code
    'sphinx.ext.napoleon',     # Support Google/NumPy style docstrings
    'sphinx.ext.intersphinx',  # Link to external docs (Python stdlib, etc.)
    # ... your other extensions
]
```
#### Add Your Package to the Path:
At the top of docs/source/conf.py (before the extensions list), add:
```
import os
import sys
sys.path.insert(0, os.path.abspath('../../'))  # Adjust path to your package
```

### 4. Update docs/source/modules.rst
#### Replace the placeholder with autodoc directives:
```
API Reference
=============

.. automodule:: your_project
   :members:
   :undoc-members:
   :show-inheritance:

```
#### Or use autosummary for automatic generation:
```
API Reference
=============

.. autosummary::
   :toctree: api
   :recursive:

   your_project
   your_project.module1
   your_project.module2
```
#### Update pyproject.toml to include testing tools:
```
[tool.poetry.group.dev.dependencies]
pytest = "^8.0"           # For testing
pytest-cov = "^4.0"       # For coverage reports
sphinx-autobuild = "^2024.2"  # Live reload during development
```
This will make sure when you build in step 6, it includes these extra tools if wanted.

### 5. Install Your Package in Development Mode
```
# From project root
poetry install --with dev

# This installs your package with editable mode (-e flag)
# Changes to your code reflect immediately in docs without reinstalling
```
### 6. Build and Verify
```
# Clean old build artifacts
rm -rf docs/_build/

# Build documentation & Check for warnings about missing modules
poetry run sphinx-build -b html docs/source docs/_build/html -W
```

## Common Issues & Solutions

| Issue | Solution |
|-------|----------|
| `ModuleNotFoundError` | Ensure `sys.path.insert(0, ...)` in `conf.py` points to the correct location |
| Empty autodoc output | Add proper docstrings to your functions/classes |
| Circular imports | Restructure your package or use `autodoc_mock_imports` in `conf.py` |
| RTD build fails | Add `requirements.txt` or ensure `pyproject.toml` lists all dependencies |
| Missing `__init__.py` | Create empty `__init__.py` in each package directory |

---
## Prerequisites for the Python program
### 1. Package Structure Requirements

Your Python code must be a proper package (not just loose .py files):
```
✅ CORRECT (Package):

my_project/
├── __init__.py          # Required! Marks this as a package
├── module1.py
└── subpackage/
    ├── __init__.py
    └── module2.py

❌ INCORRECT (Loose files):

scripts/
├── utils.py             # Not a package - autodoc won't find it
└── helpers.py
```
### 2. Docstring Requirements

Autodoc extracts documentation from docstrings. Without them, you get empty API docs.
This means going through your code and adding these docstrings so Autodoc can pick them up, this gives you well-annotated code and docs without having to do them seperately.
You may already have notes throughout your code already, so simply format those like the following:
```
 ❌ No docstring = empty documentation

def calculate(a, b):
    return a + b
```
```
 ✅ Google-style docstring

def calculate(a, b):
    """
    Add two numbers together.

    Args:
        a (int): First number
        b (int): Second number

    Returns:
        int: The sum of a and b

    Raises:
        TypeError: If inputs are not numbers
    """
    return a + b
```
```
 ✅ NumPy-style docstring (also supported via napoleon)

def calculate(a, b):
    """
    Add two numbers together.

    Parameters
    ----------
    a : int
        First number
    b : int
        Second number

    Returns
    -------
    int
        The sum of a and b
    """
    return a + b
```
### 3. Import Requirements

Your package must be importable. Test this before documenting:
```
# From your project root
python -c "import your_package; print(your_package.__file__)"
```
If this fails, autodoc will fail too.