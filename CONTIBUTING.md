Contributing to Project Violence Documentation
**UNDER CONSTRUCTION**

Thank you for your interest in contributing to The Violence Tool documentation! Whether you are fixing a typo, adding a new workflow section, or debugging a build error, your help makes this resource better for everyone.

This guide covers how to set up your environment, how to maintain the project, and how to report issues.

🚀 Quick Start for Contributors
Prerequisites

    Python 3.12+
    Poetry (for dependency management)
    Git
    VSCodium (recommended) or VS Code

1. Clone the Repository

git clone https://github.com/Danweel/ProjectViolenceDocs.git
cd ProjectViolenceDocs

2. Set Up the Environment

Run the setup script provided in the root directory. It handles dependencies and environment creation automatically.

chmod +x setup_for_contributors.sh
./setup_for_contributors.sh

Note: If you are on Windows, ensure you are using Git Bash or WSL to run this script.
3. Verify the Setup

Run the following to ensure everything is working:

poetry env info --path
poetry run python --version
poetry run sphinx-build -b html docs/source docs/_build/html

If the build succeeds, open the documentation locally:

xdg-open docs/_build/html/index.html

🛠️ Maintenance & Updates

This section covers how to safely update project components.
Updating Mermaid Diagrams

The Mermaid JavaScript library is pinned to a specific version in docs/source/conf.py to ensure build stability.

When to update:

    A new Mermaid feature is released.
    Security vulnerabilities are reported.
    The CDN becomes unreliable for the pinned version.

How to update:

    Check the latest stable version: https://github.com/mermaid-js/mermaid/releases
    Update mermaid_version in docs/source/conf.py:

    mermaid_version = '11.13.0'  # Replace with new version

    Test locally:

    rm -rf docs/_build
    poetry run sphinx-build -b html docs/source docs/_build/html

    Verify all diagrams render correctly.
    Commit the change:

    git add docs/source/conf.py
    git commit -m "Update Mermaid to vX.Y.Z"

Updating Sphinx and Extensions

Dependencies are managed via Poetry in pyproject.toml.

How to update:

    Check for outdated packages:

    poetry show --outdated

    Update a specific package:

    poetry update sphinx

    Update all packages (use with caution):

    poetry update

    Test the build and review changes:

    git diff pyproject.toml poetry.lock

Regenerating requirements.txt

If you add or update dependencies, regenerate requirements.txt for Read the Docs:

poetry export -f requirements.txt --output requirements.txt --without-hashes --only docs

🐛 Troubleshooting Common Issues

Below are common errors encountered during development and their solutions.
1. "Could not resolve interpreter path" in VSCodium

Symptom: VSCodium shows Default interpreter path ... could not be resolved. Cause: The Poetry environment folder name changed (hash updated), but .vscode/settings.json still points to the old path. Solution:

    Run poetry env info --path to get the new path.
    Update .vscode/settings.json with the new path.
    Reload VSCodium (Ctrl+Shift+P → Developer: Reload Window).

2. "ModuleNotFoundError: No module named 'encodings'"

Symptom: Poetry commands fail with a fatal Python error. Cause: This usually happens if running inside a Flatpak sandbox that cannot access system Python libraries. Solution:

    Preferred: Install the native .deb version of VSCodium instead of Flatpak.
    Workaround: Run commands in your native Ubuntu terminal, not inside the Flatpak terminal.

3. "Mermaid error: Requires mermaid js version X or later"

Symptom: Build fails with a Mermaid version mismatch. Cause: The mermaid_version in conf.py is older than what the Python package expects, or the CDN version is missing. Solution:

    Update mermaid_version in docs/source/conf.py to the latest stable version (e.g., 11.13.0).
    Clear the build cache: rm -rf docs/_build.
    Rebuild: poetry run sphinx-build -b html docs/source docs/_build/html.

4. "Extension error: Could not import extension..."

Symptom: Build fails with No module named 'sphinx-...'. Cause: The extension is listed in conf.py but not installed in the Poetry environment. Solution:

    Install the package: poetry add <package-name>.
    Ensure the import name in conf.py matches the package (e.g., notfound.extension for sphinx-notfound-page).

5. "Explicit markup ends without a blank line" (RST Errors)

Symptom: Warnings in usage.rst or other .rst files. Cause: Missing blank lines after blocks (e.g., .. note::) or malformed links. Solution:

    Ensure there is a blank line after every directive.
    Check indentation (RST is strict about spaces vs. tabs).
    Verify links follow the format text <url>.

6. "Theme error: no theme named 'groundwork' found"

Symptom: Build fails because the theme is missing. Cause: The theme package is not installed. Solution:

    Install the theme: poetry add groundwork-sphinx-theme.
    Ensure html_theme = 'groundwork' is set in conf.py.


📝 Reporting Issues

If you find a bug or have a suggestion, please open an Issue on GitHub.
Issue Templates

We use the following labels to categorize issues:
Label	Description
A-class	Critical: Breaks the site or contains dangerously wrong information
B-class	Functional: Broken links, incorrect steps, missing screenshots
C-class	Minor: Typos, formatting, suggestions for improvement

TODO #9 ADD OTHER LABELS HERE

How to Report

    Go to the Issues tab.
    Click New Issue.
    Choose the appropriate template (Bug Report or Feature Request).
    Fill in the details clearly.

🤝 Code of Conduct

We are a community of volunteers. Please be respectful, constructive, and inclusive.

    Assume positive intent.
    Focus on the content, not the person.
    Help others learn.

📜 License

By contributing, you agree that your contributions will be licensed under the CC BY-SA 4.0 license.
📞 Contact

For questions about the documentation, contact the maintainer:

    Email: Repo owner
    GitHub Discussions: [Link to Discussions]
