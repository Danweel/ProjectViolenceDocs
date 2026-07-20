.. _keybindings:

Keybinds
========

.. _already-existing-hotkeys:

**Already-existing hotkeys**
----------------------------

These keys are set by default in Blender natively and are useful to the workflow.

+-----------------------+------------------------------------------+-----------------------------+--------------------------------+------------------------------------+
| **Shortcut**          | **Action**                               | **Context**                 | **Blender Operator ID**        | **Keymap Section Path**            |
+=======================+==========================================+=============================+================================+====================================+
| ``F3``                | Search Operators                         | Any Mode                    | ``wm.search_menu``             | Window                             |
+-----------------------+------------------------------------------+-----------------------------+--------------------------------+------------------------------------+
| ``Ctrl + Tab``        | Open Mode Menu (Draw/Edit/Sculpt/etc.)   | Any Mode                    | ``wm.call_menu_pie``           | Window                             |
+-----------------------+------------------------------------------+-----------------------------+--------------------------------+------------------------------------+
| ``Tab``               | Toggle Edit Mode                         | Any Mode                    | ``object.mode_set``            | Window                             |
+-----------------------+------------------------------------------+-----------------------------+--------------------------------+------------------------------------+
| ``Ctrl + MMB``        | Zoom 2D View                             | 3D Viewport                 | ``view3d.zoom``                | 3D View → 3D Viewport              |
+-----------------------+------------------------------------------+-----------------------------+--------------------------------+------------------------------------+
| ``Z``                 | Toggle Viewport Shading                  | 3D Viewport                 | ``view3d.shading_pie``         | 3D View → 3D Viewport              |
+-----------------------+------------------------------------------+-----------------------------+--------------------------------+------------------------------------+
| ``Numpad 0``          | Toggle Camera View                       | 3D Viewport                 | ``view3d.view_camera``         | 3D View → 3D Viewport              |
+-----------------------+------------------------------------------+-----------------------------+--------------------------------+------------------------------------+
| ``I``                 | Insert Keyframe                          | Timeline / Dope Sheet       | ``anim.keyframe_insert_menu``  | Timeline / Dope Sheet              |
+-----------------------+------------------------------------------+-----------------------------+--------------------------------+------------------------------------+
| ``1 / 2 / 3``         | Select Vertex / Line / Intersection      | Edit Mode                   | ``gpencil.selectmode_toggle``  | Grease Pencil → Stroke Edit Mode   |
+-----------------------+------------------------------------------+-----------------------------+--------------------------------+------------------------------------+

'Stroke thickness' is the base size of the brush, where 'stroke thickness' has data related to the pressure of the pen.
You can artificially grow points with stroke thickness until it looks like there's pen pressure, but it's artificial.

-----------------------------------------------------------------------------------------------------------

**Hotkeys that need to be set**
-------------------------------

Efficient animation with The Violence Tool relies on a combination of tool-specific shortcuts and standard Blender navigation.

Some operators in the script need to be bound to a keymap in
Edit → Preferences → Keymap → Key 'Section'.
You can also locate them like any other Blender function via Blender Search [F3].

.. admonition:: Dan's Tip

   Since the tool requires a lot of unique keybinds, it can be helpful to have a seperate installation of Blender 
   just for these animation projects. Different blender versions are easily installed in parallel, so one won't interfere with
   your other potential Blender projects or experiments as long as they're different versions. Handy if you have the space!

   Another good idea is saving Keybinds for this project under its own keymap file so you can switch to a default or different profile as necessary.

**Keymap Files**

Two keymap files are available from the community. Check out the pins in the Discord #GreasePencil channel. The main difference is the use of the MMB:

.. list-table::
   :widths: 30 30 40
   :header-rows: 1

   * - Variant
     - Middle Mouse
     - Best For
   * - **Fred's Original**
     - Removed from all shortcuts (pan/zoom)
     - Heavy daily tablet users. Fred wears out a quality mouse every ~2 years (though at 6-8 hours/day).
   * - **Rex's Variant**
     - Standard Blender middle mouse (pan/zoom)
     - Users accustomed to vanilla Blender navigation.

