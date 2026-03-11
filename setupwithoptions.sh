#!/usr/bin/env bash
# -------------------------------------------------
# setupwithoptions.sh – bootstrap a development environment
# -------------------------------------------------
set -euo pipefail

# ---------- Helper ----------
header() {
  echo -e "\n=== $1 ===\n"
}

# ---------- 1. Verify prerequisites ----------
header "Checking prerequisites"
command -v python3 >/dev/null || { echo "❌ Python 3 not found."; exit 1; }
command -v poetry >/dev/null || { echo "❌ Poetry not found. Install it from https://python-poetry.org/docs/#installation"; exit 1; }
command -v git >/dev/null || { echo "❌ Git not found."; exit 1; }

# ---------- 2. Optional Git identity ----------
if ! git config --global user.name >/dev/null || ! git config --global user.email >/dev/null; then
  header "Configuring Git identity"
  read -rp "Enter your full name for Git commits: " GIT_NAME
  read -rp "Enter your email address for Git commits: " GIT_EMAIL

  # Trim whitespace (bash 4.4+)
  GIT_NAME="${GIT_NAME#"${GIT_NAME%%[![:space:]]*}"}"
  GIT_NAME="${GIT_NAME%"${GIT_NAME##*[![:space:]]}"}"
  GIT_EMAIL="${GIT_EMAIL#"${GIT_EMAIL%%[![:space:]]*}"}"
  GIT_EMAIL="${GIT_EMAIL%"${GIT_EMAIL##*[![:space:]]}"}"

  if [[ -n "$GIT_NAME" && -n "$GIT_EMAIL" ]]; then
    git config --global user.name "$GIT_NAME"
    git config --global user.email "$GIT_EMAIL"
    echo "✅ Git identity set to \"$GIT_NAME <$GIT_EMAIL>\""
  else
    echo "⚠️  Skipping Git configuration – name or email was empty."
  fi
else
  echo "✅ Git identity already configured:"
  echo "    $(git config --global user.name) <$(git config --global user.email)>"
fi

# ---------- 3. Create / activate Poetry venv ----------
header "Creating/activating Poetry virtual environment"
poetry env info >/dev/null 2>&1 || poetry install --no-root

# ---------- 4. Choose dependency group ----------
header "Choose dependency set"
echo "Which set of dependencies should be installed?"
echo "  1) Full development environment (tests, linting, docs) – '--with dev'"
echo "  2) Documentation‑only environment – '--with docs'"
read -rp "Enter 1 or 2 [default: 1]: " choice
choice=${choice:-1}
case "$choice" in
  1) GROUP="dev" ;;
  2) GROUP="docs" ;;
  *) echo "Invalid choice – aborting."; exit 1 ;;
esac

# ---------- 5. Install chosen dependencies ----------
header "Installing dependencies (--with $GROUP)"
poetry install --with "$GROUP"

# ---------- 6. Quick sanity check ----------
header "Running a quick sanity check (Sphinx build)"
poetry run sphinx-build -b html docs docs/_build/html

# ---------- 7. Finished ----------
echo -e "\n✅ Setup complete! 🎉"
echo "You installed the \"$GROUP\" group."
echo "Common commands you may now use:"
if [[ "$GROUP" == "dev" ]]; then
  echo "  • Build docs:      poetry run sphinx-build -b html docs docs/_build/html"
  echo "  • Run tests:      poetry run pytest"
  echo "  • Lint code:      poetry run ruff check ."
else
  echo "  • Build docs:      poetry run sphinx-build -b html docs docs/_build/html"
fi
