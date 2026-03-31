.. _installation:

The Violence Tool Installation
==============================

Requirements & Warnings for Fred's projects
-------------------------------------------

.. important::

   The Violence Layer Manager is designed for a specific Grease Pencil
   workflow. It will **not work** with arbitrary GP objects.

**Your Grease Pencil Object MUST have:**

1. **Multi-layer format** — Layers named and organized according to the
   Violence Tool convention (Body, Head, Eyes, Mouth, etc.)

2. **Material slot setup** — The ``1234/QWER/ASDF`` material slot configuration

3. **Blender 4.1.1 or higher** — The add-on uses GPencil APIs introduced in
   Blender 4.x

**If your object doesn't match this format:**

- The layer switching operators will fail silently
- The panel buttons won't select the correct layers
- You may see errors in the Blender console

What if I want to use this for my own project?
----------------------------------------------

This is welcome, but could involve some organization that might be unique to your project, depending on your style.
    1. Practice with the files included here, using the default setup to get an idea of how the system works
    2. Look through our documentation on ::doc::`altsetups<alternative setups>` from other users (under construction)
    3. Play around and find your personal workflow
    4. Consider sharing with us what you discovered!

Prerequisites:
--------------

* **Blender 4.1.1** or higher (The add-on uses GPencil APIs introduced in Blender 4.x).
* A Grease Pencil object with the correct layer/material structure

.. _installing:

Installing
============

Step 1: Install the Add-on
---------------------------

1. **Save the Script**:
   * Save the ``TheViolenceLayerManager.py`` file to a location on your computer.
   * *Tip: You can also run it directly from Blender's Text Editor, but saving it allows for permanent installation.*

2. **Open Preferences**:
   * In Blender, go to **Edit** → **Preferences**.

3. **Install**:
   * Click the **Add-ons** tab.
   * Click the **Install...** button (top left).
   * Navigate to your saved ``TheViolenceLayerManager.py`` file and select it.

4. **Enable**:
   * Find "The Violence: Grease Pencil Layer Manager" in the list (or search for "Violence").
   * **Check the box** to enable it.
   * Click **Save Preferences** (bottom left) to ensure it loads on startup.


.. note:: You don't need to do this on files that are already set up by Fred, like an inbetween or test file. However, when a revision comes out, you may want to update, in which case you'll need to re-'run' the script.

5. **Initializing the script**

   * Open the python panel in Blender
   * Press the play button at the top of the window.

.. note:: 'Playing' the script file will **rewrite** the changes you may have made to it, if any.

Step 2: Verify Installation
-----------------------------

1. Open the **Sidebar** in the 3D View (press ``N`` if hidden).
2. Click the **Fred** tab.
3. You should see the **LAYER SELECTOR** panel with buttons for "Body", "Head", "Eyes", etc.
4. Press your assigned hotkey to see the **Layer Switcher** menu.

Step 3: Configure Keybindings (Recommended)
--------------------------------------------

For optimal workflow, we highly recommend configuring specific keyboard shortcuts.
See the :ref:`keybindings` page for detailed setup instructions on:

* Holding **Alt** to nudge lines while drawing
* Using **F** to change sculpt radius
* Quick-switching between Draw, Erase, Sculpt, and Fill modes with single keys
* Toggling "Fade Inactive Layers"

.. note::
    These keybindings are optional but will significantly improve your efficiency
    when using The Violence Layer Manager.

Once installed, you can find :ref:`onboarding` to get your practice files.

.. _troubleshooting:

Workflow Troubleshooting
========================

Before assuming something is broken, check these common issues:

.. contents::
   :local:
   :backlinks: none
   :depth: 1

The tool only affects the current frame, or behaves erratically.
----------------------------------------------------------------

    **Check:** Are you in **Multi-Frame Editing Mode**?
    **Fix:** Ensure you are in **Object Mode** or **Draw Mode**. The add-on is designed to switch layers globally, which requires Object Mode.
    **How:** Look at the top-left of the 3D Viewport. If it says "Multi-Frame Editing", click the mode dropdown and select **Object Mode** (or press ``Esc`` to exit the mode).

    *Tip:* The Violence Layer Manager is designed for Object Mode (to switch layers globally) or Draw Mode (to draw on specific layers). In Multi-Frame Editing, Blender locks the view to a specific frame range, which can interfere with the add-on's layer switching logic.

