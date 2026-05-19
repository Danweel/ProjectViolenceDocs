.. _versioning:

===============================
Versioning & Roadmap
===============================

This documentation is versioned alongside **The Violence Tool** to ensure accuracy.
Different releases of the tool can have modified workflows, features, and capabilities.
Please ensure you are using the documentation that matches your installed release.

Current Version: **Release 5**
-------------------------

**Status:** Current version in use

**Fred's Script Version: **5.0**

This documentation covers release 5 of The Violence Tool. It is a
script-based workflow designed for specific type of Grease Pencil layer management
in Blender 4.1.1 (only).

**What Release 5 Includes:**

*   Automated layer switching (Lines, Fills, Masks).
*   Masks for lip-syncing working with teeth, muzzle and tongue.
*   Commands for Highlights, Shadows, and Noise.
*   Keyframe management helpers.
*   Camera locking.
*   Integration with standard Blender Grease Pencil workflows.
*   Explicit undo push support for the Noise Operator added
*   Layer 10 is now Lines-Only/Holdout

**What Release 5 Does NOT Include:**

*   Full undo support for all operators is not yet implemented (only Noise has explicit undo push).
*   Safety checks for locked/hidden layers are not yet implemented.
*   A formal Python API generally used for external scripting.
*   Character switching or multi-character pipelines. Clips need to be provided with the right materials pre-setup.
*   Removal of Layer 10 fill and sculpt operators - Layer 10 is now Lines-Only/Holdout


Future Versions
---------------

We hope to meet the needs of future production pipelines and public use.

**5.1: Bugfixes and Minor improvements**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**Goal:** This is the minimum attempt at improving the tool without changing the archetecture. The goal is to change as little as possible and still provide some fixes.

*Expected Features*

* **Minor Stability/Bugfixes**
* **Possible implementation of missing code**

*Target Audience:* Current animators already well-versed with the tool.

**v6.0: Refactor**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**Goal:** More involved bug fixes, user messages, Undo support, and API.

The v6.0 release is primarily a refactor, which some bugs in the unnumbered and Release 5 of the tool need in order to be fixed. It will convert the tool from a script into a formal Blender Add-on with a more responsive internal structure that will help with onboarding.

*Expected Features:*

*   **Full Undo Support:** Reliable undo/redo for all tool actions.
*   **Formal API:** Python classes and functions for forward compatibility
*   **Improved Error Handling:** Better feedback when operations fail.
*   **Stability Fixes:** Fixes to known issues that were not able to be fixed without archeteture change.
*   **Developer Documentation:** Versioned API reference and contribution guides.

*Target Audience:* Animators using Fred's workflow.

**Expansion (Planned but far out)**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**Goal:** Advanced Features and Public Release.

The Expansion release will introduce character set up and switching and logical extensions and to
prepare the tool for a wider public audience.

*Planned Features:*

*   **Character Switching:** Tools to manage and switch between multiple character rigs in a single scene.
*   **Enhanced Workflow:** Getting the tool to add convenience for more of the project lifecycle, such as set up.
*   **Community Features:** Alternative setups, sharing guidelines, and community spotlights.

*Target Audience:* The broader animation community and developers who want to extend the tool.

How to Switch Documentation Versions
------------------------------------

This site currently hosts **v1.0** documentation.

*   **v5.0:** :doc:`Release 5 Homepage</index>`
*   **v6.0:** *Will be available at a separate URL once released.*
*   **vX.0:** *Planned for future release.*

When future versions are released, a version selector will appear in the bottom-left
corner of this page, allowing you to switch between documentation for different versions
of the tool.

Until then, please use the **Release 5** documentation if you are using any Release v5.X of the tool.