#!/usr/bin/env bash
# setup_for_contributors.sh
#
# NOTE: We use SINGLE $ for variables (e.g., $PKG_NAME).
#       Do NOT use $$ (that expands to the Process ID in Bash!).
#       $$ is only for Makefiles or escaping in specific contexts.

set -euo pipefail

# ---------- Colour Definitions ----------
# These are ANSI escape codes for coloured text so it's easier to edit.
# Also checks for a NO_COLOR environment variable: https://no-color.org/
if [[ -n "${NO_COLOR:-}" ]]; then
    RED=''
    GREEN=''
    YELLOW=''
    BLUE=''
    CYAN=''
    NC=''
else
    RED='\033[0;31m'
    GREEN='\033[0;32m'
    YELLOW='\033[1;33m'
    BLUE='\033[0;34m'
    CYAN='\033[0;36m'
    NC='\033[0m' # No Color (reset)
fi

# And some formatting:
BOLD='\033[1m'
UNDERLINE='\033[4m'

# See https://cis106.com/bash/ANSI_escape_sequences/ for more examples.

# ---------- Formatting Functions (Helper Functions) ----------
header() {
  echo -e "\n${CYAN}${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
  echo -e "${CYAN}${BOLD}  $1${NC}"
  echo -e "${CYAN}${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}\n"
}

# Symbols work everywhere, regardless of color scheme
success() {
  echo -e "${GREEN}✓${NC} $1"
}

error() {
  echo -e "${RED}✗${NC} $1"
}

info() {
  echo -e "${BOLD}${CYAN}ℹ${NC} $1"
}

warning() {
  echo -e "${YELLOW}⚠${NC} $1"
}

# SCRIPT START

# ---------- 1. Verify prerequisites ----------
header "Checking you have everything needed..."
echo "We need to make sure you have the right tools installed:"
echo -e "  ${BOLD}${CYAN}• Python 3${NC}"
echo -e "  ${BOLD}${CYAN}• Poetry${NC}"
echo -e "  ${BOLD}${CYAN}• Git${NC}"
echo ""

echo "Checking prerequisites..."
echo ""
# Check for Python
command -v python3 >/dev/null || { echo -e "${RED}✗ Python 3 not found.${NC}"; exit 1; }

# Check for and install Poetry
if ! command -v poetry >/dev/null 2>&1; then
    warning "Poetry not found. Installing now..."

    # Official installer script
    # We use curl and pipe to python3
    if curl -sSL https://install.python-poetry.org | python3 -; then
        success "Poetry installed successfully!"

        # Add Poetry to PATH if it's not already there
        # This ensures 'poetry' command works immediately in the current shell
        POETRY_BIN="$HOME/.local/bin"
        if [[ ":$PATH:" != *":$POETRY_BIN:"* ]]; then
            echo ""
            info "Adding Poetry to PATH for this session..."
            export PATH="$POETRY_BIN:$PATH"

            # Optional: Tell user to add it permanently
            echo ""
            info "To make this permanent, add this to your ~/.bashrc or ~/.zshrc:"
            echo "   export PATH=\"$POETRY_BIN:\$PATH\""
        fi
    else
        error "Failed to install Poetry. Please install it manually from https://python-poetry.org/docs/"
        exit 1
    fi
else
    success "Poetry is already installed."
    poetry --version
fi

# Optional: Check Poetry version
POETRY_VER=$(poetry --version | awk '{print $3}' | tr -d '()')
if [[ $$(echo "$POETRY_VER < 1.8.0" | bc -l) -eq 1 ]]; then
    warning "Poetry version $POETRY_VER detected. Version 1.8+ recommended for best compatibility."
    # You could force upgrade here if you want:
    # poetry self update
fi

# Check Git
echo ""
command -v git >/dev/null || { echo -e "${RED}✗ Git not found.${NC}"; exit 1; }
echo ""

echo ""
success "All required tools are installed!"
echo ""

# ---------- 2. Git identity verification ----------
if ! git config --global user.name >/dev/null || ! git config --global user.email >/dev/null; then
  header "Setting up your Git edentity..."
  info "This helps track of who made changes to the documentation and provides attribution."
  echo ""
  read -rp "$(echo -e ${CYAN}Enter the name you want listed on your commits on GitHub:${NC} )" GIT_NAME
  read -rp "$(echo -e ${CYAN}Enter your email address you want associated with commits:${NC} )" GIT_EMAIL
  echo ""

  # Trim whitespace (bash 4.4+)
  GIT_NAME="${GIT_NAME#"${GIT_NAME%%[![:space:]]*}"}"
  GIT_NAME="${GIT_NAME%"${GIT_NAME##*[![:space:]]}"}"
  GIT_EMAIL="${GIT_EMAIL#"${GIT_EMAIL%%[![:space:]]*}"}"
  GIT_EMAIL="${GIT_EMAIL%"${GIT_EMAIL##*[![:space:]]}"}"
  success "Git identity saved!"

  if [[ -n "$GIT_NAME" && -n "$GIT_EMAIL" ]]; then
    git config --global user.name "$GIT_NAME"
    git config --global user.email "$GIT_EMAIL"
    success "Git identity set to \"$GIT_NAME <$GIT_EMAIL>\""
  else
    warning "Skipping Git configuration – name or email was empty!"
    echo ""
    info       "To set up your credentials later, open a terminal and type the following:"
    echo -e "    ${CYAN}git config --global user.name \"Your Name\"${NC}"
    echo -e "    ${CYAN}git config --global user.email \"your@email.com\"${NC}"
  fi
else
  success "Git identity already configured:"
  echo -e "    ${CYAN}$(git config --global user.name)${NC} <$(git config --global user.email)>"
  echo ""
  info       "If you need to change your credentials later, open a terminal and type the following:"
  echo -e "    ${CYAN}git config --global user.name \"Your Name\"${NC}"
  echo -e "    ${CYAN}git config --global user.email \"your@email.com\"${NC}"
fi

# ---------- 3. Create & activate Poetry venv ----------
header "Making your local workspace..."
# "Creating and activating the Poetry virtual environment"
echo "Creating a private space for the project's tools for you..."
info "This won't affect other programs on your computer, nor your local Python installations."
poetry env info >/dev/null 2>&1 || poetry install --no-root

# ---------- 4. Choose dependency group ----------
header "Choosing your tools:"
# "Which set of dependencies should be installed?"
echo -e "  ${YELLOW} What do you want to do?${NC}"
echo ""
echo -e "  ${CYAN}1.${NC} ${BOLD}Write documentation only (lightweight)${NC}"
echo -e "  ${CYAN}2.${NC} ${BOLD}Write + test + lint (full development tools for project administration)${NC}"
echo ""
echo -e "${YELLOW}Enter ${CYAN}1 ${YELLOW}for light or ${CYAN}2 ${YELLOW}for development [default: 1]: ${NC}"
read group_choice
group_choice="${group_choice// /}"  # Remove all spaces
group_choice=${group_choice:-1}
case "$group_choice" in
  1) GROUP="docs" ;;
  2) GROUP="dev" ;;
  *) echo "Invalid choice – Please rerun this script."; exit 1 ;;
