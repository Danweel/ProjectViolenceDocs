.. _keybindings:

===============================
Important Keybindings
===============================

Efficient animation with The Violence Tool relies on a combination of tool-specific shortcuts and standard Blender navigation.

Some operators are not available from the panel. Operators OP8 (Jiggle), OP36–OP40, and several utility operators (OP1–OP7, OP9–OP24) 
do not appear in the Layer Selector panel or the Layer Switcher menu. To use these, you have to bind them to a 
keymap in Edit → Preferences → Keymap → 3D View → 3D Viewport, or search for them with F3.

.. admonition:: Dan's Tip

   Since the tool requires a lot of unique keybinds and such, it can be helpful to have a seperate installation of Blender 4.1.1 
   just for these animation projects. Blender is easly installed in parallel so your 4.1.1 Fred build won't interfere with 
   your other potential Blender projects or experiments. Handy if you have the space!

.. _native-shortcuts:

Essential Blender Shortcuts
----------------------------

Fred recommends mastering these native Blender shortcuts for a smooth workflow. 
Knowing the underlying **Operator ID** helps you find and customize these bindings in 
**Edit > Preferences > Keymap**.

+-----------------------+------------------------------------------+-----------------------------+--------------------------------+------------------------------------+
| **Shortcut**          | **Action**                               | **Context**                 | **Blender Operator ID**        | **Keymap Section Path**            |
+=======================+==========================================+=============================+================================+====================================+
| ``Ctrl + Tab``        | Open Mode Menu (Draw/Edit/Sculpt)        | Any Mode                    | ``wm.call_menu_pie``           | Window                             |
+-----------------------+------------------------------------------+-----------------------------+--------------------------------+------------------------------------+
| ``Z``                 | Toggle Viewport Shading                  | 3D Viewport                 | ``view3d.shading_pie``         | 3D View → 3D Viewport              |
+-----------------------+------------------------------------------+-----------------------------+--------------------------------+------------------------------------+
| ``Numpad 0``          | Toggle Camera View                       | 3D Viewport                 | ``view3d.view_camera``         | 3D View → 3D Viewport              |
+-----------------------+------------------------------------------+-----------------------------+--------------------------------+------------------------------------+
| ``Ctrl + MMB``        | Zoom In/Out                              | 3D Viewport                 | ``view3d.zoom``                | 3D View → 3D Viewport              |
+-----------------------+------------------------------------------+-----------------------------+--------------------------------+------------------------------------+
| ``Tab``               | Toggle Edit Mode                         | Grease Pencil Object        | ``object.mode_set``            | Window                             |
+-----------------------+------------------------------------------+-----------------------------+--------------------------------+------------------------------------+
| ``W``                 | Cycle Selection Modes (Vertex/Line)      | Edit Mode                   | ``gpencil.select_mode_toggle`` | Grease Pencil → Stroke Edit Mode   |
+-----------------------+------------------------------------------+-----------------------------+--------------------------------+------------------------------------+
| ``1 / 2 / 3``         | Select Vertex / Line / Intersection      | Edit Mode                   | ``gpencil.select_mode_toggle`` | Grease Pencil → Stroke Edit Mode   |
+-----------------------+------------------------------------------+-----------------------------+--------------------------------+------------------------------------+
| ``Alt + S``           | Change Stroke Thickness                  | Edit Mode                   | ``gpencil.stroke_thickness``   | Grease Pencil → Stroke Edit Mode   |
+-----------------------+------------------------------------------+-----------------------------+--------------------------------+------------------------------------+
| ``Shift + Alt + S``   | Make Stroke Uniform (Circular)           | Edit Mode                   | ``gpencil.stroke_make_uniform``| Grease Pencil → Stroke Edit Mode   |
+-----------------------+------------------------------------------+-----------------------------+--------------------------------+------------------------------------+
| ``F3``                | Search Operators                         | Any Mode                    | ``wm.search_menu``             | Window                             |
+-----------------------+------------------------------------------+-----------------------------+--------------------------------+------------------------------------+
| ``I``                 | Insert Keyframe                          | Timeline / Dope Sheet       | ``anim.keyframe_insert_menu``  | Timeline / Dope Sheet              |
+-----------------------+------------------------------------------+-----------------------------+--------------------------------+------------------------------------+
| ``Shift + Space``     | Play/Pause Animation                     | Timeline / Dope Sheet       | ``screen.animation_play``      | Timeline / Dope Sheet              |
+-----------------------+------------------------------------------+-----------------------------+--------------------------------+------------------------------------+

