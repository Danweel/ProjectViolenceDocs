# Contributing to [PROJECT NAME] Documentation

Thank you for helping improve our documentation! Whether you are fixing a typo, adding a new workflow section, or suggesting a better way to explain a process, your input makes this resource better.

This guide covers how to set up your environment, how to write content, and how to submit changes.

---

## How to Contribute

> **Note:** You do **not** need to be a programmer to contribute. If you just want to suggest a change, you can do that directly on GitHub without installing anything!

### Option A: The "No-Install" Way (Recommended for Writers)
If you just want to fix a small error or suggest a change:
1.  Navigate to the file on GitHub.
2.  Click the **Pencil Icon** (Edit).
3.  Make your changes.
4.  Click **Commit changes**
    *   *GitHub will automatically create a Pull Request for you.*
5.  Add a brief description and submit.
6.  A maintainer will review and merge it.

### Option B: The full work environment
If you plan to write many pages or work on the build system:

#### Prerequisites

- **Python 3.11+** (Required for building docs locally)
- **Git** (Required for version control)
- **Text Editor** (VS Code, VSCodium, or any editor you prefer)

### 1.  **Clone the Repository**

```bash
git clone https://github.com/[USERNAME]/[REPO-NAME].git
cd ProjectFolder
```

### 2.  **Run the Setup Script**
We provide a script to handle all dependencies automatically:

```bash
./setup_for_contributors.sh
```

>Windows users: Right-click the folder → "Git Bash Here" → run the command above

### 3.  **Verify the Build**
Ensure the documentation builds correctly on your machine:

```bash
poetry run sphinx-build -b html docs/source docs/_build/html
```
### 4.  **If successful, open the local version:**

> Linux/Mac terminal: `xdg-open docs/_build/html/index.html`

> Windows (Git Bash): `explorer.exe docs/_build/html/index.html`

### How to Submit

#### 1. **Create a Branch**: Always work on a new branch. Never edit main directly.

    `git checkout -b docs/your-change-description`

> Example: docs/update-installation-steps

#### 2. **Make Your Changes**: Edit your files in your text editor.

#### 3. **Build Locally**: Run the build command to ensure you didn't break anything.

    `poetry run sphinx-build -b html docs/source docs/_build/html`

#### 4. **Commit & Push**:
```
git add .
git commit -m "DOCS: Brief description of change"
git push origin docs/your-change-description
```
#### 5. **Open a Pull Request**: Go to GitHub, click "Compare & pull request," and describe your changes.

## Writing Guidelines

- **Tone**: Professional but accessible. Avoid jargon where possible.
- **Headings**: Use # for page titles, ## for sections, ### for subsections.
- **Lists**: Use - for bullet points.
- **Code**: Use triple backticks ``` for code blocks.
- **Images**: Place images in docs/source/images/ and link them relatively.

### Choosing Your Format

You can write in **Markdown (`.md`)** or **reStructuredText (`.rst`)**.

| Feature | Markdown (`.md`) | reStructuredText (`.rst`) |
| :--- | :--- | :--- |
| **Ease of Use** | ⭐⭐⭐⭐⭐ (Very Easy) | ⭐⭐⭐ (Moderate) |
| **Best For** | Quick guides, simple lists, READMEs | Complex tables, cross-references, API docs |
| **Links** (example) | `[Text](url)` | `:ref:\`label\`` or `` `Text <url>`_ `` |
| **Recommendation** | **Use this for most pages** | Use for `index.rst` or complex manuals |

    Tip: If you are unsure, use Markdown. It is easier to read and edit.

### Branch & Commit Naming

To keep things organized, please follow these naming conventions:

#### Branch Names

Prefix your branch with its purpose:

    docs/ - Documentation content changes
    repo/ - Configuration or setup changes
    fix/ - Bug fixes in the build process

#### Commit Messages

Format: TYPE: #Issue-ID - Description

    Types: DOCS, REPO, FIX, FEAT
    Example: DOCS: #12 - Updated installation steps for Windows

### Issue Labels

We use labels to prioritize work:

| Label | Meaning | Description |
|-------|---------|-------------|
| A-class | Critical | Broken links, wrong info, site crash |
| B-class | Functional | Missing screenshots, unclear steps |
| C-class |	Minor | Typos, formatting, grammar |

> **Tip:** Add/change to project-specific labels (e.g., `urgent`, `low-priority`, `duplicate`).

## Troubleshooting
### "Build Failed" Error

If sphinx-build fails:

- Check the error message for missing files or syntax errors.
- Ensure you have a blank line after every directive (e.g., .. note::).
- Run poetry install --with docs to ensure all packages are installed.

### "Module Not Found"

If you see ModuleNotFoundError:

- The package might not be in pyproject.toml.
- Ask the maintainer to add it.

### VSCodium/VS Code Interpreter Error

If your editor complains about the Python path:

- Run poetry env info --path to get the correct path.
- Update .vscode/settings.json with the new path.

## Code of Conduct

We are a team working together. Please be respectful and constructive.

- Assume positive intent.
- Focus on the content, not the person.
- Help others learn.

## License

By contributing, you agree that your contributions will be licensed under the [![License: CC BY-NC-SA 4.0](https://img.shields.io/badge/License-CC%20BY--NC--SA%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by-nc-sa/4.0/) license.

> **What this means:** Your contributions can be shared and adapted by others, but not for commercial purposes, and derivatives must use the same license.

## Questions?

    Email: [Maintainer Email]
    Discussions: [Link to GitHub Discussions]
    Issues: [Link to GitHub Issues]