You cannot see the Grease Pencil strokes or the layer panel icons.
------------------------------------------------------------------

    **Check:** Is the **Overlay** disabled?
    **Fix:** Enable Overlays.
    **How:**

        1. Look at the top-right of the 3D Viewport.
        2. Click the **Overlays** dropdown (two overlapping circles icon) and ensure **Grease Pencil** is checked.
        3. Alternatively, press ``Shift-O`` to toggle overlays.

The brush size or sculpt radius is too big/small to see, or the tool seems unresponsive.
----------------------------------------------------------------------------------------

    **Check:** Are you at a very large or tiny scale?
    **Fix:** Scale your object to match a "Default Cube" (2x2x2 meters).
    **How:**

        1. Select your Grease Pencil object.
        2. Press ``Ctrl+A`` and select **Scale**.
        3. If the object is huge, zoom out. If tiny, zoom in.

    *Tip:* The tool assumes a standard scale. If your object is 1000x larger than a cube, the brush radius might be effectively invisible.

Keybindings (like ``D``, ``E``, ``S``) do not work or trigger unexpected actions.
---------------------------------------------------------------------------------

    **Check:** Is your keyboard set to the **wrong language**?
    **Fix:** Switch your OS keyboard layout to **US/International**.
    **How:** Look at your system tray (Windows) or menu bar (macOS/Linux) and ensure the input language is **English (US)**.

    *Tip:* The tool's keymap is configured for the QWERTY US layout. Other layouts (like AZERTY or QWERTZ) map keys differently.

You can only see one object, and the layer panel seems to ignore other objects.
-------------------------------------------------------------------------------

    **Check:** Are you in **Isolated Mode**?
    **Fix:** Exit Isolated Mode.
    **How:**

        1. Look at the top-left of the 3D Viewport.
        2. If you see an "Isolate" icon (a single cube with a spotlight), click it or press the **Backslash** key (``\``) to toggle it off.

Strokes are missing or the layer panel shows empty slots.
---------------------------------------------------------

    **Check:** Are objects, polygons, or bones **hidden**?
    **Fix:** Unhide all elements.
    **How:** Press ``Alt+H`` in the 3D Viewport to unhide everything.
    *Note:* This works in both **Object Mode** (to unhide objects) and **Edit Mode** (to unhide strokes).
    *Tip:* If you are in Edit Mode, ensure no specific vertices or strokes are hidden (press ``Alt+H`` again if needed).

You can draw, but the tool doesn't switch layers, or buttons are greyed out.
----------------------------------------------------------------------------

    **Check:** Are you on the **wrong/locked/hidden layer**?
    **Fix:** Ensure the active layer is unlocked and visible.
    **How:**

        1. Open the **Outliner** (top-right).
        2. Expand your Grease Pencil object.
        3. Look at the **Layers** list.
        4. Ensure the **Eye icon** (visibility) and **Lock icon** are enabled for the layer you want to edit.
        5. Click the layer name to make it the **Active Layer** (it will highlight in orange).

The panel is empty or buttons do nothing.
-----------------------------------------

    **Check:** Does your active Grease Pencil object match the required layer/material structure?
    **Fix:** Ensure the object is selected and correctly configured.
    **How:**

        1. Select the Grease Pencil object in the 3D Viewport.
        2. Check the **Object Data Properties** tab (green pencil icon).
        3. Verify that the layers are named correctly (e.g., "Body", "Head", "Eyes") and have the correct material slots assigned.
        4. See the :ref:`installing` section for the exact setup.

"Operator not found" error.
---------------------------

    **Check:** Is the keybinding name correct?
    **Fix:** Verify the keybinding name and restart Blender.
    **How:**

        1. Go to **Edit → Preferences → Keymap**.
        2. Search for ``OBJECT_MT_Fred_Custom_Layer_Menu``.
        3. Ensure the name is spelled exactly as shown (case-sensitive).
        4. If the keybinding exists but doesn't work, **restart Blender** to ensure the add-on loaded correctly.
        5. If the error persists, check the **System Console** (Window → Toggle System Console) for specific error messages.