How to Find These in Preferences
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   1. Go to **Edit > Preferences > Keymap**.
   2. Type the **Operator ID** into the search bar.
   3. You will see the current keybinding if one exists

If nothing comes up, this is because a keybind has not been set yet. You'll need to click the +Add New button 
at the bottom of each section.

.. _how-to-bind-operators:

How to Bind Operators to Keys
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The **Keymap Section Path** column tells you exactly where to navigate in 
**Edit > Preferences > Keymap** to add a new binding.

**Step-by-Step:**

1.  Go to **Edit > Preferences > Keymap**.
2.  On the left tree, expand the section listed in the **Keymap Section Path** column.
    * Example: For ``3D View → 3D View (Global)``, expand **3D View**, then **3D View (Global)**.
3.  Scroll to the **bottom** of that section.
4.  Click the **"+ Add New"** button.
5.  In the new row:
    * **Left field (Operator):** Type the **Operator ID** (e.g., ``fred.op8``).
    * **Right field (Event):** Click and press your desired key (e.g., ``Alt-R``).
6.  For **Hold-to-Activate** keys (marked with "(Hold)" and "(Release)"):
    * Add **two** bindings for the same key.
    * First binding: Set **Event Type** to **``Press``**.
    * Second binding: Set **Event Type** to **``Release``**.
7.  Click **Save Preferences** at the bottom.

.. admonition:: Fred's Tip

   Erasing: Avoid the Eraser tool in Draw Mode. Instead, press ``Tab`` to enter Edit Mode, select the unwanted points, and press ``X`` to delete them. This offers greater precision.

.. _tool-specific:

Tool-Specific Shortcuts
------------------------

.. warning::

   The tool needs to be fully installed as an addon, not just 'run' from the console. Make sure you've gone to Edit > Preferences > Addons and imported it.

.. _layerswitchermenu-setup:

**The Layer Switcher Menu**
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Opens a popup menu at your cursor with all layer options.

   * **Setup:** Bind ``wm.call_menu`` to a key (e.g., ``Tab`` or ``Space``).
   * **Operator ID:** ``OBJECT_MT_Fred_Custom_Layer_Menu``

.. _quickactionkeys-setup:

**Quick Actions**
~~~~~~~~~~~~~~~~~