.. admonition:: Fred's Tip

   "I would rather people use my keymaps and change them from there. Even if people don't like my setup,
   it would be easier to change what they don't like about mine, than starting vanilla and having to enter
   all the script keymaps I use."

.. admonition:: Dan's Tip

   Definately recommended. Below, I've included the maps for what is in that keymap file. 
   I'll nmake editible .md version you can use if you make changes and want that reference on-hand. That'll be pinned in the channel too.

**Location of keybinds in Preferences**
---------------------------------------

   1. Go to **Edit > Preferences > Keymap**.
   2. Type the **Operator ID** into the search bar.
   3. You will see the current keybinding if one exists

If nothing comes up, this is because a keybind has not been set yet. You'll need to click the +Add New button 
at the bottom of each section. You can also search by key name.

.. _how-to-bind-operators:

How to Bind Operators to Keys
-----------------------------

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
    * **Right field (Event):** Click and press your desired key (e.g., ``R``, then select the ALT button).
6.  For **Hold-to-Activate** keys (marked with "(Hold)" and "(Release)"):
    * Add **two** bindings for the same key.
    * First binding: Set **Event Type** to **``Press``**.
    * Second binding: Set **Event Type** to **``Release``**.
7.  Click **Save Preferences** at the bottom.

I've included screenshots of the UI so that you can make sure your settings match visually as well. This might be a bit tough to navigate the first time,
but you'll get a sense for how keybinding works in Blender, and that can be really powerful knowlege to take to other projects as well! It's very worthwhile learning.

.. warning::

   The tool needs to be fully installed as an addon, not just 'run' from the console, though that will work temporarily. Make sure you've gone to Edit > Preferences > Addons and imported it.

-----------------------------------------------------------------------------------

.. _modal-keys-setup:

Setting Up "Hold-to-Activate" Keys (Modal)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

.. _brushswappingkeys-setup:

**Erasing**
~~~~~~~~~~~

Pressing E once switches to the eraser tool, but holding it down erases the full stroke if you touch any part of it. This set up is different than the default Blender "erase" setup, 
making use of two different Blender GP brushes (with eraser properties) set up in a specific way:

 .. image:: ../_static/images/op9_10_keys.png
   :alt: Visual of keybinds for Erasing: op9 and 10 specific settings in the UI.
   :scale: 100
   :align: center

--------------------------------------------------------------------------------

.. _penpressure-toggle:

Pen Pressure Toggle (OP29)
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. note::

   The v1.0 pen pressure toggle operator (``fred.op29``) is not present in v2.0.
   To toggle pen pressure on/off, use the brush strength operators
   (``gp.draw_brush_strength_full`` and ``gp.draw_brush_strength_none``)
   or adjust the pressure sensitivity toggle manually in the Tool tab (N-panel).

   .. image:: ../_static/images/op29_keys.png

   :alt: Visual of keybinds for OP29 in the UI.
   :scale: 100
   :align: center

This shortcut makes it easier to switch between types of pen than having to mess with strength settings with the mouse and changing them back again.

   .. image:: ../_static/images/penpressureonoff.png

   :alt: Example of the 01_PEN and PENP pen output.
   :scale: 100
   :align: center

Holding down R is useful for situations where fine lines are needed:

   .. image:: ../_static/images/holdR.png

   :alt: Example of the 01_PEN and PENP pen output.
   :scale: 100
   :align: center

   .. image:: ../_static/images/luigiwiskers.png

   :alt: Example of the 01_PEN and PENP pen output.
   :scale: 100
   :align: center

Pens like this are 'append'-able from other files if you have them set up somewhere else previously and your file is missing them. See Blender Documenation for help.
Practice files include them.

Here is an example of the AFIS settings for these pens:

   .. image:: ../_static/images/01_PEN_settings.png

   :alt: Screenshot of settings in the UI for 01_PEN.
   :scale: 100
   :align: center

   .. image:: ../_static/images/PENP_settings.png

   :alt: Screenshot of settings in the UI for PENP pen.
   :scale: 100
   :align: center

**Layer Switching**
~~~~~~~~~~~~~~~~~~~

