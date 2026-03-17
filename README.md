The Violence Tool Documentation
===============================

**The Violence Tool** is a Python script for Blender 4.1 and 4.1.1 that controls layers and creates several additional management options.

These files are hosted on Read the Docs.io: [The Violence Tool Documentation](https://project-violence-docs.readthedocs.io/en/latest/)

## Features
TODO: #4 Describe each of the major features of The Violence Tool

 ## Contributing

# Contributing
We're glad to have you!

Familiarize yourself with the basic conventions for submitting issues and contributions below. It helps the maintainers focus on fixing issues rather than handling the database. Thank you!

---

## Pulling the repository versus submitting content through github
### What kind of contributor do you plan to be?

- Tips, tricks, even how-tos can be submitted wholesale through the bug system here. A maintainer will add the info to the site in the right place or ask follow up questions where necessary. This is a good option if you only have small suggestions or a one-off solution to contribute. When doing so, please use the tag (Label) system outlined below.

- If you're planning longer term contributions it may be worthwhile to pull the whole project and work on it on your computer. I've created a setup-for-contributors.sh script file that will help set up the entire environment for you so all you need to do is have a text editor like VSCode or VSCodium installed to edit the .rst files (which then get pushed to the website as html automatically). Ask us if you have any trouble after downloading the repo onto your computer and running the script. Once you've finished writing, you'll submit your content for review. [Detailed instructions are incoming.](https://github.com/Danweel/ProjectViolenceDocs/issues/2)

---

## Labels (essentially, tags)

It may be overkill for a website, but I'm using the A, B, C, bug system, with just two levels of severity.

- **A class** issues break the site or, in terms of wrong content, major missing feature write up or dangerously wrong instructions.
- **B class** issues generally prevent some sort of mechanical use of a page or function such as a bad link, wrong steps or misleading screencaps.
- **C class** issues tend to be more superficial - typos, graphical errors, instructions that could be clearer, formatting and other ugly or confusing things. They can also be suggestions.

- High and Low severity just further breaks down the classes at a glance and are somewhat subjective. 

Don't worry about getting it exactly right, and don't fight with the maintainers if they change your tags. Someone is trying to keep the overall database tidy.

There are several other tags that can be used to further define aspects of the bug. Take a look at the [Labels](https://github.com/Danweel/ProjectViolenceDocs/labels) page to see the options and definitions. This helps maintainers and helpers sort bugs by their relevant attributes.

---

TODO: #5 Instructions on how to install things for contributors can be simplified quite a bit now, and need updating:

## Quick‑start with the terminal

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
| **Auto Open Preview Panel**  | `code --install-extension matt-rudge.auto-open-preview-panel`    | Opens a preview panel when it detects a compatible file format.                        |
| **Nearest venv interpreter** | `code --install-extension thespacebar.nearest-venv`              | Will make sure VSCodium handles the interpreter for you.                               |

[![Install extensions](https://img.shields.io/badge/Install%20extensions-Click%20to%20install-blue?logo=visual-studio-code)](vscode://vscode.github-authentication/did-authenticate?windowId=1&extensionIds=svydfa.esbonio,ms-python.python,GitHub.vscode-pull-request-github,eamodio.gitlens,streetsidesoftware.code-spell-checker,EditorConfig.EditorConfig,yzhang.markdown-all-in-one,thespacebar.nearest-venv)

*Click the badge to install all of the above extensions automatically if you already have VSCodium installed.*

*(TODO: #3 Should probably include a similar badge for the VSCode equivalents since they are most likely the same/similar for the README)  

--- 

For further information on this Github page, contact the current repo owner.
Please support the development of this tool and maintenance of the docs:
https://www.patreon.com/afoxinspace