+----------------------------+----------------------------------------------------------+---------------------+--------------------+-------------------------------------+
| **Shortcut**               | **Action**                                               | **Context**         | **Operator ID**    | **Keymap Section Path**             |
+============================+==========================================================+=====================+====================+=====================================+
| ``Alt-F``                  | Join and smooth two selected strokes                     | Edit Mode           | ``fred.op3``       | Grease Pencil → Stroke Edit Mode    |
+----------------------------+----------------------------------------------------------+---------------------+--------------------+-------------------------------------+
| ``Alt-R``                  | Jiggle: Add texture to entire layer                      | 3D Viewport         | ``fred.op8``       | 3D View → 3D View (Global)          |
+----------------------------+----------------------------------------------------------+---------------------+--------------------+-------------------------------------+
| ``Shift-Alt-R``            | Large Pass: Aggressive distortion                        | 3D Viewport         | ``fred.op23``      | 3D View → 3D View (Global)          |
+----------------------------+----------------------------------------------------------+---------------------+--------------------+-------------------------------------+
|                            | Randomize only selected vertices                         | 3D Viewport         | ``fred.op12``      | 3D View → 3D View (Global)          |
+----------------------------+----------------------------------------------------------+---------------------+--------------------+-------------------------------------+
| ``Shift-Alt-F``            | Smooth the selected stroke                               | Edit Mode           | ``fred.op24``      | Grease Pencil → Stroke Edit Mode    |
+----------------------------+----------------------------------------------------------+---------------------+--------------------+-------------------------------------+
| ``Ctrl-F``                 | Toggle Fade Inactive Layers                              | ?                   | ``fred.op18``      | Window                              |
+----------------------------+----------------------------------------------------------+---------------------+--------------------+-------------------------------------+
| ``Ctrl-Alt-Shift-X``       | Toggle Onion Skins                                       | ?                   | ``fred.op19``      | Window                              |
+----------------------------+----------------------------------------------------------+---------------------+--------------------+-------------------------------------+

It should be noted that ``fred.op12`` functions slightly differentlly than ``fred.op8`` Jiggle beyond 'small' and 'large'.
Since (fred.applynoise) is adjustable, you **can** do 'small' jitters with it, but it affects everything on the layer. 
OP12 specifically ranomizes the selected vertices, but has locked properties.

.. admonition:: Dan's Tip

   There's another plugin for Blender called "Is Key Free" that's useful for checking that you're not overwriting an important keybind.

--------------------------------------------------------------------------------

.. _timelinekeys-setup:

**Timeline Operators**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

+----------------------------+------------------------------------------------------+------------------------+----------------------+-------------------------------------+
| **Shortcut**               | **Action**                                           | **Context**            | **Operator ID**      | **Keymap Section Path**             |
+============================+======================================================+========================+======================+=====================================+
| ``Left Arrow``             | **Prev Keyframe** (Undo-supported)                   | 3D Viewport            | ``fred.op4``         | 3D View → 3D View (Global)          |
+----------------------------+------------------------------------------------------+------------------------+----------------------+-------------------------------------+
| ``Right Arrow``            | **Next Keyframe** (Undo-supported)                   | 3D Viewport            | ``fred.op5``         | 3D View → 3D View (Global)          |
+----------------------------+------------------------------------------------------+------------------------+----------------------+-------------------------------------+
| ``Ctrl+Left Arrow``        | **Prev Marker** (Undo-supported)                     | 3D Viewport            | ``fred.op6``         | 3D View → 3D View (Global)          |
+----------------------------+------------------------------------------------------+------------------------+----------------------+-------------------------------------+
| ``Ctrl+Right Arrow``       | **Next Marker** (Undo-supported)                     | 3D Viewport            | ``fred.op7``         | 3D View → 3D View (Global)          |
+----------------------------+------------------------------------------------------+------------------------+----------------------+-------------------------------------+

.. _brushswappingkeys-setup:

**Brush & Tool Swapping**
~~~~~~~~~~~~~~~~~~~~~~~~~