+----------------------------+----------------------------------------------------------+----------------------+------------------------------------------+-----------------------------------+
| **Shortcut**               | **Action**                                               | **Context**          | **Operator ID**                          | **Keymap Section Path**           |
+============================+==========================================================+======================+==========================================+===================================+
| ``Shift 1-9``              | Switch to **Line** layer (e.g., Body=1, Head=2, Eyes=3)  | 3D Viewport          | ``fred.grease_layer_switch``             | 3D View → 3D View (Global)        |
+----------------------------+----------------------------------------------------------+----------------------+------------------------------------------+-----------------------------------+
| ``Alt-Shift 1-9``          | Switch to **Fill** layer + open material menu            | 3D Viewport          | ``fred.grease_layer_fill_switch``        | 3D View → 3D View (Global)        |
+----------------------------+----------------------------------------------------------+----------------------+------------------------------------------+-----------------------------------+
| ``Alt 1-9``                | Switch to **Sculpt** mode (unlocks Line + Fill layers)   | 3D Viewport          | ``fred.grease_layer_sculpt_switch``      | 3D View → 3D View (Global)        |
+----------------------------+----------------------------------------------------------+----------------------+------------------------------------------+-----------------------------------+
| ``Ctrl 1-4``               | Switch to **Mouth/Teeth** layers                         | 3D Viewport          | ``fred.grease_layer_switch`` (filtered)  | 3D View → 3D View (Global)        |
+----------------------------+----------------------------------------------------------+----------------------+------------------------------------------+-----------------------------------+

.. note::

   In v2.0, the old individually-named operators (``fred.body_lines``, ``fred.sculpt1``, etc.)
   have been consolidated into a single parameterized operator that accepts ``layer_filter``
   and ``material_filter`` properties. Each keybind (e.g., ``Shift+1``) calls the same operator
   with different filter values. See :doc:`operators` for technical details.

**Drawing & Erasing**
~~~~~~~~~~~~~~~~~~~~~

+----------------------------+----------------------------------------------------------+----------------------+----------------------------------------------------+-----------------------------------+
| **Shortcut**               | **Action**                                               | **Context**          | **Operator ID**                                    | **Keymap Section Path**           |
+============================+==========================================================+======================+====================================================+===================================+
| ``D``                      | Switch to **Draw Mode** + "MY STROKE" brush              | Paint Mode           | ``gpencil.draw_mode``                              | Grease Pencil → Stroke Paint Mode |
+----------------------------+----------------------------------------------------------+----------------------+----------------------------------------------------+-----------------------------------+
| ``E``                      | Switch to **Erase** (stroke or point brush)              | Paint Mode           | ``gpencil.erase_stroke`` / ``gpencil.erase_point`` | Grease Pencil → Stroke Paint Mode |
+----------------------------+----------------------------------------------------------+----------------------+----------------------------------------------------+-----------------------------------+
| ``Ctrl-X``                 | Delete **all connected** strokes/fills of selection      | Edit Mode            | ``gpencil.erase_all_of_selected``                  | Grease Pencil → Stroke Edit Mode  |
+----------------------------+----------------------------------------------------------+----------------------+----------------------------------------------------+-----------------------------------+

.. note::

   In Blender 5.2 LTS, the "Default Eraser" setting was removed. The last activated eraser brush is
   now used automatically. The tool's two eraser operators (``gpencil.erase_stroke`` and
   ``gpencil.erase_point``) set the specific eraser brush before switching to erase mode.

**Modal Keys (Hold-to-Activate)**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

