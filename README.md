The Violence Tool Documentation
===============================

**The Violence Tool** is a Python script for Blender that controls layers and creates several additional management options. PLACEHOLDERTEXT

These files are hosted in a more readable format on Read the Docs.io.
https://project-violence-docs.readthedocs.io/en/latest/

For further information contact the repo owner or Fred, the script's developer:
https://www.patreon.com/afoxinspace

 ## Getting Started

### Quick‑start (one‑click)

```bash
git clone https://github.com/yourorg/projectviolencedocs.git
cd projectviolencedocs
chmod +x setupwithoptions.sh
./setupwithoptions.sh
```

The script will:

1. Verify that **Python 3**, **Poetry**, and **Git** and prompt for Git nickname and email if needed.
2. Create (or reuse) a Poetry virtual environment.
3. Install the full development stack (`--with dev` or `--with doc`, which is simpler).
4. Build the documentation once to confirm that everything works.

When the script finishes you can run the most common commands:

| Command                                                 | What it does                     |     |
| ---------------------------------------------------------| ----------------------------------| -----|
| `poetry run sphinx-build -b html docs docs/_build/html` | Build the documentation locally. |     |
| `poetry run pytest`                                     | Execute the test suite.          |     |
| `poetry run ruff check .`                               | Lint the source code.            |     |

You'll then have to install VSCodium and add the extensions below.
---

### Step‑by‑step setup (manual control)

1. **Git** – Install Git (default settings are fine) and configure your name and email.
2. **Editor** – WeI recommend **VSCodium** (the open‑source build of VS Code). It has plenty of extensions without Microsoft the MS stuff.
3. **GitHub account** – Sign up for GitHub if you don’t already have one; it is the remote where the repository lives and where pull‑requests are created.
4. **Read the Docs** – The documentation site automatically rebuilds whenever a merged pull‑request updates the `docs/` directory, so you only need to focus on the source files.

---

### Cloning the repository from VSCodium

1. Open VSCodium → **View → Command Palette** (`Ctrl+Shift+P`).
2. Run **“Git: Clone”**.
3. Paste `https://github.com/Danweel/ProjectViolenceDocs.git` and press **Enter**.
4. Choose a local folder; VSCodium will open the repository automatically.

---

### Running the setup script manually

If you prefer not to use the one‑click version, open a terminal in the repository root (or use the integrated terminal in VSCodium) and execute:

```bash
chmod +x setupbasic.sh   # make the script executable
./setupbasic.sh          # installs all dependencies and builds the docs
```

After the script completes, you are ready to edit, test, and preview the documentation.

---

#### Recommended VSCodium extensions

| Extension                    | Install command                                                  | Why you need it                                                                        |
| ------------------------------| ------------------------------------------------------------------| ----------------------------------------------------------------------------------------|
| **Esbonio**                  | `code --install-extension swyddfa.esbonio`                       | Live Sphinx preview, directive/role completion, inline diagnostics.                    |
| **Python**                   | `code --install-extension ms-python.python`                      | IntelliSense, linting, and virtual‑env activation for `conf.py` and custom extensions. |
| **GitHub Pull‑Request**      | `code --install-extension GitHub.vscode-pull-request-github`     | Create, review, and checkout PRs without leaving the editor.                           |
| **GitLens**                  | `code --install-extension eamodio.gitlens`                       | Inline blame, history, and repository insights.                                        |
| **Code Spell Checker**       | `code --install-extension streetsidesoftware.code-spell-checker` | Highlights misspellings in `.rst` and `.md` files.                                     |
| **Markdown All‑in‑One**      | `code --install-extension yzhang.markdown-all-in-one`            | Syntax highlighting, preview, and linting for any Markdown files.                      |
| **EditorConfig**             | `code --install-extension EditorConfig.EditorConfig`             | Enforces the project’s indentation, line‑ending, and charset rules.                    |
| **Nearest venv interpreter** | `code --install-extension thespacebar.nearest-venv`              | Will make sure VSCodium handles the interpreter for you.                               |

[![Install extensions](https://img.shields.io/badge/Install%20extensions-Click%20to%20install-blue?logo=visual-studio-code)](vscode://vscode.github-authentication/did-authenticate?windowId=1&extensionIds=svydfa.esbonio,ms-python.python,GitHub.vscode-pull-request-github,eamodio.gitlens,streetsidesoftware.code-spell-checker,EditorConfig.EditorConfig,yzhang.markdown-all-in-one,thespacebar.nearest-venv)

*Click the badge to install all of the above extensions automatically.*