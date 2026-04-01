.. _usage-trouble.rst::

    Troubleshooting
    ===============

The brush size or sculpt radius is too big/small to see, or the tool seems unresponsive.
----------------------------------------------------------------------------------------

    **Check:** Are you at a very large or tiny scale?
    **Fix:** Scale your object to match a "Default Cube" (2x2x2 meters).
    **How:**

        1. Select your Grease Pencil object.
        2. Press ``Ctrl+A`` and select **Scale**.
        3. If the object is huge, zoom out. If tiny, zoom in.

    *Tip:* The tool assumes a standard scale. If your object is 1000x larger than a cube, the brush radius might be effectively invisible.

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

