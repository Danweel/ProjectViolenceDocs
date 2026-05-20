.. _versioning:

===============================
Versioning & Roadmap
===============================

This documentation is versioned alongside **The Violence Tool** to ensure accuracy.
Different releases of the tool can have modified workflows, features, and capabilities.
Please ensure you are using the documentation that matches your installed release.

.. warning::

   If you get an error while installing a new version of the tool, try renaming the file just to "TheViolenceLayerManager.py".
   The version will appear in the Addons menu regardless of what the file is called. Be sure to uninstall the previous version first,
   or they will conflict, even if different versions.

Current Version: **Release 5**
------------------------------

**Status:** Current version in use

**Fred's Script Version: **5.0**

This documentation covers Release 5 of The Violence Tool. It is a
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

How to Switch Documentation Versions
------------------------------------

This site currently hosts **Release 5** documentation.

*   **v5.0:** :doc:`Release 5 Homepage</index>`
*   **vX.0:** *Planned for future release.*

When future versions are released, a version selector will appear in the bottom-left
corner of this page, allowing you to switch between documentation for different versions
of the tool.

Until then, please use the **Release 5** documentation if you are using any Release v5.X of the tool.