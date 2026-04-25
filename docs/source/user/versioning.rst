.. _versioning:

===============================
Versioning & Roadmap
===============================

This documentation is versioned alongside **The Violence Tool** to ensure accuracy.
Different versions of the tool can have modified workflows, features, and capabilities.
Please ensure you are using the documentation that matches your installed version.

Current Version: **v1.0**
-------------------------

**Status:** Current version in use

This documentation covers the current release of The Violence Tool. It is a
script-based workflow designed for specific type of Grease Pencil layer management
in Blender 4.1.1 (only).

**What v1.0 Includes:**

*   Automated layer switching (Lines, Fills, Masks).
*   Masks for lip-syncing working with teeth, muzzle and tongue.
*   Commands for Highlights, Shadows, and Noise.
*   Keyframe management helpers.
*   Camera locking.
*   Integration with standard Blender Grease Pencil workflows.

**What v1.0 Does NOT Include:**

*   Undo support for tool actions (standard Blender undo works, but tool-specific actions may be limited).
*   A formal Python API for external scripting.
*   Character switching or multi-character pipelines. Clips need to be provided set-up in advance with the right materials.

.. note::

   If you are using the tool as originally built by Fred, or for legacy projects/shots,
   **v1.0** is the correct version to follow.

Future Versions
---------------

We hope to meet the needs of future production pipelines and public use.

**1.1: Bugfixes and Minor improvements**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**Goal:** This is the minimum attempt at improving the tool without changing the archetecture. The goal is to change as little as possible and still provide some fixes.

*Expected Features*

* **Minor Stability/Bugfixes**
* **Possible implementation of broken features**

*Target Audience:* Current animators already well-versed with the tool.

**v2.0: The Refactor (In Development)**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**Goal:** More involved bug fixes, user messages, Undo support, and API.

The v2.0 release is primarily a refactor, which some bugs in v1.0 need in order to
be fixed. It will convert the tool from a script into a formal Blender Add-on with
a more responsive internal structure that will help with onboarding.

*Expected Features:*

*   **Full Undo Support:** Reliable undo/redo for all tool actions.
*   **Formal API:** Python classes and functions for forward compatibility
*   **Improved Error Handling:** Better feedback when operations fail.
*   **Stability Fixes:** Fixes to known issues that were not able to be fixed without archeteture change.
*   **Developer Documentation:** Versioned API reference and contribution guides.

*Target Audience:* Animators using Fred's workflow.

**v3.0: Expansion (Planned)**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**Goal:** Advanced Features and Public Release.

The v3.0 release will introduce character set up and switching and logical extensions and to
prepare the tool for a wider public audience.

*Planned Features:*

*   **Character Switching:** Tools to manage and switch between multiple character rigs in a single scene.
*   **Enhanced Workflow:** Getting the tool to add convenience for more of the project lifecycle, such as set up.
*   **Community Features:** Alternative setups, sharing guidelines, and community spotlights.

*Target Audience:* The broader animation community and developers who want to extend the tool.

How to Switch Documentation Versions
------------------------------------

This site currently hosts **v1.0** documentation.

*   **v1.0:** :doc:`Version 1.0 Homepage</index>`
*   **v2.0:** *Will be available at a separate URL once released.*
*   **v3.0:** *Planned for future release.*

When future versions are released, a version selector will appear in the bottom-left
corner of this page, allowing you to switch between documentation for different versions
of the tool.

Until then, please use the **v1.0** documentation if you are using the current tool.