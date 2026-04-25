.. _keybindings:

===============================
Important Keybindings
===============================

Efficient animation with The Violence Tool relies on a combination of tool-specific shortcuts and standard Blender navigation.

.. _native-shortcuts:

Essential Blender Shortcuts
----------------------------

Fred recommends mastering these native Blender shortcuts for a smooth workflow:

+---------------------+------------------------------------------+-----------------------------+
| **Shortcut**        | **Action**                               | **Context**                 |
+=====================+==========================================+=============================+
| ``Ctrl + Tab``      | Open Mode Menu (Draw/Edit/Sculpt)        | Any Mode                    |
+---------------------+------------------------------------------+-----------------------------+
| ``Z``               | Toggle Viewport Shading (Rendered/Solid) | 3D Viewport                 |
+---------------------+------------------------------------------+-----------------------------+
| ``Numpad 0``        | Toggle Camera View                       | 3D Viewport                 |
+---------------------+------------------------------------------+-----------------------------+
| ``Ctrl + MMB``      | Zoom In/Out                              | 3D Viewport                 |
+---------------------+------------------------------------------+-----------------------------+
| ``Tab``             | Toggle Edit Mode                         | Grease Pencil Object        |
+---------------------+------------------------------------------+-----------------------------+
| ``W``               | Cycle Selection Modes (Vertex/Line)      | Edit Mode                   |
+---------------------+------------------------------------------+-----------------------------+
| ``1 / 2 / 3``       | Select Vertex / Line / Intersection      | Edit Mode                   |
+---------------------+------------------------------------------+-----------------------------+
| ``Alt + S``         | Change Stroke Thickness                  | Edit Mode                   |
+---------------------+------------------------------------------+-----------------------------+
| ``Shift + Alt + S`` | Make Stroke Uniform (Circular)           | Edit Mode                   |
+---------------------+------------------------------------------+-----------------------------+
| ``F3``              | Search Operators (e.g., "Adaptive")      | Any Mode                    |
+---------------------+------------------------------------------+-----------------------------+
| ``I``               | Insert Keyframe                          | Timeline / Dope Sheet       |
+---------------------+------------------------------------------+-----------------------------+
| ``Shift + Space``   | Play/Pause Animation                     | Timeline / Dope Sheet       |
+---------------------+------------------------------------------+-----------------------------+

.. admonition:: Fred's Tip

   Erasing: Avoid the Eraser tool in Draw Mode. Instead, press ``Tab`` to enter Edit Mode, select the unwanted points, and press ``X`` to delete them. This offers greater precision.

--------------------------------------------------------------------------------

.. _tool-specific:

Tool-Specific Shortcuts
------------------------

These keybinds are specific to The Violence Tool.

**The Layer Switcher Menu**
~~~~~~~~~~~~~~~~~~~~~~~~~~~

The most important keybind. Opens a popup menu at your cursor with all layer options.

   *  **Setup:** Bind ``wm.call_menu`` to a key (e.g., ``Tab`` or ``Space``).
   *  **Menu Name:** ``OBJECT_MT_Fred_Custom_Layer_Menu``

**Modal Keys (Hold to Activate)**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Some keybinds are intended to work as "hold" keys. To set this up:

   1. Bind ``fred.op16`` to ``A`` with event type **Press**.
   2. Bind ``fred.op17`` to ``A`` with event type **Release**.

Now, holding ``A`` down enables automerge **while** drawing.

**Quick Actions**
~~~~~~~~~~~~~~~~~

+---------------------+-------------------+------------------------------------------+
| Keybind             | Operator          | Action                                   |
+=====================+===================+==========================================+
| Alt-F               | ``fred.op3``      | Join and smooth two selected strokes     |
+---------------------+-------------------+------------------------------------------+
| Alt-R               | ``fred.op8``      | Randomize line art (small pass)          |
+---------------------+-------------------+------------------------------------------+
| Shift-Alt-R         | ``fred.op23``     | Randomize line art (large pass)          |
+---------------------+-------------------+------------------------------------------+
| Shift-Alt-F         | ``fred.op24``     | Smooth the selected stroke               |
+---------------------+-------------------+------------------------------------------+
| Ctrl-F              | ``fred.op18``     | Toggle Fade Inactive Layers              |
+---------------------+-------------------+------------------------------------------+
| Ctrl-Alt-Shift-X    | ``fred.op19``     | Toggle Onion Skins                       |
+---------------------+-------------------+------------------------------------------+

--------------------------------------------------------------------------------

.. _workflow-tips:

------------------------

.. admonition:: Fred's Tip

   If you forget a shortcut, hit F3 and type the function name. It shows you the shortcut and lets you search for it.

When switching tasks, always check these three settings:

   1. **Layer** (Is the correct layer active?)
   2. **Tool** (Is it Draw, Fill, or Sculpt?)
   3. **Material** (Is the correct material selected?)

**Optimizing File Size**
~~~~~~~~~~~~~~~~~~~~~~~~

If your file becomes too large due to too many vertices:

   1.  Select all strokes (or use Multi-Frame Editing).
   2.  Press **F3** and search for **"Adaptive"**.
   3.  Set the threshold (e.g., ``0.001``) to simplify strokes.

**Material Efficiency**
~~~~~~~~~~~~~~~~~~~~~~~

Remember that changing a material in a slot updates **every frame** using that slot. To change a color globally, edit the material in the slot rather than refilling frames.