esac

# ---------- 5. Optionally delete old build files ----------
header "Choosing build options:"
echo -e "  ${YELLOW} Would you like to start fresh or update existing documentation?${NC}"
echo ""
echo -e "  ${CYAN}1.${NC} ${BOLD}Start fresh (recommended for first-time setup or troubleshooting)${NC}"
echo -e "  ${CYAN}2.${NC} ${BOLD}Update existing (faster for regular edits)${NC}"
echo ""
echo -e "${YELLOW}Enter ${CYAN}1 ${YELLOW}to start fresh or ${CYAN}2 ${YELLOW}to update [default: 2]: ${NC}"
read clean_choice
clean_choice="${clean_choice// /}"  # Remove all spaces
clean_choice=${clean_choice:-2}
case "$clean_choice" in
  1) CLEAN_BUILD=true ;;
  2) CLEAN_BUILD=false ;;
  *) echo -e "Invalid choice – Please rerun this script."; exit 1 ;;
esac

# ---------- 6. Install chosen dependencies ----------
header "Installing tools..."
poetry install --with "$GROUP"
success "Tools installed!"
info "Lock file determines project set up parameters."

#  ---------- 7. Clean Previous Build (if selected) ----------
if [[ "$CLEAN_BUILD" == "true" ]]; then
  header "Cleaning previous build..."
  rm -rf docs/_build/
  success "Old build files removed successfully!"
fi

# ---------- 8. Sanity check ----------
header "Setting up Sphinx for Read the Docs..."
poetry run sphinx-build -b html docs/source docs/_build/html
info "${RED}Red${NC} warnings about 'mock' objects are correct and safe!"
echo ""
echo -e "${YELLOW}.rst${NC} files are in ${YELLOW}docs/source${NC} "
echo   "These are what you'll be editing. See HELP PAGE ON WRITING/FORMATING MD PLACEHOLDER"
echo ""
success "Set up successful!"
echo ""

# ---------- 9. Finished ----------
echo ""
echo -e "${GREEN}${BOLD}╔════════════════════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}${BOLD}║                                                            ║${NC}"
echo -e "${GREEN}${BOLD}║          ${GREEN}${BOLD}Setup Complete! You're ready to write!${NC}            ${GREEN}${BOLD}║${NC}"
echo -e "${GREEN}${BOLD}║                                                            ║${NC}"
echo -e "${GREEN}${BOLD}╚════════════════════════════════════════════════════════════╝${NC}"
echo ""
echo ""
echo -e "${BOLD}Next Steps:${NC}"
echo ""
echo -e "  ${CYAN}1.${NC} Open the ${BOLD}docs/source/${NC} folder in your text editor"
echo -e "  ${CYAN}2.${NC} Edit ${YELLOW}.rst${NC} files to add your content"
info " See the ${BOLD}README.md${NC} for setting up ${CYAN}VSCodium${NC} or ${CYAN}VSCode${NC} to open and start working with ${YELLOW}.rst${NC} files."
echo "   You can preview files directly in your text editor instead of building the project locally."
echo -e "  ${CYAN}3.${NC} Use your text editor's Github extension to push your changes to Github."
echo ""
info " Advanced users can use the terminal for this instead:"
echo -e "  ${CYAN}3.${NC} Run ${BOLD}poetry run sphinx-build -b html docs/source docs/_build/html${NC}"
echo -e "  ${CYAN}4.${NC} Open ${BOLD}docs/_build/html/index.html${NC} in your browser"
echo -e "  ${CYAN}5.${NC} Push your changes to Github the usual way"
echo ""
if [[ "$GROUP" == "dev" ]]; then
  echo -e "  ${BOLD}${CYAN}•${NC}Build docs:     poetry run sphinx-build -b html docs/source docs/_build/html"
  echo -e "  ${BOLD}${CYAN}•${NC}Run tests:      poetry run pytest"
  echo -e "  ${BOLD}${CYAN}•${NC}Lint code:      poetry run ruff check ."
else
  echo -e "  ${BOLD}${CYAN}•${NC}Build docs:     poetry run sphinx-build -b html docs/source docs/_build/html"
fi

# Troubleshooting tips & links
echo ""
info "Need more help?"
echo -e "  ${BOLD}${CYAN}•${NC} Check out: https://project-violence-docs.readthedocs.io"

# SCRIPT END