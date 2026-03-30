# About

**A minimal, production-ready documentation template** primarily for non-developers and business professionals. Built with [Sphinx](https://www.sphinx-doc.org/en/master/#), [Poetry](https://python-poetry.org/) for [Read the Docs](https://about.readthedocs.com/) and supports both [Markdown](https://www.markdownlang.com/basic/overview.html) and [reStructuredText](https://devguide.python.org/documentation/markup/).

Perfect for creating **Employee Handbooks**, **Business Processes**, **Game Design Docs** for proposals, or **User Guides** on Read the Docs easily. It automates much of the initial set up to provide a basic project, giving you a clean, version-controlled starting point.

> *Need to add code?* No problem! Run `./setup-python.sh` to enable full Python package integration.

**Why this template?** Read the Docs setup can be confusing. This template provides a pre-configured foundation that works out of the box. You get professional documentation hosting without wrestling with configuration files (too much).

[![License: CC BY-NC-SA 4.0](https://img.shields.io/badge/License-CC%20BY--NC--SA%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by-nc-sa/4.0/)
---

# Quick Start

## 0. Prerequisites

- **Python 3.11+ minimum, 3.12+ preferred**
- **Git** - Using [GitHub Desktop](https://github.com/apps/desktop) can handle this for you (Linux users run `sudo apt update && sudo apt install git -y`)
- **Poetry**
- A coding text editor (IDE), recommended: VSCodium if you have no previous preference.

If you are not sure, the script will inform you which are missing and safely exit when you try to run it.

If you are aware you do not have Python3.11+ or Git installed, install these from thier respective websites.
Recommended is [Python 3.12](https://www.python.org/downloads/), and [Github Desktop](https://desktop.github.com/download/) if you have no other experience or preference.

The script will detect your OS and install [Poetry](https://python-poetry.org/) for you automatically.

>### Windows Users
>This template uses Bash scripts for setup*. To run them:
>
>- **Install Git for Windows** (if you haven't already): [Download here](https://git-scm.com/download/win)
>- Right-click your project folder and select **"Git Bash Here"**.
>- Run the setup command: `./setup-python.sh`
>
>*The curl syntax differs slightly, so avoid PowerShell in this instance.

## 1. Clone the repository
```
   git clone https://github.com/[USERNAME]/[REPO-NAME].git
   cd [REPO-NAME]
```

Or use Github Desktop to clone the `.git` at the URL above via the onscreen directions.

## 2. Open the local folder for the repo and run `./setup_for_contributors.sh`

The script will:

   ✅ Check for prerequisites (Python, Git, Poetry)

   ✅ Install Poetry if missing

   ✅ Automatically run `poetry lock` and `poetry install` to set up dependencies

   ✅ Ask for or set up your Git credentials (if needed)

   ✅ Offer two setup paths:

      Option A: For Contributors (minimal tools for just docs)
      Option B: For Developers (includes linting & extra tools)


>⚠️ **Important**: The template contains placeholders that must be replaced before the project will build.
>
>If you see an error like `project.name must match pattern...`, it means you haven't updated `pyproject.toml` yet.
>
>Stop here and complete the [Find-and-Replace Checklist](#-find-and-replace-checklist) below, then run `./setup_for_contributors.sh` again.

## 3. Building Documentation Locally

Once the setup script completes successfully, build the docs:
```
poetry run sphinx-build -b html docs/source docs/_build/html
```
Open docs/_build/html/index.html in your browser (or use a VSCodium extension preview) to view the documentation.

## 4. Write content (manually)

Open the `docs/source/` folder in your text editor and start editing:

    .rst files for reStructuredText (recommended for index.rst)
    .md files for Markdown (enabled via included MyST parser)

The index.rst file is more robust using reStructuredText, but can be done in Markdown.

>Markdown is much easier for people to learn at first, and RST is an advanced version of it. New files can be made in either.

>Markdown is not native to Read the Docs, but it is included here to help more people write for it quicker as it can be, mostly, learned in a day or kept on a cheat sheet.

>RTD in other projects you encounter may include only RST files since more complex projects will find .md insufficient organisationally.

>⚠️ This setup assumes you are not automating your content from a coding project. There are good reasons to write manually for code for smaller projects even when there **is** code involved. Further, if you decide to add this functionality later, this >is possible via the included `.setup-python.sh`.

## 5. Hosting Your Documentation

This project will set up **dual hosting** automatically for maximum accessibility:

### Primary: [Read the Docs](https://about.readthedocs.com/company/)
Read the Docs provides automatic builds on every commit, version management, and professional hosting.
It is completely free, with one small ad on the left hand side provided by ethicalads.io
Or, you can pay 5$ to remove ads from all your projects to help support the Read the Docs project.

**Why RTD is worth the setup:**
- **Automatic builds**: Every push to your repository triggers a new build
- **Version management**: Each Git tag becomes a separate documentation version (e.g., v1.0, v1.1)
- **Professional hosting**: Clean URLs like `yourproject.readthedocs.io`
- **Built-in search**: Full-text search across all pages
- **Free tier**: Open-source projects hosted for free

**Setup Steps:**

1. **Create a Read the Docs Account**
   - Go to [readthedocs.org](https://readthedocs.org)
   - Sign in with your GitHub account (easiest method)

2. **Import Your Repository**
   - Click **Import a Project** → **Connect GitHub**
   - Find your repository in the list
   - Click **Import**

3. **Configure Build Settings** (Critical Step)
   - Under **Advanced Settings**, set:
     - **Python Version**: `3.11` or higher
     - **Configuration File Path**: `pyproject.toml` (or `docs/conf.py` if you prefer)
     - **Requirements File**: Leave blank (Poetry handles this)
   - **Build Command**: Leave default (Sphinx will use `poetry install` automatically)

4. **Wait for First Build**
   - RTD will automatically build your documentation
   - Check **Builds** tab for progress
   - First build may take 2-5 minutes

5. **Custom Domain (Optional)**
   - In RTD dashboard → **Admin** → **Domains**
   - Add your custom domain (e.g., `docs.yourproject.com`)
   - Update DNS records as instructed (CNAME to `[PROJECT-SLUG].readthedocs.io`)

**Troubleshooting RTD Builds:**
| Issue | Solution |
|-------|----------|
| "Build failed" with no error | Check **Build Logs** → expand the "Install" section |
| Missing dependencies | Ensure `pyproject.toml` lists all Sphinx extensions |
| Python version mismatch | Set Python version to 3.11+ in RTD Advanced Settings |
| Configuration file not found | Verify `pyproject.toml` or `docs/conf.py` is in repository root |

### Mirror: GitHub Pages
GitHub Pages provides a fast mirror for quick access and offline viewing. It is less powerful than RTD but requires zero configuration beyond the initial setup.

**Why use GitHub Pages as a mirror:**
- **No external dependency**: Documentation stays within GitHub ecosystem
- **Easy rollback**: Simply revert commits to restore previous versions
- **Offline viewing**: Download the HTML for local browsing
- **Faster load times**: Served from the GitHub CDN (though, this is marginal unless the docs are huge)
- **Not flexible**: You are not able to serve more than one version of your docs at a time, it will always be the most recent one. On RTD, you can set different versions, this is in case someone is using an older version of your application. A good example of a usecase for multiple available versions of documentation are the docs for Blender, where people could be using any one of their versions; 2.8, 3.8, 4.3 and 5.1 are all popular choices in use today.

**Setup Steps:**
1. Go to your repository **Settings** → **Pages**
2. Under **Source**, select:
   - **Branch**: `main`
   - **Folder**: `/docs/_build/html/`
3. Click **Save**

**Why Both?**
| Feature | Read the Docs | GitHub Pages |
|---------|---------------|--------------|
| Automatic builds | ✅ Yes (on every commit) | ⚠️ Manual (via workflow) |
| Version history | ✅ Yes (all tags) | ❌ No (latest only) |
| Custom domains | ✅ Yes | ✅ Yes |
| Analytics | ✅ Built-in | ⚠️ Limited |
| Speed | ⚠️ Slower (external) | ✅ Faster (GitHub CDN) |

Use **Read the Docs** as your primary host, and **GitHub Pages** as a backup mirror for quick access.

## 7. Syncing Both Platforms (Optional, recommended)
To keep both in sync there is a GitHub Actions workflow that deploys to both see `.github/workflows/deploy.yml` template.

1.  **Enable GitHub Actions:**
    - Go to your repository **Settings** → **Actions** → **General**.
    - Ensure "Allow all actions and reusable workflows" is selected (default).

2.  **Review the Workflow:**
    - Open `.github/workflows/deploy.yml`.
    - Ensure the `branch` and `folder` paths match your project structure (usually correct by default).

3.  **Trigger the First Run:**
    - Make a small change (e.g., edit `README.md`) and push to `main`.
    - Go to the **Actions** tab to see the workflow run.
    - Once successful, your docs will auto-deploy to GitHub Pages, while Read the Docs handles its own builds.

> **Note:** Read the Docs builds are triggered automatically by their own system when it detects a push to GitHub. This .yml addition only handles the **GitHub Pages** mirror, which is intended. You push to Github, RTD automatically builds your project on their site, meanwhile Github, through the deploy.yml also automatically publishes itself. You need do nothing more than update Github!

## Reference
### Starting Project Structure
```
[REPO-NAME]/
├── docs/
│   ├── source/           # Documentation source files (.rst)
│   │   ├── conf.py       # Sphinx configuration
│   │   └── index.rst     # Main documentation page
│   └── _build/           # Generated HTML (ignored by Git)
├── hooks/                # Git hook scripts
├── setup-hooks.sh        # Hook installation scripts if used
├── pyproject.toml        # Poetry dependencies
└── README.md             # This file, should be replaced by the template filled out
```
`/source` is where you will be editing files, be it the `conf.py`, `.rst` files or `.md` files. Once you "build" the docs locally `/docs` will also have `/_build` in it. These are files that are written and rewritten each time, normally in html (but this is configurable). These are what the websites are really using, not your `/source` files, which are for editing. Sphinx is converting your instructions to html.

### First-Time Setup Checklist
After cloning a new project from this template:

- [ ] Update `pyproject.toml` with your project name and dependencies
- [ ] Update `docs/source/conf.py` with your project details
- [ ] Update `docs/source/index.rst` with your project introduction
- [ ] Replace placeholder content in `usage.rst`, `installation.rst`, etc.
- [ ] Set up Read the Docs (see Hosting section above)
- [ ] Create a README.md like this one that will be on the main page of your Github repo. You can use the `README_template.md` included.
- [ ] Commit initial setup with: `git commit -m "SETUP: Initial template configuration"`
- [ ] Consider optionally setting up Git hooks to control how contributions work.

### Find-and-Replace Checklist

When creating a new project from this template, before your first commit, search for and replace these placeholders:

| Placeholder | Replace With |
| :--- | :--- |
| `[PROJECT NAME]` | Your project display name |
| `[PROJECT-SLUG]` | Lowercase, hyphenated version (e.g., `my-project`) |
| `[REPO-NAME]` | Repository folder name |
| `[USERNAME]` | Your GitHub username |
| `[YOUR NAME]` | Your actual name |
| `[LICENSE NAME]` | Your chosen license (e.g., `MIT`, `CC-BY-SA-4.0`) |

> Look through all the files by hand too. Many contain extra notes I've left that explain certain entries more, and have blanks I may have missed (let me know if you find any!).

### Recommended VSCode/VSCodium Extensions

While not required, these extensions enhance the editing experience for this project:

| Extension | Purpose | Install Link |
| :--- | :--- | :--- |
| **SimpleRST** | Simple syntax highlighting for reStructuredText*  | [Install](vscode:extension/trond-snekvik.simple-rst) |
| **Esbonio** | Live preview for Sphinx docs | [Install](vscode:extension/esbonio.esbonio) |
| **Prettier** | Code formatting | [Install](vscode:extension/esbenp.prettier-vscode) |
| **GitLens** | Enhanced Git blame & history | [Install](vscode:extension/gitkraken.gitlens) |
| **Auto Open Preview** | Opens the preview pane | [Install](vscode:extension/matt-rudge.auto-open-preview-panel) |
| **Highlight Trailing Whitespace** | Good for keeping docs clean | [Install](vscode:extension/ybaumes.highlight-trailing-white-spaces) |
| **Markdown Editor** | Useful if intending to use Markdown | [Install](vscode:extension/zaaack.markdown-editor) |

> *Use [reStructuredText (formerly Tweag)](vscode:extension/lextudio.restructuredtext) if you need advanced RST formatting.

> **Tip:** Click the "Install" link above to open VS Code directly and install the extension!

### 🚀 One-Click Install

Click the badge below to install all recommended extensions at once in VS Code:

[![Install All Extensions](https://img.shields.io/badge/Install%20All%20Extensions-blue?style=for-the-badge&logo=visual-studio-code)](vscode:extension/trond-snekvik.simplerst,esbonio.esbonio,esbenp.prettier-vscode,gitkraken.gitlens,matt-rudge.auto-open-preview-panel,ybaumes.highlight-trailing-white-spaces,zaaak.markdown-editor)

## Common Issues & Solutions

### Sphinx Build Errors
**Problem:** `poetry run sphinx-build` fails.
**Solution:**
1. Ensure all dependencies are installed: `poetry install --with docs`
2. Check `docs/source/conf.py` for missing extensions
3. Clear build cache: `rm -rf docs/_build/`

### Read the Docs Build Fails
**Problem:** RTD shows "Build failed" without clear error.
**Solution:**
1. Check **Build Logs** in RTD dashboard
2. Ensure `pyproject.toml` or `requirements.txt` is in the repository root
3. Verify Python version matches your local environment

### Virtual Environment Conflicts
**Problem:** Poetry creates a new venv every time.
**Solution:** Keep the venv folder name consistent or use `poetry env use python3.11` (or your version) to pin it.

### Git Hooks Not Running
**Problem:** Hooks do not trigger after cloning.
**Solution:** Run `./setup-hooks.sh` to install them. They are not on by default to avoid confusion for beginners or in early development. You may want to modify these to suit your environment and preferences.

### Branch Prefix Validation Fails (or similar)
**Problem:** Push is rejected with "Branch must start with a prefix".
**Solution:** Rename your branch: `git checkout -b docs/your-feature-name`
      or
**Solution:** Turn off/delete corresponding hook.

## Recommended GitHub Settings

For production repositories, enable these protections:

1. **Branch Protection Rules** (Settings → Branches):
   - ☑️ Require pull request reviews before merging
   - ☑️ Require status checks to pass before merging
   - ☑️ Include administrators

2. **Required Status Checks:**
   - `pre-push` hook validation (via GitHub Actions)
   - Sphinx build check

3. **Deploy Keys** (if using RTD):
   - Add Read the Docs as a collaborator with read access

## Upgrading to include python projects later
Consider you can always upgrade this package:

1. Docs only (current template)
    - For user-facing documentation
    - No Python code to document
    - Faster builds, simpler setup

2. Python package (installable variant)
    - For SDK/API documentation
    - Includes autodoc, napoleon, viewcode
    - Requires actual Python package structure

Use the setup-python.sh to make the changes:
- Changes package-mode = true
- Creates package directory structure
- Updates conf.py with path configuration
- Installs dependencies

## License
[![License: CC BY-NC-SA 4.0](https://img.shields.io/badge/License-CC%20BY--NC--SA%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by-nc-sa/4.0/)

Attribution-NonCommercial-ShareAlike 4.0 International

What the license means:

    Attribution (BY): Users must give credit to the original author.
    NonCommercial (NC): Users cannot use the template (itself) for commercial purposes.
    ShareAlike (SA): If users modify the template, they must distribute their changes under the same license.
    See the LICENSE file for legal details.

   Please keep the sharing going!