+----------------------------+----------------------------------------------------------+---------------------+----------------------+------------------------------------+
| **Shortcut**               | **Action**                                               | **Context**         | **Operator ID**      | **Keymap Section Path**            |
+============================+==========================================================+=====================+======================+====================================+
| ``1``                      | Switch to **Eraser Point** brush.                        | Paint Mode          | ``fred.op9``         | Grease Pencil → Stroke Paint Mode  |
+----------------------------+----------------------------------------------------------+---------------------+----------------------+------------------------------------+
| ``2``                      | Switch to **Eraser Stroke** brush.                       | Paint Mode          | ``fred.op10``        | Grease Pencil → Stroke Paint Mode  |
+----------------------------+----------------------------------------------------------+---------------------+----------------------+------------------------------------+
| ``3``                      | Switch to **01 PEN** brush (Custom).                     | Paint Mode          | ``fred.op28``        | Grease Pencil → Stroke Paint Mode  |
+----------------------------+----------------------------------------------------------+---------------------+----------------------+------------------------------------+
| ``4``                      | Switch to **01 PEN STRENGTH P** brush (Custom).          | Paint Mode          | ``fred.op29``        | Grease Pencil → Stroke Paint Mode  |
+----------------------------+----------------------------------------------------------+---------------------+----------------------+------------------------------------+
| ``D`` (Hold)               | Enable **Draw Behind**.                                  | Paint Mode          | ``fred.op21``        | Grease Pencil → Stroke Paint Mode  |
+----------------------------+----------------------------------------------------------+---------------------+----------------------+------------------------------------+
| ``D`` (Release)            | Disable **Draw Behind**.                                 | Paint Mode          | ``fred.op22``        | Grease Pencil → Stroke Paint Mode  |
+----------------------------+----------------------------------------------------------+---------------------+----------------------+------------------------------------+
| ``A`` (Hold)               | Enable Automerge: Merges new strokes with existing ones. | Paint Mode          | ``fred.op16``        | Grease Pencil → Stroke Paint Mode  |
+----------------------------+----------------------------------------------------------+---------------------+----------------------+------------------------------------+
| ``A`` (Release)            | Disable Automerge: Stops merging strokes.                | Paint Mode          | ``fred.op17``        | Grease Pencil → Stroke Paint Mode  |
+----------------------------+----------------------------------------------------------+---------------------+----------------------+------------------------------------+

.. _visibilitykeys-setup:

**Visibility & Layer Management**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

+----------------------------+----------------------------------------------------------+----------------------+----------------------+-----------------------------------+
| **Shortcut**               | **Action**                                               | **Context**          | **Operator ID**      | **Keymap Section Path**           |
+============================+==========================================================+======================+======================+===================================+
| ``L``                      | **Lock Non-Character** layers.                           | 3D Viewport          | ``fred.op13``        | 3D View → 3D View (Global)        |
+----------------------------+----------------------------------------------------------+----------------------+----------------------+-----------------------------------+
| ``M``                      | **Unlock Mouth + Head** layers.                          | 3D Viewport          | ``fred.op15``        | 3D View → 3D View (Global)        |
+----------------------------+----------------------------------------------------------+----------------------+----------------------+-----------------------------------+
| ``Shift+H``                | **Reveal All** GP materials.                             | 3D Viewport          | ``fred.op32``        | 3D View → 3D View (Global)        |
+----------------------------+----------------------------------------------------------+----------------------+----------------------+-----------------------------------+
| ``H``                      | **Toggle Layer** visibility.                             | 3D Viewport          | ``fred.op40``        | 3D View → 3D View (Global)        |
+----------------------------+----------------------------------------------------------+----------------------+----------------------+-----------------------------------+

.. _utilitykeys-setup:

**Advanced & Utility**
~~~~~~~~~~~~~~~~~~~~~~

