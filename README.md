# Project Violence Documentation

> Documentation for The Violence layer management tool for Blender grease pencil animation
> Documentation for animator workflows for the animation projects associated with it.

[![License: CC BY-NC-SA 4.0](https://img.shields.io/badge/License-CC%20BY--NC--SA%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by-nc-sa/4.0/)

## Overview

**The Violence Tool** is a Python script for Blender 4.1 and 4.1.1 that controls layers and creates several additional management options for Grease Pencil animation. It is currently being used for the [A Fox in Space](https://www.imdb.com/title/tt6499450/) animation project.

This Github repository manages the following websites that host this documentation:

### 📖 **Live Documentation**: [project-violence-docs.readthedocs.io](https://project-violence-docs.readthedocs.io/en/latest/)

  Fully featured documentation with search, version-specific docs, facilitates exports to other formats, and possible language handling.

[![Documentation Status](https://readthedocs.org/projects/project-violence-docs/badge/?version=latest)](https://project-violence-docs.readthedocs.io/en/latest/)

### 🌐 **Quick Preview**: [danweel.github.io/ProjectViolenceDocs](https://danweel.github.io/ProjectViolenceDocs/)

  Use this if Read the Docs is down. This is a more static version that is automatically built at the same time, but only displays the most recent version.

[![Deploy to GitHub Pages](https://github.com/Danweel/ProjectViolenceDocs/actions/workflows/deploy.yml/badge.svg)](https://danweel.github.io/ProjectViolenceDocs/)

...as well providing an organized way to invite contributions to the knowlegebase. We'll cover that below.


## About This Repository

This repository contains **documentation only**: The plugin itself is currently in closed beta testing. If you're here, you're likely:

- **Looking for** the documentation - See the above links and the status
- Interested in **reporting issues** with the existing documentation
- Interested in **suggesting improvements** or new content
- Becoming a regular contributor to **help maintain and expand the docs**
- Investigating possibly **forking these docs** for use with your own GP project and workflow

The docs (and later, plugin) is designed to be **forkable and adaptable** for other projects. Whether you're using our workflow or iterating one yourself, this documentation is intended to be structured to help you:
- Understand the plugin's **capabilities and limitations**
- Be **modular enough to adapt** to your project's workflow
- **Contribute improvements back** to the community

We are a small community and welcome all forms of contribution. Thanks!

---

## Quick Links

| Resource　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　| Description                                                |
| -------------------------------------------------------------------------------| ------------------------------------------------------------|
| 📖 **[Full Documentation](https://project-violence-docs.readthedocs.io/)**　　| The Violence plugin and workflow reference @ Read the Docs |
| 🌐 **[GitHub Pages Preview](https://danweel.github.io/ProjectViolenceDocs/)** | Automatic mirror of the latest build                       |
| 🔧 **[Plugin Repository](LINK_TO_PLUGIN_REPO)**　　　　　　　　　　　　　　　 | Source code for the Grease Pencil layer management plugin  |
| 🤝 **[Contribution Guide](#contributing)**　　　　　　　　　　　　　　　　　　| How to contribute to the documentation                     |

---

## For Plugin Users (Animators)

### Prerequisites

- **Blender**: Version 4.1 or 4.1.1 only
- **Operating System**: Windows, macOS, or Linux
- **Basic Blender Literacy**: While it's possible to pick up the tool use without general Blender knowledge, navigation and troubleshooting is easier the more you know. You don't really need any previous Grease Pencil experience though, because the tool functions in its own way.

### Installation

1. Download the plugin from the Discord community. It'll be pinned in the appropriate channel. You may have to ask Fred to be added to that channel.
2. In Blender: `Edit` → `Preferences` → `Add-ons` → `Install...`
3. Select the downloaded `.zip` file
4. Enable the add-on by checking the box next to "Project Violence Layer Manager"

### Features

The Violence Tool is a Blender Grease Pencil add-on designed to streamline character animation workflows.

### 🎭 Character Setup & Initialization

| Feature                 | Description                                                                                                                           |
| -------------------------| ---------------------------------------------------------------------------------------------------------------------------------------|
| **Auto-Naming**         | Creates Grease Pencil objects that don't conflict                                                                                     |
| **Material Library**    | Generates pre-configured materials with specific colors for Lines, Fills, Shadows, Highlights, and Holdouts                           |
| **Layer Structure**     | Creates organized layers (18 currently) with standardized naming conventions (Background, Body, Head, Eyes, Mouth, Teeth, Foreground) |
| **Mask Layers**         | Sets up dedicated mask layers for teeth and mouth regions                                                                             |
| **Brush Configuration** | Pre-configures Ink Pen, Fill Area, and Push Stroke brushes with standardized settings                                                 |
| **Camera Parenting**    | Automatically parents new objects to the camera with locked X/Y positioning                                                           |

### 📚 Layer Management

| Feature                  | Description                                                                 |
| --------------------------| -----------------------------------------------------------------------------|
| **Layer Locking**        | Automatically toggles layer locks to prevent accidental edits               |
| **Focus Tools**          | Quick-selects specific layer groups (e.g., "All Mouth Layers")              |
| **Vertex Paint Cleanup** | Bulk-clears vertex paint data across all Grease Pencil objects in the scene |

### ⚡ Workflow Shortcuts & Toggles

| Feature               | Description                                                  |
| -----------------------| --------------------------------------------------------------|
| **Auto-Merge Toggle** | Enables/disables stroke auto-merging with keyboard shortcuts |
| **Fade Layers**       | Toggles layer fading overlay for better visibility           |
| **Onion Skinning**    | Toggles onion skinning overlay for frame-to-frame reference  |
| **Draw Behind**       | Toggles drawing strokes behind existing geometry             |

### 🎨 Artistic Effects & Tools

| Feature                | Description                                                                                                |
| ------------------------| ------------------------------------------------------------------------------------------------------------|
| **Randomize Line Art** | Applies organic variation to line art with randomized noise, thickness variation, and proportional editing |
| **Join & Smooth**      | Joins selected strokes and smooth position, thickness, and strength                                        |
| **Undo Integration**   | All operations push to Blender's undo stack which would otherwise not be a given                           |

### Keyboard Shortcuts

| Shortcut           | Function                |
| --------------------| -------------------------|
| `Ctrl+Alt+Shift+4` | New/Clear Mouth Frames  |
| `Shift+Alt+R`      | Randomize Line Art      |
| `Shift+Alt+F`      | Join and Smooth Strokes |

---

## Documenation for Plugin Users (Animators)

### Known Issues

- Operator #15 (New/Clear Mouth Frames) is currently a placeholder
- Invisible layers may not be affected by certain operations (needs more functional testing, under what circumstances does this tend to happen?)
- Suspect some brush configurations may need adjustment based on your Blender version (needs testing)
- Character (Fox) is currently hardcoded in the tool. Characters are already set up by scene, however, so this isn't workflow stopping.
- (not finished documenting known issues)

### Workarounds
- Try to use Blender 4.1.1 to avoid tools being slightly different between versions. 4.1.1 is the Blender build currently being used to develop.
- (not finished documenting known workarounds)

### Getting Help

- **Documentation**: Browse the [Full Documentation](https://project-violence-docs.readthedocs.io/)
- **Report Bugs**: Open an issue on the [Plugin Repository](LINK_TO_PLUGIN_REPO)
- **Feature Requests**: Submit suggestions via GitHub Issues
- **Tips and tricks**: We'd love to hear how you use the tool, both for official work and on your own. Similarly, explore the documentation for tips from other users.

---

## For Documentation Contributors

We welcome contributions to improve both the plugin documentation and workflow guides. Whether you're fixing typos, adding examples, or requesting/correcting translations, your help makes this resource more valuable for everyone.

### Types of Contributions

| Contribution Level  | What You Can Do                                                | Time Commitment |
| ---------------------| ----------------------------------------------------------------| -----------------|
| **Quick Fixes**     | Correct typos, broken links, or formatting                     | 5–15 minutes    |
| **Content Updates** | Add examples, clarify instructions, update screenshots         | 1–3 hours       |
| **Major Additions** | New workflow sections, plugin feature documentation            | 5+ hours        |
| **Technical Setup** | Help improve build scripts, Github Repo management, or tooling | Variable        |

For small fixes, feel free to just open a Github issue, and let the maintainers add it to the docs when they can.
If you're hoping to write for the docs though, Dan has provided a script file that will help you set up your environment for working with the files here.

### Setup for Contributors

Download the repository zip and unzip. Find **setup_for_contributors.sh**.

> No command-line expertise required! The script will open your terminal but guides you through each step with plain-language prompts.
>
>The setup script will:
>- Check for required tools (Python 3.12+, Poetry, Git)
>- Create an isolated virtual environment so tools don't affect your local configurations
>- Install Read the Docs dependencies (Sphinx, themes, etc.)
>- Build the documentation locally for preview

You could also run the following in a terminal to pull the repo directly without handling the zip:

#### Linux (Ubuntu & Debian):
```bash
# Clone the repository
git clone https://github.com/Danweel/ProjectViolenceDocs.git
cd ProjectViolenceDocs

# Run the setup script (handles dependencies and environment)
./setup_for_contributors.sh
```

#### MacOS:
```
git clone https://github.com/Danweel/ProjectViolenceDocs.git
cd ProjectViolenceDocs

# Make the script executable
chmod +x setup_for_contributors.sh

# Run the script
./setup_for_contributors.sh
```

#### Windows (use Git bash):
```
git clone https://github.com/Danweel/ProjectViolenceDocs.git
cd ProjectViolenceDocs

# Make the script executable
chmod +x setup_for_contributors.sh

# Run the script
./setup_for_contributors.sh
```

If you try to run ./setup_for_contributors.sh in a standard **Windows Command Prompt** or **PowerShell**, you will get an error like *'./setup_for_contributors.sh' is not recognized*.
The easiest fix for Windows:

- Download and install Git for Windows (https://git-scm.com/download/win).
- During installation, ensure "Git Bash Here" is selected.
- Right-click your project folder and choose Git Bash Here.

### Editing Documentation

- *Find the files*: Documentation source files are in **docs/source/**  Files use reStructuredText (.rst) format.
- *Edit in your favorite editor*:  I recommend [VSCodium](https://vscodium.com/), which uses useful VSCode extensions.
- *Preview locally*: Run `poetry run sphinx-build -b html docs/source docs/_build/html`
- *Submit changes*: Create a pull request on GitHub

### Documentation Style Guidelines

- *Audience*: Technical artists with varying computer literacy
- *Tone*: Clear, encouraging, and practical
- *Format*: Use code blocks for commands, tables for comparisons, and screenshots where helpful
- *License*: All documentation is under CC BY-SA 4.0 – you must attribute changes and share alike

---

## Forking This Documentation

This documentation is intended to be adapted for other projects. If you want to use this structure for your own plugin or workflow:

### What You Can Do

✅ Copy the structure – Use the folder layout and Sphinx configuration
✅ Adapt the content – Replace our workflow with yours
✅ Modify the plugin docs – Tailor feature descriptions to your tool
❌ You can't change the license nor use the work for profit – (CC-NC-SA)

### What We Ask

    Attribute the original: Include a note that this documentation originated with the Project Violence Tool and Fred's work.
    Share improvements: If you fix bugs or add features, consider contributing back upstream
    Keep it open: We believe documentation should be libre, freely accessible and modifiable

### Getting Started with a Fork

    Click Fork on GitHub to create your copy
    Update .readthedocs.yaml with your project name
    Replace content in docs/source/ with your documentation
    Connect your fork to Read the Docs (or use GitHub Pages)

---

## License

### Documentation Content

This documentation is licensed under the Creative Commons Non-Commercial Attribution-ShareAlike 4.0 International License.

You are free to:

    Share — copy and redistribute the material in any medium or format
    Adapt — remix, transform, and build upon the material for any purpose, even commercially

Under the following terms:

    Attribution — You must give appropriate credit, provide a link to the license, and indicate if changes were made
    ShareAlike — If you remix, transform, or build upon the material, you must distribute your contributions under the same license as the original

### Plugin Code

The Grease Pencil layer management plugin itself is licensed separately. See the Plugin Repository for its specific license terms.

Acknowledgments

    Sphinx – Documentation framework
    Read the Docs – Hosting and build infrastructure
    Blender Foundation – The incredible open-source 3D suite that makes this work possible
    Contributors – Everyone who has helped improve this documentation
    Fred - For the plugin itself

---

## Changelog

No changelog.md yet, see commits for now.

---

## Roadmap

    - Add current workflow recommendations for A Fox in Space
    - Document tool functions
    - Add tool setup and recommended shortcuts
    - Add .bpy guidance and tool technicalities
    - Document known issues and workarounds
    - Look into options for additional languages with RTD if there's interest
    - Provide a plugin demo project file
    - Release plugin for versioning and distribution

---

## Contact & Support

| Need                 | Where to Go                                                                           |
| ----------------------| ---------------------------------------------------------------------------------------|
| Plugin bugs          | For now, use this repository for these issues:                                        |
| Documentation errors | [This repository's issue page](https://github.com/Danweel/ProjectViolenceDocs/issues) |
| General questions    | [Discussions Tab](https://github.com/Danweel/ProjectViolenceDocs/discussions)         |

For questions about the repository itself, contact the current GitHub maintainer here on Github.

For questions about The Violence Tool plugin, reach out through the Patreon link below or through the Fox in Space Discord.

## Support This Project

Please support the development of this tool and maintenance of the documentation:

👉 [Fred @ A Fox in Space](https://www.patreon.com/AFoxInSpace) (Patreon)

## Code of Conduct
This project adheres to a [Code of Conduct](CODE_OF_CONDUCT.md). By participating, you are expected to uphold this code.

---

*Last updated: March 2026*