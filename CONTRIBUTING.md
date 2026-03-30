# Contributing to the Read the Docs Template

Thank you for your interest in improving this documentation template!

Since this is a **template repository** used to bootstrap new projects, most contributions will be:
*   **Typo fixes** in the documentation text.
*   **Bug fixes** in the setup scripts (`setup-hooks.sh`, `setup-python.sh`).
*   **Updates** to dependencies or best practices.
*   **Suggestions** for new features or improvements.

## How to Contribute

> **Note:** You do **not** need to be a programmer to contribute. If you just want to suggest a change, you can do that directly on GitHub without installing anything!

### Option A: For small changes
If you just want to fix a typo or suggest a change:
1.  Navigate to the file on GitHub.
2.  Click the **Pencil Icon** (Edit).
3.  Make your change.
4.  Click **Commit changes**.
    *   *GitHub will automatically create a Pull Request for you.*
5.  Add a brief description and submit.
6.  A maintainer will review and merge it.

### Option B: The full work environment
If you are fixing a bug in the shell scripts, hooks or adding a new feature:

#### Prerequisites

- **Python 3.11+** (Required for building docs locally)
- **Git** (Required for version control)
- **Text Editor** (VS Code, VSCodium, or any editor you prefer)

### 1.  **Fork the Repository**
Click the **Fork** button at the top right of this page.

### 2.  **Clone Your Fork**

```bash
git clone https://github.com/[USERNAME]/[REPO-NAME].git
cd ProjectFolder
```

### 3.  **Create a Branch**

```bash
git checkout -b fix/your-bug-description
```

### 4.  **Make Your Changes**
Edit the files locally.

### 5.  **Test Locally (If applicable)**
If you changed a script, run it to ensure it still works:

```bash
./setup_for_contributors.sh
./setup-hooks.sh
./setup-python.sh
```

>Windows users: Right-click the folder → "Git Bash Here" → run the command above

### 6.  **Commit & Push**
```bash
git add .
git commit -m "FIX: Brief description of the fix"
git push origin fix/your-bug-description
```

### 7.  **Open a Pull Request**
    Go to your fork on GitHub and click **Compare & pull request**.

## Branch & Commit Naming

To keep the repo tidy, please remember:

### Branch Names
-   `fix/` - For bug fixes (e.g., `fix/setup-script-error`)
-   `docs/` - For text/typo fixes (e.g., `docs/adding-staff-template`)
-   `feat/` - For new features (e.g., `feat/adding-new-extension`)
-   `repo/` - Configuration or setup changes (e.g., `repo/fixed-missing-dependancy`)

### Commit Messages
> Types: DOCS, REPO, FIX, FEAT

Keep descriptions simple:

For bugs:
> Format: FIX: #Issue-ID - Description
-   `FIX: #12 - Corrected typo in README.md`

For additions:
-   `REPO: Updated installation instructions for Windows`
-   `FEAT: Added support for Python 3.XX`

### Content Writing Style Guide

- **Tone**: Professional but accessable. Avoid jargon where possible.
- **Headings**: Use # for page titles, ## for sections, ### for subsections.
- **Lists**: Use - for bullet points.
- **Code**: Use triple backticks ``` for code blocks.
- **Images**: Place images in docs/source/images/ and link them relatively.

## Reporting Bugs

If you find a bug in the template itself (not in a project you created from it):

1.  Check the **[Issues](https://github.com/[USERNAME]/[REPO-NAME]/issues)** tab to see if it's already reported.
2.  If not, open a **New Issue**.
3.  Include:
    *   **What you were trying to do.**
    *   **What happened.**
    *   **Your OS** (Windows, Linux, macOS).
    *   **Steps to reproduce** (if possible).

### Issue Labels

We use Severity and Urgency labels to prioritize work:

| Label | Meaning | Description |
|-------|---------|-------------|
A-class	| Critical | Broken links, wrong info, site crash |
B-class	| Functional | Missing screenshots, unclear steps |
C-class	| Minor | Typos, formatting, grammar |
Spicy | High Priority | Needs immediate attention (replaces '1') |
Mild | Low Priority | Nice to have (replaces '2' or '3') |

Labels are also used for flagging problems:

| Label | Meaning | Description |
|-------|---------|-------------|
| more info needed | On Hold | Information included was insufficient |
| more testing needed | Investigate | Needs extra testing under different circumstances |
| needs review | On Hold | Bug was looked at but needs more attention |
| Reopened | Investigate | This bug was previously entered, closed as fixed and reopened for some reason - investigate |

Finally, when issues are closed for reasons other than being resolved:

| Label | Meaning | Description |
|-------|---------|-------------|
| wontfix | Closed | The problem is too rare or too difficult to resolve |
| duplicate | Merging | Same as another issue |

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

## Questions?

If you have a question about how to use the template or need help:
*   Check the **[README.md](README.md)** first.
*   Open a **Discussion** on [GitHub]().
*   Or email: daniil.woodland@pm.me

## 📄 Licence

By contributing, you agree that your contributions will be licensed under the [![License: CC BY-NC-SA 4.0](https://img.shields.io/badge/License-CC%20BY--NC--SA%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by-nc-sa/4.0/) license.

> **What this means:** Your contributions can be shared and adapted by others, but not for commercial purposes, and derivatives must use the same license.

---

> **Note:** Since this repo represents the template, changes here **do not** automatically update projects created **from** it. Users must manually update their projects or re-create them if they want the latest changes.