+----------------------------+----------------------------------------------------------+----------------------+------------------------------------------+-----------------------------------+
| **Shortcut**               | **Action**                                               | **Context**          | **Operator ID**                          | **Keymap Section Path**           |
+============================+==========================================================+======================+==========================================+===================================+
| ``A`` (Press/Hold)         | Enable **Automerge**                                     | Paint Mode           | ``gp.auto_merge_on``                     | Grease Pencil → Stroke Paint Mode |
+----------------------------+----------------------------------------------------------+----------------------+------------------------------------------+-----------------------------------+
| ``A`` (Release)            | Disable **Automerge**                                    | Paint Mode           | ``gp.auto_merge_off``                    | Grease Pencil → Stroke Paint Mode |
+----------------------------+----------------------------------------------------------+----------------------+------------------------------------------+-----------------------------------+
| ``Alt`` (Press/Hold)       | Enter **Sculpt Mode**                                    | Paint Mode           | ``gp.sculpt_mode_on``                    | Grease Pencil → Stroke Paint Mode |
+----------------------------+----------------------------------------------------------+----------------------+------------------------------------------+-----------------------------------+
| ``Alt`` (Release)          | Return to **Paint Mode**                                 | Sculpt Mode          | ``gp.sculpt_mode_off``                   | Grease Pencil → Stroke Paint Mode |
+----------------------------+----------------------------------------------------------+----------------------+------------------------------------------+-----------------------------------+

.. admonition:: Fred's Tip

   You MUST hold the toggle key down BEFORE you start drawing, and you MUST wait until you lift your pen
   up from drawing before you let go of the key. If you let go of the press/release toggle for anything
   while you're still drawing or erasing a stroke, the toggle will "hang" because Blender doesn't register
   press/releases in the middle of drawing a stroke.

   If that happens and the toggle gets stuck enabled, just lift your pen and tap the toggle key once.

.. note::

   The ``Alt`` sculpt toggle looks jarring when switching back and forth, but this is a Blender limitation —
   there is no smoother way to handle modal mode switching. Holding ``Alt`` literally switches to sculpt
   mode while you hold it.

**Utility & Toggle Keys**
~~~~~~~~~~~~~~~~~~~~~~~~~

+----------------------------+----------------------------------------------------------+----------------------+------------------------------------------+-----------------------------------+
| **Shortcut**               | **Action**                                               | **Context**          | **Operator ID**                          | **Keymap Section Path**           |
+============================+==========================================================+======================+==========================================+===================================+
| ``Alt-F``                  | **Join & Smooth** two selected strokes                   | Edit Mode            | ``gp.join_and_smooth``                   | Grease Pencil → Stroke Edit Mode  |
+----------------------------+----------------------------------------------------------+----------------------+------------------------------------------+-----------------------------------+
| ``Ctrl-F``                 | Toggle **Fade Inactive Layers**                          | Any Mode             | ``gp.toggle_fade``                       | Window                            |
+----------------------------+----------------------------------------------------------+----------------------+------------------------------------------+-----------------------------------+
| ``C``                      | Toggle **Trimmer** mode                                  | 3D Viewport          | (Blender native, remapped from Ctrl)     | 3D View → 3D View (Global)        |
+----------------------------+----------------------------------------------------------+----------------------+------------------------------------------+-----------------------------------+
| ``Ctrl-Shift-R``           | Toggle sculpt **selection mode** (all vs selected only)  | Sculpt Mode          | (Blender native)                         | Sculpt → Sculpt (Global)          |
+----------------------------+----------------------------------------------------------+----------------------+------------------------------------------+-----------------------------------+

.. note::

   ``C`` for trimmer was remapped from ``Ctrl`` because ``Ctrl`` conflicts with other tool shortcuts.
   If you try to do any other Ctrl-based shortcuts, it puts you in trim mode before hitting the rest
   of the keys. Setting ``Ctrl`` to just toggle trim mode avoids this.

.. admonition:: Fred's Tip

   "I just couldn't find a way to use Ctrl-Left Mouse while holding it down. You have to set Ctrl to
   just toggle to trim mode, so if you try to do any other ctrl-based shortcuts, it puts in trim mode
   before hitting the rest of the keys, really annoying."

-------------------------------------------------------------------------------------------

.. _unbound-operators:

Unbound Operators (Available but Not Yet Assigned)
---------------------------------------------------

These operators exist in the v2.0 code but may not have keybinds in the default keymap file.
Fred is binding additional operators as he encounters them during testing. You can bind these
yourself if you find them useful:

+--------------------------------------------+---------------------------------------------------+-----------------------------------+
| **Operator ID**                            | **Action**                                        | **Keymap Section Path**           |
+============================================+===================================================+===================================+
| ``gp.draw_brush_strength_full``            | Set brush strength to 100%                        | Grease Pencil → Stroke Paint Mode |
+--------------------------------------------+---------------------------------------------------+-----------------------------------+
| ``gp.draw_brush_strength_none``            | Set brush strength to 0%                          | Grease Pencil → Stroke Paint Mode |
+--------------------------------------------+---------------------------------------------------+-----------------------------------+
| ``gp.prev_keyframe``                       | Jump to previous keyframe (undo-supported)        | 3D View → 3D View (Global)        |
+--------------------------------------------+---------------------------------------------------+-----------------------------------+
| ``gp.next_keyframe``                       | Jump to next keyframe (undo-supported)            | 3D View → 3D View (Global)        |
+--------------------------------------------+---------------------------------------------------+-----------------------------------+
| ``gp.prev_marker``                         | Jump to previous marker (undo-supported)          | 3D View → 3D View (Global)        |
+--------------------------------------------+---------------------------------------------------+-----------------------------------+
| ``gp.next_marker``                         | Jump to next marker (undo-supported)              | 3D View → 3D View (Global)        |
+--------------------------------------------+---------------------------------------------------+-----------------------------------+
| ``gp.center_timeline``                     | Center timeline on selected frames                | Dope Sheet                        |
+--------------------------------------------+---------------------------------------------------+-----------------------------------+
| ``gp.draw_behind_on``                      | Enable draw-on-back                               | Grease Pencil → Stroke Paint Mode |
+--------------------------------------------+---------------------------------------------------+-----------------------------------+
| ``gp.draw_behind_off``                     | Disable draw-on-back                              | Grease Pencil → Stroke Paint Mode |
+--------------------------------------------+---------------------------------------------------+-----------------------------------+
| ``scene.toggle_realtime_compositor``       | Toggle viewport compositor on/off                 | 3D View → 3D View (Global)        |
+--------------------------------------------+---------------------------------------------------+-----------------------------------+
| ``gp.apply_material_and_stroke``           | Apply active material + set stroke type to strokes| Grease Pencil → Stroke Paint Mode |
+--------------------------------------------+---------------------------------------------------+-----------------------------------+
| ``fred.grease_layer_fill_specific_switch`` | Switch to fill layer with specific material       | 3D View → 3D View (Global)        |
+--------------------------------------------+---------------------------------------------------+-----------------------------------+

.. note::

   ``gp.apply_material_and_stroke`` is the only operator in v2.0 with Blender undo
   support (``bl_options = {'REGISTER', 'UNDO'}``). Other operators use manual ``undo_push()`` calls. This can potentially 
   affect the exact moment Blender 'undo's to, so let us know if that aspect could be improved as you encounter things with it.

-------------------------------------------------------------------------------------------

.. _native-substitutes:

Native Blender Substitutes (v1.0 Features Now Handled by Blender)
------------------------------------------------------------------

.. list-table::
   :widths: 25 25 50
   :header-rows: 1

   * - Old v1.0 Operator
     - Replacement
     - How to Access
   * - ``fred.op8`` / ``fred.op23`` (Randomize/Noise)
     - **Noise Modifier**
     - Modifiers tab → Add Modifier → Effect → Noise. Adjust Strength, Scale, Jitter, Seed. Non-destructive, keyframable.
   * - ``fred.op19`` (Toggle Onion Skins)
     - **Viewport Overlays**
     - Click Overlays button (top-right of 3D View) → check/uncheck Onion Skinning. Per-layer control via eye icon in layer list. Advanced settings in N-panel Onion Skinning panel.
   * - ``fred.op20`` (Clear Vertex Paints)
     - **Vertex Colors deletion**
     - Object Data Properties (green triangle) → Vertex Colors panel → click X on color layer. Or Vertex Paint mode → Clear brush.
   * - ``fred.op24`` (Smooth Stroke standalone)
     - **Native smooth** or ``gp.join_and_smooth``
     - Edit Mode → select stroke → F3 → search "stroke smooth". Or use Alt-F (Join & Smooth) and undo the join if only smoothing is needed.
   * - ``fred.op8`` / ``fred.applynoise`` (Apply Noise dialog)
     - **Noise Modifier** (alternative)
     - Same as above. The dialog-based approach is replaced by the non-destructive modifier workflow.