+----------------------------+----------------------------------------------------------+----------------------+----------------------+-----------------------------------+
| **Shortcut**               | **Action**                                               | **Context**          | **Operator ID**      | **Keymap Section Path**           |
+============================+==========================================================+======================+======================+===================================+
| ``F5``                     | **Create Fox Rig** (full setup).                         | 3D Viewport          | ``fred.op25``        | 3D View → 3D View (Global)        |
+----------------------------+----------------------------------------------------------+----------------------+----------------------+-----------------------------------+
| ``F6``                     | **Disable Lights** on selected GP object.                | 3D Viewport          | ``fred.op37``        | 3D View → 3D View (Global)        |
+----------------------------+----------------------------------------------------------+----------------------+----------------------+-----------------------------------+
| ``F7``                     | **Toggle Compositor** (Disabled ↔ Always).               | 3D Viewport          | ``fred.op39``        | 3D View → 3D View (Global)        |
+----------------------------+----------------------------------------------------------+----------------------+----------------------+-----------------------------------+
| ``0``                      | **Stroke 0%** (invisible strokes).                       | Paint Mode           | ``fred.op1``         | Grease Pencil → Stroke Paint Mode |
+----------------------------+----------------------------------------------------------+----------------------+----------------------+-----------------------------------+
| ``9``                      | **Stroke 100%** (full opacity).                          | Paint Mode           | ``fred.op2``         | Grease Pencil → Stroke Paint Mode |
+----------------------------+----------------------------------------------------------+----------------------+----------------------+-----------------------------------+
| ``F``                      | **Fill Mode: Control** (precise filling).                | Paint Mode           | ``fred.op34``        | Grease Pencil → Stroke Paint Mode |
+----------------------------+----------------------------------------------------------+----------------------+----------------------+-----------------------------------+
| ``G``                      | **Fill Mode: Both** (strokes + control).                 | Paint Mode           | ``fred.op35``        | Grease Pencil → Stroke Paint Mode |
+----------------------------+----------------------------------------------------------+----------------------+----------------------+-----------------------------------+

.. _modal-keys-setup:

Setting Up "Hold-to-Activate" Keys
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Some tools (like **Automerge** or **Draw Behind**) are designed to work only while you 
hold a key down. To set this up in Blender:

1.  **Open Keymap Preferences**
    Go to **Edit > Preferences > Keymap**.

2.  **Locate the Operator**
    In the search bar at the top, type the operator name (e.g., ``fred.op16``).
    * *Tip:* If you don't see it, ensure the addon is enabled and you are searching in the correct category (usually **3D Viewport** or **Window**).

3.  **Add a New Binding**
    Click the **+** (plus) icon next to the operator name to add a new keybinding.

4.  **Configure the "Press" Event**
    * **Key:** Click the key field and press the key you want to use (e.g., ``A``).
    * **Event Type:** Change this from ``Any`` to **``Press``**.
    *   *This ensures the action starts when you push the key down.*

5.  **Add the "Release" Binding**
    * Click the **+** icon again to add a **second** binding for the *same* operator.
    * **Key:** Press the **same key** (e.g., ``A``).
    * **Event Type:** Change this to **``Release``**.
    *   *This ensures the action stops when you let go of the key.*

6.  **Verify Context**
    * Ensure the **Context** column matches your workflow (e.g., **3D Viewport** or **Grease Pencil Stroke Paint Mode**).



.. admonition:: Fred's Tip

   If you forget a shortcut, hit F3 and type the function name. It shows you the shortcut and lets you search for it.

--------------------------------------------------------------------------------

.. _workflow-tips:

Workflow Tips
-------------

When switching tasks, always check these three settings:
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   1. **Layer** (Is the correct layer active?)
   2. **Tool** (Is it Draw, Fill, or Sculpt?)
   3. **Material** (Is the correct material selected?)

**Optimizing File Size**
~~~~~~~~~~~~~~~~~~~~~~~~

If your file becomes too large due to too many vertices:

   1. Select all strokes (or use Multi-Frame Editing).
   2. Press **F3** and search for **"Adaptive"**.
   3. Set the threshold (e.g., ``0.001``) to simplify strokes.

**Material Efficiency**
~~~~~~~~~~~~~~~~~~~~~~~

Remember that changing a material in a slot updates **every frame** using that slot. 
To change a color globally, edit the material in the slot rather than refilling frames.

