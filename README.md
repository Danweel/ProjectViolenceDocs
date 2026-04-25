# Project Violence Documentation

Community-driven documentation for **The Violence Tool**, a Blender Grease Pencil layer management tool, workflow, and the animation projects it supports.

[![License: CC BY-NC-SA 4.0](https://img.shields.io/badge/License-CC%20BY--NC--SA%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by-nc-sa/4.0/)
[![Documentation Status](https://readthedocs.org/projects/project-violence-docs/badge/?version=latest)](https://project-violence-docs.readthedocs.io/en/latest/)

## Live Documentation

These docs are hosted on **Read the Docs**. This allows for version choosing, text search and export options:

**[Read the Full Documentation](https://project-violence-docs.readthedocs.io/)**

*If Read the Docs is unavailable, you can view the latest static build on GitHub Pages:*
**[GitHub Pages Preview](https://danweel.github.io/ProjectViolenceDocs/)**

---

## Who Is This For?

This repository manages the _documentation's_ source code. You're probably here to:

*   **Learn the Tool:** This isn't the best place to actually read the docs. Visit the **[Live Documentation](https://project-violence-docs.readthedocs.io)** for installation, features, workflow guides and collected troubleshooting.
*   **Report Issues:** Found a typo, broken link, or outdated instruction? **[Open an Issue](https://github.com/Danweel/ProjectViolenceDocs/issues)**.
*   **Contribute:** Want to improve the docs, add examples, or translate content? See the **[Contributing Guide](#contributing)**. Read the Docs makes it extra easy for translation versions too.
*   **Fork & Adapt:** We encourage the community to experiement and try things. We'd appreciate partners to work with our **[Code of Conduct](#code_of_conduct)**

---

## For Plugin Users (Animators)

*The plugin itself is currently in closed beta. If you are an animator working on "A Fox in Space" or a related project, please contact the project lead (Fred) for access.*

**Prerequisites:**
*   **Blender:** Version 4.1 or 4.1.1 only. Prefer 4.1.1, since it has relevant bugfixes.
*   **OS:** It's a plugin/script, so it'll work in your Blender, regardless of system.
*   **Knowledge:** Basic Blender navigation is helpful but fairly simple to learn; no prior Grease Pencil experience required to use the tool, since its goal is to simplify workflow. You will want to read the docs, though, as it's still not self-explanatory.

**Features Overview:**
The Violence Tool streamlines character animation by managing:
*   **Layer Structure:** Organized groups (Background, Body, Head, Eyes, Mouth, etc.).
*   **Workflow Shortcuts:** Auto-merge toggles, layer locking, and brush presets.
*   **Artistic Effects:** Randomized line art, stroke joining/smoothing, and onion skinning.

---

## Contributing

We welcome contributions to improve the documentation! If you see typos, missing or wrong information, please consider contributing or even just dropping us a note about it.

### How to Contribute

**Quick Fixes:** Found a typo or broken link? [Open an Issue](https://github.com/Danweel/ProjectViolenceDocs/issues) and we can take care of it.

**Write Content:** Want to add more?

    1. Clone the repo: `git clone https://github.com/Danweel/ProjectViolenceDocs.git`
    2. Run the setup script: `./setup_for_contributors.sh` (Guides you through installing Python, Poetry, and Sphinx).
    3. Edit files in `docs/source/` (reStructuredText format). (Though the setup includes MyST, which lets you write in markdown as well.)
    4. Preview locally: `poetry run sphinx-build docs/source docs/_build/html`

I recommend using VSCodium for the plugins (but no Windows telemetry). Once you have the repo cloned, I've created the script file to simplify the setup of the Read the Docs/Sphinx environment. Then all you need to do is edit/add rst files in docs/source.
~ Dan

## Github Code of Conduct

This project follows a [Code of Conduct](CODE_OF_CONDUCT.md). By participating, you agree to uphold it.

---

## License

**Documentation Content:** Licensed under **Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0)**.

**Plugin Code:** Licensed separately. Not available currently.

---

## Support

| Need | Where to Go |
| :--- | :--- |
| **Documentation Errors** | [GitHub Issues](https://github.com/Danweel/ProjectViolenceDocs/issues) |
| **Plugin Bugs** | [GitHub Issues](https://github.com/Danweel/ProjectViolenceDocs/issues) (Tag as `plugin-bug`) |
| **General Questions** | [GitHub Discussions](https://github.com/Danweel/ProjectViolenceDocs/discussions) |
| **Plugin Access** | Contact Fred via [Patreon](https://www.patreon.com/AFoxInSpace) or the Fox in Space Discord. |

*Last updated: April 2026*