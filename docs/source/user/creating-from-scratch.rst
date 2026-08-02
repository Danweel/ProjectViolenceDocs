.. _creating-from-scratch:

Creating from Scratch
=====================

------------------------------------------------------------------------------

.. _gp-creator:

GP Creator
~~~~~~~~~~

The following is instructions for creating your own scenes using Fred's Tool, and
some of the skills and knowlege that is useful for ground-up creation.

.. _new-character:

Creating a New Character with EasyGP Creator
--------------------------------------------

1. Ensure you're on the first frame of the target camera shot
2. Shift+Right-Click to place 3D cursor at character's origin point
3. Run `EasyGPCreator.py` (Text Editor → Play button or custom keybind)
4. Type character name (e.g., "James") — without `GP_` prefix
5. Select target camera shot from dropdown (defaults to active camera)
6. Click OK — object created with all layers, materials, drivers, and effects
7. Immediately draw a placeholder stroke (Shift+1 → squiggle) so object remains selectable
8. If character exists elsewhere in file, materials/modifiers/effects auto-copy from the match

.. _new-camera:

Setting Up a New Camera Shot
----------------------------

.. admonition:: Prerequisites

    Camera must be named `camera_shot_N`, pass index set.
    Existing characters must follow `GP_Name_ShotN` / `ANIM_Name_ShotN` naming.

1. Move timeline to desired frame
2. Shift+Right-Click to place 3D cursor where camera should go
3. Shift+A → Add Camera (or Shift+D to duplicate existing)
4. Rename **both** object and data block to `camera_shot_N` (N = shot number)
5. Set object pass index to N (Properties → Object → Relations → Pass Index)
6. Move timeline to frame where camera switch should occur
7. Press **Ctrl+B** to create camera marker
8. Navigate markers with **Ctrl+Alt+Z/X**

.. note::

    Several animators forgot step 4 (data block naming)
    and step 5 (pass index). Consider adding a checklist callout in docs.

.. _shadows-and-highlights:

Setting up the Shadows and Highlights
-------------------------------------

(needs new set of steps)
Shadow layer has ALL other layers as masks (except highlight and mouth mask)

.. _visibility-drivers:

Visibility Driver Setup (Manual)
--------------------------------

1. Right-click on a purple driver icon (visibility) on any GP object with drivers
2. Select "Copy Driver" (or press C)
3. Go to target object's visibility icons (monitor + camera in Outliner)
4. Right-click → "Paste Driver" (or press P) on each icon
5. Verify by scrubbing timeline — objects should toggle with camera changes

.. Note::

    Works on ANY object type (meshes, lights, etc.), not just GP.

.. _keyframe-visibility:

Keyframed Visibility (Alternative to Drivers)
---------------------------------------------

1. Go to frame where object should be visible
2. Hover mouse over visibility icon → press **I** (keyframe)
3. Go to frame where object should be hidden
4. Click visibility off → press **I**
5. Yellow diamonds appear in timeline; move as needed

.. warning::
    Keyframes don't auto-follow camera marker moves; drivers do.

------------------------------------------------------------------------------