**Choosing the Right Keymap Context**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   When binding any operators to keys, the **Keymap Context** determines when the 
   shortcut is active. If you're in the wrong context, the key won't respond.

   * **3D Viewport:** Works in the 3D Viewport. This signifies operators 
      that switch modes internally (like Jiggle) or work across modes (like navigation).
   * **Paint Mode:** Specific to drawing and brush-specific 
      tools (Eraser swap, Stroke Strength).
   * **Edit Mode:** Only active while in Edit Mode. Use for tools that 
      require selected strokes (Join & Smooth, Micro-Jitter).

   Binding Jiggle (``fred.op8``) to Paint Mode instead of 3D Viewport. 
   Since Jiggle switches to Edit Mode internally, a Paint Mode 
   binding may not fire reliably ? TEST THIS

**Fred Operators for Timeline Navigation: Why use these instead of Arrow Keys?**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   You might wonder why we have ``fred.op5`` (Next Keyframe) when Blender has the ``Right Arrow`` key.

   **The Difference:**
   * **Native Arrow Keys:** Jump to the next keyframe but **do not** save this jump to the Undo history. If you jump forward and realize you made a mistake, you can't "undo" the jump.
   * **Fred's Operators:** Jump to the next keyframe **AND** push an Undo step.

   **The Workflow:**
   1. Bind ``fred.op5`` to ``Right Arrow`` (or a custom key, if you want to preserve undo silence).
   2. Jump forward through your animation.
   3. If you jump too far, press **``Ctrl+Z``**.
   4. The timeline **snaps back** to the previous keyframe instantly.

   Doing it this way adds these movements to the "Undo stack".

-------------------------

.. _additionaloperators-setup:

**Additional Operators (Keybind or F3 Only)**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The following operators have no panel button or menu entry. They can be 
accessed by pressing ``F3`` and typing the operator name, or by binding 
them to a key in **Preferences → Keymap → 3D View → 3D Viewport**.

