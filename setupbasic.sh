 #!/usr/bin/env bash
# -------------------------------------------------
# setup.sh – bootstrap a development environment
# -------------------------------------------------
# 1. Exit on any error
set -euo pipefail

# 2. Helper: print a nice header
header() {
  echo -e "\n=== $1 ===\n"
}

# 3. Ensure required tools are available
header "Checking prerequisites"
command -v python3 >/dev/null || { echo "❌ Python 3 is not installed."; exit 1; }
command -v poetry >/dev/null || { echo "❌ Poetry is not installed. Install it from https://python-poetry.org/docs/#installation"; exit 1; }

# 4. Create (or reuse) a virtual environment
header "Creating/activating Poetry virtual environment"
# Poetry will create the venv automatically if it does not exist
poetry env info >/dev/null 2>&1 || poetry install --no-root

# 5. Install the full development stack (docs + testing + linting)
header "Installing development dependencies"
poetry install --with docs   # change to --with dev if you only need docs

# 6. Optional: run a quick sanity check
header "Running a sanity check (Sphinx build)"
poetry run sphinx-build -b html docs docs/_build/html

# 7. Finished
echo -e "\n✅ Setup complete! 🎉"
echo "You can now:"
echo "  • Run the docs:   poetry run sphinx-build -b html docs docs/_build/html"
echo "If you need to:"
echo "  • Run tests:      poetry run pytest"
echo "  • Lint code:      poetry run ruff check ."
echo "Please rerun setup with --with dev"

