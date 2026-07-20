.. _versioning:

Versioning & Roadmap
====================

This documentation is versioned alongside major versions of **The Violence Tool**.
Different releases of the tool can have modified workflows, features, and capabilities -
i.e. Pre and Post- Grease Pencil 3.
Please ensure you are using the documentation that matches your installed release:

Stable = Documentation aimed primarily at "Revisions 5", the newest version of the tool for Blender 4.1.1.
Latest = Documentation for the Tool aimed at compatibility with Grease Pencil 3 as it evolved post- Blender 5 and for Blender 5.2 LTS. (may work with 5.1 as well)

Dan says: I haven't figured out yet how to rename these labels to something more sensible, bear with that, thanks!

.. warning::

   If you get an error while installing a new version of the tool, try renaming the file just to "TheViolenceLayerManager.py".
   The version will appear in the Addons menu regardless of what the file is called because the name it's looking for is hardcoded
   in the script itself, not the file name. Be sure to uninstall the previous version first, or they will conflict, even if different versions -
   the version number is stored seperately from the name.

Current Version: **2.0** - Rolling release
------------------------------------------

This documentation covers the Blender 5.1/5.2 LTS version of The Violence Tool. It is a
script-based workflow designed for a specialised type of Grease Pencil layer management
in Blender. The previous version of the tool only works on 4.1.1, pre-Grease Pencil 3. This
version is designed for the changes made to Grease Pencil in its 3rd iteration.

**Technical Differences:** v2.0 consolidates layer switching into parameterized
operators and introduces a material-name-based timer to address a new GP3 foible. It also
updates naming conventions/calls introduced/changed in GP3. A few items were moved to now-native
Blender tools.

**What 2.0 Includes:**

   * Automated layer switching via parameterized operators (Lines, Fills, Masks).
   * Compatability with Grease Pencil 3 and Blender 5.1-5.2 LTS.
   * Background timer for automatic stroke mode detection (via material naming convention).
   * Modal keybinds for automerge (A) and sculpt mode (Alt).
   * Reduced operator count via consolidated, filter-based design.
   * Improved keymap workflow with configurable variants.

**What 2.0 Removes:**

   * Per-operator keybinds for all utility functions (keyframe/marker nav,
     brush strength, draw-behind, compositor toggle).
   * The Fred Panel UI component (may be re-implemented in v2.1).
   * Further review/implementation of undo support for other operators.

Future Versions
---------------

- A potential return of the Fred menu for training and visual checks.

.. note::

   The material-checking timer is a workaround for a particular Grease Pencil 3
   architectural change: stroke/fill mode is now a tool setting rather 
   than a material property. This design was controversial among professional 
   users, as it removes "production guardrails" that studios did say they rely on.
   Casual users though find the new way easier to work with, so that won out.

   https://devtalk.blender.org/t/grease-pencil-new-fills-workflow/44106

   Blender 5.2 LTS adds ``fill_id`` and ``hide_stroke`` properties that 
   could eventually replace the timer, but these require per-stroke property 
   management rather than automatic brush switching. A future version of 
   the tool may migrate to this approach.

**2.0: Bugfixes and Minor improvements**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This version did not address any noted issues - it was strictly bringing the existing code up to date with GP3 changes and stripping out some unused code. That's enough for a big update!


How to Switch Documentation Versions
------------------------------------

This site currently hosts **Release 5** (for 4.1.1) documentation and **v2.0** development in anticipation 5.2 LTS.

Minor improvements to 2.0 will be noted in this version of the docs. 3.0 will appear if significant changes 
are made to Blender's Grease Pencil and the tool receives **significant** workflow and/or internal changes.

A version selector is in the bottom-left corner of this page, allowing you to switch between documentation for different versions of the tool.

Until then, please use the **"Stable"** documentation if you are using Blender 4.1.1 version of the tool and **"Latest"** if you are using Blender 5/Grease Pencil 3.