+----------------------------+----------------------------------------------------------+----------------------------+----------------------+-----------------------------------+
| **Shortcut**               | **Action**                                               | **Context**                | **Operator ID**      | **Keymap Section Path**           |
+============================+==========================================================+============================+======================+===================================+
| ``F5``                     | **Create Fox Rig:** Creates a full GP rig with layers,   | 3D Viewport                | ``fred.op25``        | 3D View → 3D View (Global)        |
|                            | materials, and brushes. **Recommended starting point.**  |                            |                      |                                   |
+----------------------------+----------------------------------------------------------+----------------------------+----------------------+-----------------------------------+
| ``L``?                     | **Lock Non-Character:** Locks everything except the core | 3D Viewport                | ``fred.op13``        | 3D View → 3D View (Global)        |
|                            | character layers. Useful before applying noise.          |                            |                      |                                   |
+----------------------------+----------------------------------------------------------+----------------------------+----------------------+-----------------------------------+
| ``M``?                     | **Unlock Mouth + Head:** Unlocks mouth, mask, teeth,     | 3D Viewport                | ``fred.op15``        | 3D View → 3D View (Global)        |
|                            | AND head layers. For animating jaw movements.            |                            |                      |                                   |
+----------------------------+----------------------------------------------------------+----------------------------+----------------------+-----------------------------------+
| ``Shift+H`` ?              | **Reveal All:** Makes all hidden GP materials visible.   | 3D Viewport                | ``fred.op32``        | 3D View → 3D View (Global)        |
+----------------------------+----------------------------------------------------------+----------------------------+----------------------+-----------------------------------+
| ``F6`` ?                   | **Disable Lights:** Turns off scene lighting on the      | 3D Viewport                | ``fred.op37``        | 3D View → 3D View (Global)        |
|                            | selected GP object. Flat-shaded rendering.               |                            |                      |                                   |
+----------------------------+----------------------------------------------------------+----------------------------+----------------------+-----------------------------------+
| ``F7``  ?                  | **Toggle Compositor:** Switches viewport compositor      | 3D Viewport                | ``fred.op39``        | 3D View → 3D View (Global)        |
|                            | between Disabled and Always.                             |                            |                      |                                   |
+----------------------------+----------------------------------------------------------+----------------------------+----------------------+-----------------------------------+
| ``H`` ?                    | **Toggle Layer:** Hides/shows the currently active GP    | 3D Viewport                | ``fred.op40``        | 3D View → 3D View (Global)        |
|                            | layer.                                                   |                            |                      |                                   |
+----------------------------+----------------------------------------------------------+----------------------------+----------------------+-----------------------------------+
| ``0`` ?                    | **Stroke 0%:** Makes drawn strokes invisible.            | Paint Mode                 | ``fred.op1``         | Grease Pencil → Stroke Paint Mode |
+----------------------------+----------------------------------------------------------+----------------------------+----------------------+-----------------------------------+
| ``9``  ?                   | **Stroke 100%:** Makes drawn strokes fully opaque.       | Paint Mode                 | ``fred.op2``         | Grease Pencil → Stroke Paint Mode |
+----------------------------+----------------------------------------------------------+----------------------------+----------------------+-----------------------------------+
| ``D`` (Hold)   ?           | **Draw On Back On:** New strokes draw behind existing.   | Paint Mode                 | ``fred.op21``        | Grease Pencil → Stroke Paint Mode |
+----------------------------+----------------------------------------------------------+----------------------------+----------------------+-----------------------------------+
| ``D`` (Release) ?          | **Draw On Back Off:** New strokes draw on top.           | Paint Mode                 | ``fred.op22``        | Grease Pencil → Stroke Paint Mode |
+----------------------------+----------------------------------------------------------+----------------------------+----------------------+-----------------------------------+
| ``F``  ?                   | **Fill Mode: Control:** Fill brush affects control       | Paint Mode                 | ``fred.op34``        | Grease Pencil → Stroke Paint Mode |
|                            | points only (precise filling).                           |                            |                      |                                   |
+----------------------------+----------------------------------------------------------+----------------------------+----------------------+-----------------------------------+
| ``G``  ?                   | **Fill Mode: Both:** Fill brush affects strokes and      | Paint Mode                 | ``fred.op35``        | Grease Pencil → Stroke Paint Mode |
|                            | control points.                                          |                            |                      |                                   |
+----------------------------+----------------------------------------------------------+----------------------------+----------------------+-----------------------------------+
| ``?``                      | Flattens Y, smooths, and snaps to nearest face.          | 3D Viewport                | ``fred.op36``        | 3D View → 3D View (Global)        |
|                            | If drawing becomes misaligned, I think this fixes it     |                            |                      |                                   |
+----------------------------+----------------------------------------------------------+----------------------------+----------------------+-----------------------------------+

TEST OP36 - This refers to a mesh, is this to align strokes? If so I think it needs `gpencil.stroke_smooth` or `GPENCIL_MODIFIER_FLATTEN` rather than `bpy.ops.mesh.vertices_smooth`, but I'm guessing.

-------------------------------

.. _excluded-operators:

Excluded Operators
------------------

   The following operators exist in the code but require understanding the context:

   * ``fred.op11``  Superseded by ``fred.op25`` (Create GP Fox). Right now, it creates a blank GP named ART_FOX with one layer and one material. Don't use it.
   * ``fred.op14``  Selects the jaw layers only - but sometimes you need the head layers to move as well; ``fred.op15`` includes head layers.
   * ``fred.op26``  May not work correctly (this looks like an object not a name string).  I think  `bpy.ops.gpencil.material_set(mat)`  should be   `bpy.ops.gpencil.material_set(slot=slot.name)`  TEST THIS
   * ``fred.op30``  Broken syntax (``hide_viewport`` is a property, not callable). I think it should be: `bpy.ops.object.hide_view_set(state=True)` TEST THIS
   * ``fred.op38``  Placeholder? currently loops through all GP objects but doesn't seem to perform an action?
   * ``fred.op39``  This _might_ crash if used twice in a row. I think it doesn't unregister due to some nesting. It might not need registering in the first place because of its type? TEST THIS