-------------------------------------------------------------------------------------------

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
To change a color globally, edit the material in the slot rather than refilling any frames.

**Choosing the Right Keymap Context**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   When binding any operators to keys, the **Keymap Context** determines when the 
   shortcut is active. If you're in the wrong context, the key won't respond.

   * **3D Viewport:** Works in the 3D Viewport. This signifies operators 
      that switch modes internally (like sculpt isolation) or work across modes (like navigation).
   * **Paint Mode:** Specific to drawing and brush-specific 
      tools (Eraser swap, Stroke Strength).
   * **Edit Mode:** Only active while in Edit Mode. Use for tools that 
      require selected strokes (Join & Smooth).

   .. note::

      The modal toggle operators (``gp.auto_merge_on`` / ``gp.auto_merge_off``,
      ``gp.sculpt_mode_on`` / ``gp.sculpt_mode_off``) must be bound in
      **Grease Pencil → Stroke Paint Mode**, not 3D View (Global). If bound
      to the wrong context, the key press will be ignored while drawing.

**Fred Operators for Timeline Navigation: Why use these instead of Arrow Keys?**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   You might wonder why we have ``gp.next_keyframe`` when Blender uses the ``Right Arrow`` key natively.

   **The Difference:**
   * **Native Arrow Keys:** Jump to the next keyframe but **do not** save this jump to the Undo history. If you jump forward and realize you made a mistake, you can't "undo" the jump.
   * **The Tool's Operators:** Jump to the next keyframe **AND** push an Undo step.

   **The Workflow:**
   1. Bind ``gp.next_keyframe`` to ``Right Arrow`` (or a custom key, if you want to preserve undo silence).
   2. Jump forward through your animation.
   3. If you jump too far, press **``Ctrl+Z``**.
   4. The timeline **snaps back** to the previous keyframe instantly.

   Doing it this way adds these movements to the "Undo stack".

   .. note::

      ``gp.prev_keyframe`` and ``gp.next_marker`` / ``gp.prev_marker`` work the same way.
      See the :ref:`Unbound Operators <unbound-operators>` table above for the full list
      of navigation operators and their keymap paths.

-------------------------

.. _layerswitchermenu-setup:

The Layer Switcher Menu (Optional)
-----------------------------------

The Layer Switcher Menu (``OBJECT_MT_Fred_Custom_Layer_Menu``) is not defined in the v2.0
code but may be reinstated in a future release for onboarding and visual reference.

When available, it can be bound via:

+----------------------------+----------------------------------+------------------------+------------------------------------------+-------------------------------------+
| **Shortcut**               | **Action**                       | **Context**            | **Operator ID**                          | **Keymap Section Path**             |
+============================+==================================+========================+==========================================+=====================================+
| ``Ctrl-Tab`` (suggested)   | Fred Layer Menu (popup)          | 3D Viewport            | ``OBJECT_MT_Fred_Custom_Layer_Menu``     | 3D View → 3D View (Global)          |
+----------------------------+----------------------------------+------------------------+------------------------------------------+-------------------------------------+

`Ctrl-Tab`` will conflict with default binds, so it's up to you if you want to use it in that manner or bind it to something clear.

Opens a popup menu at your cursor with all layer options.

   * **Setup:** Bind ``wm.call_menu`` to a key (e.g., ``Ctrl-Tab``).
   * **Operator ID:** ``OBJECT_MT_Fred_Custom_Layer_Menu``

   .. image:: ../_static/images/customlayermenu.png

   :alt: Visual of keybinds for the Custom Layer Menu in the UI.
   :scale: 100
   :align: center

-------------------------------

.. _next-steps

Next Steps
----------

Once you've got your keybinds done, head to :doc:`usage` to learn the daily workflow and
practice with the provided scene files.

Back to :doc:`blender-basics` if you are new to Blender in general.

:doc:`use-cases` explains how-tos by user goal, which might be helpful.

:doc:`troubleshooting` is a collection of symptom-based help. :doc:`use-cases` has troubleshooting sorted by goal 'step' instead.