.. _keybindings:

How to change keybinds in Blender (4.1.1)
=========================================

1. **Open Keymap Preferences**:
   * Go to **Edit** → **Preferences** → **Keymap**.

2. **Add a New Shortcut**:
   * Expand the **3D View** section.
   * Expand **3D View (Global)**.
   * Click the **+** icon to add a new entry.

3. **Set the Operator**:
   * In the **Operator** field, type: ``wm.call_menu``
   * In the **Name** field (appears after selecting the operator), type:

     ``OBJECT_MT_Fred_Custom_Layer_Menu``

4. **Assign a Key**:
   * Click the key field (default is ``None``) and press your desired key (e.g., ``F``, ``Shift+F``, or a number pad key).
   * *Recommended: Use a key that doesn't conflict with your usual workflow.*

5. **Save**:
   * Click **Save Preferences** again.

Recommended Keybindings
=======================

These keybinding changes will dramatically speed up your Grease Pencil workflow.
They are optional but highly recommended for use with The Violence Layer Manager.

Quick Reference
---------------

.. list-table::
   :widths: 20 30 50
   :header-rows: 1

   * - Key
     - Action
     - Purpose
   * - ``Alt + LMB``
     - Sculpt lines in Draw Mode
     - Nudge strokes without switching modes
   * - ``F``
     - Sculpt radius
     - Change sculpt brush size while nudging
   * - ``Ctrl + LMB``
     - Trim lines
     - Cut strokes in Draw Mode
   * - ``D``
     - Switch to Draw Mode
     - Return to drawing from any mode
   * - ``E``
     - Switch to Erase Mode
     - Quick erase toggle
   * - ``S``
     - Switch to Sculpt Mode
     - Quick sculpt toggle
   * - ``X``
     - Switch to Fill Mode
     - Quick fill toggle
   * - ``Ctrl-F``
     - Fade Inactive Layers
     - Toggle layer fading
   * - ``Shift-A``
     - Apply Material
     - Assign active material to selection


Detailed Setup Instructions
----------------------------

Hold Alt to Nudge/Sculpt Lines in Draw Mode
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

**Location:** Grease Pencil → Grease Pencil Stroke Paint (Draw Brush)

1. Change the ``Alt + Left Mouse`` shortcut to ``gpencil.sculpt_paint``
2. The **"Wait for Input"** box must be left unticked, but it can't be greyed out.
   Tick then untick it to un-grey it.

.. tip::
    Normally the ``F`` key changes your draw brush radius. Since The Violence Layer Manager
    handles brush width automatically, you can repurpose ``F`` to change your *sculpt* radius
    while holding Alt to nudge lines. This is much faster than switching to Sculpt Mode.


Press F to Change Sculpt Radius in Draw Mode
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

**Location:** Grease Pencil → Grease Pencil Stroke Paint Mode

1. Change the ``F`` shortcut to ``wm.radial_control``
2. Change **Primary Data Path** to: ``tool_settings.gpencil_sculpt_paint.brush.size``
3. Leave everything else greyed out.


Hold Ctrl to Trim Lines in Draw Mode
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

**Location:** Grease Pencil → Grease Pencil Stroke Paint (Draw Brush)

1. Change the ``Ctrl + Left Mouse`` shortcut to ``gpencil.stroke_cutter``
2. Tick **"Flat Caps"** to flatten the ends of cut lines
3. Repeat this keymap in **Grease Pencil Stroke Paint (Erase)** if you want trimming in Erase mode too

.. warning::
    Set the Trimmer's **Threshold** to something very low (like ``0.001``) or cuts may not be accurate.
    Find this in Draw Mode → Scissors tool → Top left "Threshold" setting.


D Key to Switch to Draw Mode
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

**Location:** Grease Pencil → Grease Pencil Stroke Paint (Erase)

1. Create a new keymap, set key to ``D``
2. Set command to ``wm.tool_set_by_id`` and press Enter
3. Set **Identifier** to ``builtin_brush.Draw`` and press Enter
4. Leave all other boxes greyed out
5. Repeat in these sections:

   - Grease Pencil Stroke Paint (Fill)
   - Grease Pencil Stroke Paint Vertex Mode

6. Also add in **3D View → Object Non-modal**:

   - Command: ``object.mode_set``
   - Mode: ``Draw Mode``

.. tip::
    Now pressing ``D`` will always return you to Draw Mode, whether you're in Edit Mode,
    Erase Tool, Fill Tool, Sculpt Mode, etc.


E Key to Switch to Erase Mode
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

**Location:** Grease Pencil → Grease Pencil Stroke Paint (Draw Brush)

1. Create a new keymap, set key to ``E``
2. Set command to ``wm.tool_set_by_id`` and press Enter
3. Set **Identifier** to ``builtin_brush.Erase`` and press Enter
4. Leave all other boxes greyed out
5. Repeat in these sections:

   - Grease Pencil Stroke Paint (Fill)
   - Grease Pencil Stroke Paint Vertex Mode

.. note::
    In Edit Mode, ``E`` is reserved for Extruding vertices, so this only works in paint modes.


S Key to Switch to Sculpt Mode
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

**Location:** Grease Pencil → Grease Pencil Stroke Paint (Draw Brush)

1. Create a new keymap, set key to ``S``
2. Set command to ``object.mode_set`` and press Enter
3. Set **Mode** to ``Sculpt Mode`` and press Enter

   .. warning::
      There may be multiple "Sculpt Mode" options. Hover your mouse to find the one that says
      **"Sculpt Grease Pencil Strokes"** — the others won't work.

4. Leave all other boxes greyed out
5. Repeat in these sections:

   - Grease Pencil Stroke Paint (Erase)
   - Grease Pencil Stroke Paint (Fill)


X Key to Switch to Fill Mode
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

**Location:** Grease Pencil → Grease Pencil Stroke Paint (Draw Brush)

1. Create a new keymap, set key to ``X``
2. Set command to ``wm.tool_set_by_id`` and press Enter
3. Set **Identifier** to ``builtin_brush.Fill`` and press Enter
4. Leave all other boxes greyed out
5. Repeat in **Grease Pencil Stroke Paint (Erase)**

.. note::
    In Edit Mode, ``X`` is reserved for Delete, so this only works in paint modes.


Ctrl-F to Toggle Fade Inactive Layers
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

**Location:** Keymaps → Window

1. Create a new keymap, set key to ``Ctrl-F``
2. Set command to ``wm.context_toggle`` and press Enter
3. Set **Context Attribute** to: ``space_data.overlay.use_gpencil_fade_layers``
4. Leave all other boxes greyed out

.. tip::
    Adjust the **Fade Inactive Layers** slider in the top right (next to Show Overlays)
    to control how much the other layers fade. You must have a GP object selected for this
    icon to be visible!


Shift-A to Apply Material
^^^^^^^^^^^^^^^^^^^^^^^^^

**Location:** Grease Pencil → Grease Pencil Stroke Edit Mode

1. Create a new keymap, set key to ``Shift-A``
2. Set command to ``gpencil.stroke_change_color`` and press Enter
3. Leave all other boxes greyed out

.. tip::
    This changes the material of selected vertices to your active material — very useful
    for quickly reassigning materials in Edit Mode.