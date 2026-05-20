.. _operator-inventory:

=========================================
Operator Inventory (Release 5.0)
=========================================

This page lists operators provided by **The Violence Layer Manager**.
Each operator is mapped to its function. For the specific native Blender operations
executed by these macros, see the :ref:`blender-ref-appendix` at the bottom of this page.

.. note::

   **Limitations:** Some operators are marked as **Non-functional** or **Buggy**.
   These are documented for transparency but should not be used.

.. warning::
   All operators require a **Grease Pencil object** to be selected and active.
   If no object is selected, the operator will report a warning.

.. _layer-switching-operators:

Layer Switching (Drawing & Filling)
-----------------------------------

These operators unlock the specific layer, set it as active, switch the brush tool 
(Draw or Fill), and assign the correct material.

.. list-table:: Drawing Operators (Lines)
   :widths: 25 75
   :header-rows: 1

   * - Operator ID
     - Description
   * - ``fred.body_lines``
     - Switch to **Body** line art layer. Material: ``1 I LINE``.
   * - ``fred.head_lines``
     - Switch to **Head** line art layer. Material: ``1 I LINE``.
   * - ``fred.eyes_lines``
     - Switch to **Eyes** line art layer. Material: ``1 I LINE``.
   * - ``fred.mouth_lines``
     - Switch to **Mouth** line art layer. Material: ``1 I LINE``.
   * - ``fred.extra_lines``
     - Switch to **Extra** (Arms/Tail) line art layer. Material: ``1 I LINE``.
   * - ``fred.foreground_lines``
     - Switch to **Foreground** (Hands) line art layer. Material: ``1 I LINE``.
   * - ``fred.background_lines``
     - Switch to **Background** (Layer 7) line art layer. Material: ``1 I LINE``.
   * - ``fred.layer8_lines``
     - Switch to **Misc. 8** line art layer. Material: ``1 I LINE``.
   * - ``fred.layer9_lines``
     - Switch to **Misc. 9** line art layer. Material: ``1 I LINE``.
   * - ``fred.layer10_lines``
     - Switch to **Holdout/Mask** (Layer 10) line art layer.
       **Material:** ``B HOLDOUT`` (Changed in v5.0).

.. list-table:: Filling Operators (Colors)
   :widths: 25 75
   :header-rows: 1

   * - Operator ID
     - Description
   * - ``fred.body_fills``
     - Switch to **Body** fill layer. Opens material selection menu.
   * - ``fred.head_fills``
     - Switch to **Head** fill layer. Opens material selection menu.
   * - ``fred.eyes_fills``
     - Switch to **Eyes** fill layer. Opens material selection menu.
   * - ``fred.mouth_fills``
     - Switch to **Mouth Mask** layer. Material: ``THROAT``.
   * - ``fred.extra_fills``
     - Switch to **Extra** fill layer. Opens material selection menu.
   * - ``fred.foreground_fills``
     - Switch to **Foreground** fill layer. Opens material selection menu.
   * - ``fred.background_fills``
     - Switch to **Background** (Layer 7) fill layer. Opens material selection menu.
   * - ``fred.layer8_fills``
     - Switch to **Misc. 8** fill layer. Opens material selection menu.
   * - ``fred.layer9_fills``
     - Switch to **Misc. 9** fill layer. Opens material selection menu.
   * - ``fred.layer10_fills``
     - Switch to **Layer 10** fill layer. Opens material selection menu.

Specialized Drawing & Animation
-------------------------------

Operators for specific character parts, effects, and animation workflows.

.. _mouth-jaw-operators:

Mouth & Teeth Control
~~~~~~~~~~~~~~~~~~~~~

.. list-table:: Mouth & Teeth Control
   :widths: 25 75
   :header-rows: 1

   * - Operator ID
     - Description
   * - ``fred.mouth1``
     - **Mouth Lines:** Unlock and switch to mouth outline.
   * - ``fred.mouth2``
     - **Mouth Mask:** Unlock and switch to mouth mask (for teeth/tongue visibility).
   * - ``fred.mouth3``
     - **Upper Teeth:** Unlock and switch to upper jaw/teeth layer. Material: ``UPPERTEETH``.
   * - ``fred.mouth4``
     - **Lower Teeth:** Unlock and switch to lower jaw/teeth layer. Material: ``LOWERTEETH``.

.. _effects-operators:

Effects
~~~~~~~

.. list-table:: Effects
   :widths: 25 75
   :header-rows: 1

   * - Operator ID
     - Description
   * - ``fred.shadowfills``
     - Switch to **Shadows** layer. Brush size: 70px. Material: ``SHADOW``.
   * - ``fred.highlights1``
     - Switch to **Highlights** layer. Material: ``HIGHLIGHT1``.
   * - ``fred.highlights2``
     - Switch to **Highlights** layer. Material: ``HIGHLIGHT2``.
   * - ``fred.highlights3``
     - Switch to **Highlights** layer. Material: ``HIGHLIGHT3``.

.. _keyframe-operators:

Keyframe Operators
~~~~~~~~~~~~~~~~~~

.. list-table:: Keyframes
   :widths: 25 75
   :header-rows: 1

   * - Operator ID
     - Description
   * - ``fred.frames1``
     - Unlock **Mouth** and **Mask** layers for keyframing (Front View).
   * - ``fred.frames2``
     - Unlock **Mouth**, **Mask**, and **Lower Jaw** layers for keyframing.
   * - ``fred.addkeyframes``
     - Duplicate the current frame for all unlocked layers (Insert Keyframe).

Sculpting & Editing
-------------------

These operators isolate specific body parts for sculpting or editing. They unlock 
both the Line and Fill layers for the selected part, switch to Sculpt Mode briefly 
to prepare the brush, then return to Paint Mode.

.. _sculpt-isolation-operators:

.. list-table:: Sculpt Operators
   :widths: 25 75
   :header-rows: 1

   * - Operator ID
     - Description
   * - ``fred.sculpt1``
     - Isolate **Body** (Lines + Fills) for Sculpt/Edit.
   * - ``fred.sculpt2``
     - Isolate **Head** (Lines + Fills) for Sculpt/Edit.
   * - ``fred.sculpt3``
     - Isolate **Eyes** (Lines + Fills) for Sculpt/Edit.
   * - ``fred.sculpt4``
     - Isolate **Mouth** (Lines + Mask) for Sculpt/Edit.
   * - ``fred.sculpt5``
     - Isolate **Extra** (Lines + Fills) for Sculpt/Edit.
   * - ``fred.sculpt6``
     - Isolate **Foreground** (Lines + Fills) for Sculpt/Edit.
   * - ``fred.sculpt7``
     - Isolate **Background** (Layer 7) for Sculpt/Edit.
   * - ``fred.sculpt8``
     - Isolate **Misc. 8** for Sculpt/Edit.
   * - ``fred.sculpt9``
     - Isolate **Misc. 9** for Sculpt/Edit.
   * - ``fred.sculpt10``
     - Isolate **Misc. 10** for Sculpt/Edit.

.. _utility-operators:

Custom Tools & Utilities
------------------------

New in v5.0: These operators provide advanced functionality for retopology, 
compositing, and bulk actions.

New 5.0 Operators
~~~~~~~~~~~~~~~~~

.. list-table:: New v5.0 Operators
   :widths: 25 75
   :header-rows: 1

   * - Operator ID
     - Description
   * - ``fred.op8`` (**Jiggle**)
     - **NEW:** Apply randomized noise to unlocked strokes.
       *Dialog Options:* Strength, Size, Repeat.
       (Replaces the old static noise operator).
   * - ``fred.op15``
     - **NEW:** Unlock Mouth, Mask, Upper/Lower Teeth, **AND Head** layers.
       Useful for complex jaw/head animations.
   * - ``fred.op36``
     - **Retopo Helper:** Flattens Y-axis, smooths vertices, snaps to nearest face.
       (Designed for mesh retopology workflows).
   * - ``fred.op37``
     - **Affect Selected GP:** Disables lights on all layers of the selected GP object.
   * - ``fred.op38``
     - **Affect All GP:** Placeholder for bulk actions across all GP objects in the scene.
   * - ``fred.op39``
     - **Toggle Compositor:** Switches viewport compositor between ``DISABLED`` and ``ALWAYS``.
   * - ``fred.op40``
     - **Toggle Layer Hide:** Toggles the visibility of the currently active GP layer.

Legacy Operators
~~~~~~~~~~~~~~~~

.. list-table:: Legacy & Utility Operators
   :widths: 25 75
   :header-rows: 1

   * - Operator ID
     - Description
   * - ``fred.op1`` / ``fred.op2``
     - Set Stroke Strength to 0% or 100%.
   * - ``fred.op3``
     - Join selected strokes and smooth them.
   * - ``fred.op4`` / ``fred.op5``
     - Jump to Previous/Next Keyframe.
   * - ``fred.op6`` / ``fred.op7``
     - Jump to Previous/Next Marker.
   * - ``fred.op9`` / ``fred.op10``
     - Switch to Eraser Point or Eraser Stroke.
   * - ``fred.op11``
     - Create a new blank Grease Pencil object (Fox template).
   * - ``fred.op12``
     - Randomize selected vertices (Legacy).
   * - ``fred.op13``
     - Lock all non-character layers.
   * - ``fred.op14``
     - Unlock all mouth layers (Legacy).
   * - ``fred.op16`` / ``fred.op17``
     - Enable/Disable Auto-Merge Strokes.
   * - ``fred.op18``
     - Toggle "Fade Inactive Layers" overlay.
   * - ``fred.op19``
     - Toggle Onion Skins overlay.
   * - ``fred.op20``
     - Remove all vertex paints from all layers/frames.
   * - ``fred.op21`` / ``fred.op22``
     - Enable/Disable "Draw Behind" mode.
   * - ``fred.op23``
     - Large Pass Randomize (Legacy).
   * - ``fred.op24``
     - Smooth selected strokes.
   * - ``fred.op25``
     - **Create GP Object (Fox McCloud):** Generates the full Fox template with materials.
   * - ``fred.op26`` - ``fred.op35``
     - Various legacy material, brush, and modifier toggles.

Advanced Configuration
----------------------

.. note::
   The ``fred.applynoise`` operator (dialog box) remains available but is distinct 
   from the new ``fred.op8`` (Jiggle). ``fred.applynoise`` uses the older 
   implementation with fixed randomness ranges.

.. _warnings:

Warnings & Known Bugs
----------------------

``fred.op15``

    Marked as **Non-functional** in the code. It currently only pushes an undo message.

    - *Intended:* Unlock and clear Mouth/Head frames via hotkey (Ctrl+Alt+Shift+4).

    - *Bug:* The code fails to make invisible layers visible before unlocking them. (V1.0)

    - *Workaround:* Manually ensure layers are visible and unlocked in the Outliner.

``fred.op30``

    Marked as **Crash Risk**. The code contains a syntax error. But there's no way for the user to get to it anyway.

``fred.applynoise``

    This is a **Dialog Box** operator. It will open the dialog window rather than perform the operation. (This is fine, but a hotkey assigned to it won't technically perform an operation, is all.)

.. _blender-ref-appendix:

Technical Appendix: Native Blender Operations
----------------------------------------------

This section details the specific native Blender operations used by the operators above.
Click the **Ref Key** in the tables to jump to the relevant section here.

.. note::

   **API Links:** Links prefixed with *Blender API:* point to the **Blender API Reference**.
   If a link targets a class, navigate to the specific attribute mentioned in parentheses (e.g., see ``active``).

   **Blender Manual Links:** Links prefixed with *Blender Manual:* point to the **User Manual** for Blender's explanation of its use.

.. _ref-unlock-act:

**Unlock & Activate Layer**
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Used by: :ref:`All Layer Switching <layer-switching-operators>`, :ref:`Mouth <mouth-jaw-operators>`, :ref:`Jaw <mouth-jaw-operators>`, :ref:`Effects <effects-operators>`, :ref:`Keyframe operators <keyframe-operators>`

**Unlock Layer**

``bpy.ops.wm.context_toggle(data_path="object.data.layers['" + layer_name + "'].lock")``

    *Blender API:* :func:`Layer Unlock<blender_api:bpy.ops.wm.context_toggle>`

    *Blender Manual:* :doc:`Layers<blender_manual:grease_pencil/properties/layers>` (see ``#Layers List - Lock``)

    Applies a toggle to the lock state of a specific layer.


**Set Active Layer**
^^^^^^^^^^^^^^^^^^^^

``bpy.context.active_object.data.layers.active = bpy.context.active_object.data.layers[layer_name]``

    *Blender API:* :class:`GreasePencil<blender_api:bpy.types.GreasePencil>` (see ``layers.active``)

    *Blender Manual:* :doc:`Set Active Layer<blender_manual:grease_pencil/modes/edit/grease_pencil_menu>` (see ``#Active Layer``)

    When the code runs bpy.context.active_object.data.layers.active = ..., it is doing three specific things simultaneously:

1. 'Setting' the "Target" for drawing: In Blender, you can have 18 layers, but you can only draw on one at a time.

2. Chages the visual (UI) focus:

    Outliner: The layer name in the Outliner (the list on the right) becomes highlighted.
    Properties Panel: The "Layer" tab in the sidebar updates to show the settings (opacity, lock status, color) for that specific layer.

3. Context for Other Operations:

    Many other Blender operations (like "Delete," "Duplicate," or "Lock") operate on the enitre active layer by default if no specific selection is made.

Fred's use case: "I want to lock all layers except the one I'm working on." The tool does this by unlocking the active one and locking the rest.


**Set Brush Tool**
^^^^^^^^^^^^^^^^^^

``bpy.ops.wm.tool_set_by_id(name='builtin_brush.Draw')`` and ``name='builtin_brush.Fill'``

    *Blender API:* :func:`Set Tool by ID<blender_api:bpy.ops.wm.tool_set_by_id>` (see ``name``)

    *Blender Manual:* :doc:`Brush Settings<blender_manual:grease_pencil/modes/draw/tools/draw>` (see ``#Selecting-a-brush-and-material``)

    Switches the active brush tool to either Fill or Brush, depending on the layer selected.

**Set Brush Size**
^^^^^^^^^^^^^^^^^^

``bpy.context.tool_settings.gpencil_paint.brush.size = 13``

    *Blender API:* In 4.1 :class:`Brush<blender_api:bpy.types.Brush>` (see ``gpencil_settings.pen_size``)

    *Blender Manual:* :doc:`Brush Settings<blender_manual:grease_pencil/modes/draw/tools/draw>`

    Sets the brush radius to one specified by the layer materials.

**Set Brush Strength**
^^^^^^^^^^^^^^^^^^^^^^

``bpy.context.tool_settings.gpencil_paint.brush.gpencil_settings.pen_strength = 1``

    *Blender API:* :class:`Brush<blender_api:bpy.types.Brush>` (see ``gpencil_settings.pen_strength``)

    *Blender Manual:* :doc:`Brush Settings<blender_manual:grease_pencil/modes/draw/tools/draw>`

    Sets the stroke opacity/strength to the one specified by the layer materials.

**Set Material Active**
^^^^^^^^^^^^^^^^^^^^^^^

``bpy.ops.gpencil.material_set(slot=m.name)``

    *Blender API:* :func:`Set Material<blender_api:bpy.ops.gpencil.material_set>`

    *Blender Manual:* :doc:`Materials<blender_manual:grease_pencil/materials/properties>`

    Assigns the layer's material to the active stroke/layer. (I think?)

.. _ref-sculpt-push:

**Sculpt Mode & Push Brush**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Used by: :ref:`All Sculpt Isolation operators <sculpt-isolation-operators>`

**Enter Sculpt Mode**
^^^^^^^^^^^^^^^^^^^^^

``bpy.ops.object.mode_set(mode='SCULPT_GPENCIL')``

    *Blender API:* :func:`Mode Set<blender_api:bpy.ops.object.mode_set>`

    *Blender Manual:* :doc:`Sculpt Mode<blender_manual:grease_pencil/modes/sculpting/introduction>`

    Switches to Sculpt Mode.

**Set Push Brush**
^^^^^^^^^^^^^^^^^^

``bpy.ops.wm.tool_set_by_id(name='builtin_brush.Push')``

    *Blender API:* :func:`Set Tool by ID<blender_api:bpy.ops.wm.tool_set_by_id>`

    *Blender Manual:* :doc:`Sculpt Mode<blender_manual:grease_pencil/modes/sculpting/tool_settings/brush>`

    Sets the active brush to "Push" (used for "butterknifing").

**Return to Draw Mode**
^^^^^^^^^^^^^^^^^^^^^^^

``bpy.ops.object.mode_set(mode='PAINT_GPENCIL')``

    *Blender API:* :func:`Mode Set<blender_api:bpy.ops.object.mode_set>`

    *Blender Manual:* :doc:`Draw Mode<blender_manual:grease_pencil/modes/draw/introduction>`

    Returns to Draw Mode.

.. _ref-noise:

**Select Random & Apply Noise**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Used by: :ref:`fred.applynoise <effects-operators>`, :ref:`fred.op8 <utility-operators>`, :ref:`fred.op12 <utility-operators>`, :ref:`fred.op23 <utility-operators>`

**Select All**
^^^^^^^^^^^^^^

``bpy.ops.gpencil.select_all(action='SELECT')``

    *Blender API:* :func:`Select All<blender_api:bpy.ops.gpencil.select_all>`

    *Blender Manual:* :doc:`Selecting Strokes<blender_manual:grease_pencil/selecting>`

    Selects all vertices on unlocked layers.

**Deselect Random**
^^^^^^^^^^^^^^^^^^^

``bpy.ops.gpencil.select_random(ratio=0.995, action='DESELECT', ...)``

    *Blender API:* :func:`Select Random<blender_api:bpy.ops.gpencil.select_random>`

    *Blender Manual:* :doc:`Random Selection<blender_manual:grease_pencil/selecting>`

    Selects everything, then randomly deselects 99.5%, leaving 0.5% selected.

**Apply Noise (Translate)**
^^^^^^^^^^^^^^^^^^^^^^^^^^^

``bpy.ops.transform.translate(value=(mynoisex, mynoisey, 0), ...)``

    *Blender API:* :func:`Translate<blender_api:bpy.ops.transform.translate>`

    *Blender Manual:* :doc:`Array Modifier<blender_manual:grease_pencil/modifiers/generate/array>`

    Moves selected vertices randomly.

**Apply Thickness (via Shrinkfatten)**
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

``bpy.ops.transform.transform(mode='GPENCIL_SHRINKFATTEN', ...)``

    *Blender API:* :func:`Transform<blender_api:bpy.ops.transform.transform>`

    *Blender Manual:* :doc:`Build Modifier<blender_manual:grease_pencil/modifiers/generate/build>`

    Changes stroke thickness.

.. _ref-dup-frame:

**Duplicate Frame**
~~~~~~~~~~~~~~~~~~~
Used by: :ref:`fred.addkeyframes <keyframe-operators>`

**Duplicate Frame**
^^^^^^^^^^^^^^^^^^^

``bpy.ops.gpencil.frame_duplicate(mode='ALL')``

    *Blender API:* :func:`Duplicate Frame<blender_api:bpy.ops.gpencil.frame_duplicate>`

    *Blender Manual:* :doc:`Duplicating Frames<blender_manual:grease_pencil/animation/tools>` (see ``#Duplicate Active Keyframe (All Layers)``)

    Duplicates the current frame on all unlocked layers.

.. _ref-strength:

**Set Brush Strength**
~~~~~~~~~~~~~~~~~~~~~~
Used by: :ref:`fred.op1 <utility-operators>`, :ref:`fred.op2 <utility-operators>`

**Set Brush Strength**
^^^^^^^^^^^^^^^^^^^^^^

``bpy.context.tool_settings.gpencil_paint.brush.gpencil_settings.pen_strength = 0`` (or ``1``)

    *Blender API:* Blender 4.1 :class:`Brush<blender_api:bpy.types.Brush>` (see ``gpencil_settings.pen_strength``)

    *Blender Manual:* :doc:`Brush Strength<blender_manual:sculpt_paint/brush/brush_settings>` (see #Strength)

    Sets the stroke opacity/strength to 0% or 100%.

.. _ref-join-smooth:

**Join & Smooth Strokes**
~~~~~~~~~~~~~~~~~~~~~~~~~
Used by: :ref:`fred.op3 <utility-operators>`, :ref:`fred.op24 <utility-operators>`

**Join Strokes**
^^^^^^^^^^^^^^^^

``bpy.ops.gpencil.stroke_join(type='JOIN')``

    *Blender API:* :func:`Join Strokes<blender_api:bpy.ops.gpencil.stroke_join>`

    *Blender Manual:* :doc:`Joining Strokes<blender_manual:grease_pencil/modes/edit/stroke_menu>` (see #join)

    Joins two selected strokes into one.

**Smooth Strokes**
^^^^^^^^^^^^^^^^^^

``bpy.ops.gpencil.stroke_smooth(repeat=10, factor=0.5, ...)``

    *Blender Manual:* :doc:`Smoothing Strokes<blender_manual:grease_pencil/modes/edit/point_menu>` (see #smooth)

    Smooths the position and thickness of selected strokes.

    *Blender API:* :func:`Smooth Strokes<blender_api:bpy.ops.gpencil.stroke_smooth>`

.. _ref-keyjump:

**Jump Keyframe/Marker**
~~~~~~~~~~~~~~~~~~~~~~~~

Used by: :ref:`fred.op4 <utility-operators>`, :ref:`fred.op5 <utility-operators>`, :ref:`fred.op6 <utility-operators>`, :ref:`fred.op7 <utility-operators>`

**Jump Keyframe**
^^^^^^^^^^^^^^^^^

``bpy.ops.screen.keyframe_jump(next=False)`` (or ``True``)

    *Blender Manual:* :doc:`Markers<blender_manual:editors/dope_sheet/introduction>` (see #selecting keyframes)

    Jumps the playhead to the previous or next keyframe.

    *Blender API:* :func:`Keyframe Jump<blender_api:bpy.ops.screen.keyframe_jump>`

**Jump Marker**
^^^^^^^^^^^^^^^

``bpy.ops.screen.marker_jump(next=False)`` (or ``True``)

    *Blender Manual:* :doc:`Markers<blender_manual:animation/markers>`

    Jumps the playhead to the previous or next marker.

    *Blender API:* :func:`Marker Jump<blender_api:bpy.ops.screen.marker_jump>` (see #Jump to next/previous marker)

.. _ref-eraser:

**Set Eraser Brush**
~~~~~~~~~~~~~~~~~~~~

Used by: :ref:`fred.op9 <utility-operators>`, :ref:`fred.op10 <utility-operators>`

``bpy.context.scene.tool_settings.gpencil_paint.brush = bpy.data.brushes["Eraser Point"]``

    *Blender Manual:* :doc:`Eraser Brushes<blender_manual:grease_pencil/modes/draw/tools/erase>` (see #Point Erasing, #Stroke Erasing)

    Sets the active brush to "Eraser Point" or "Eraser Stroke".

    *Blender API:* :class:`Brush<blender_api:bpy.types.Brush>`

.. _ref-create-gp:

**Create GP Object**
~~~~~~~~~~~~~~~~~~~~

Used by: :ref:`fred.op11 <utility-operators>`, :ref:`fred.op25 <utility-operators>`

**Create Data**
^^^^^^^^^^^^^^^

``bpy.data.grease_pencils.new("ANIM_FOX")``

    *Blender Manual:* :doc:`Creating Grease Pencil Objects<blender_manual:render/materials/assignment>` (see #Data Block)

    Creates a new Grease Pencil data-block.

    *Blender API:* :class:`GreasePencil<blender_api:bpy.types.GreasePencil>`

**Create Object**
^^^^^^^^^^^^^^^^^

``bpy.data.objects.new("GP_FOX", gp_data)``

    *Blender Manual:* :doc:`Creating Grease Pencil Objects<blender_manual:grease_pencil/primitives>` (see #Sroke)

    Creates a new object using the GP data-block.

    *Blender API:* :class:`Object<blender_api:bpy.types.Object>`

**Create Material**
^^^^^^^^^^^^^^^^^^^

``bpy.data.materials.new("1 I LINE")``

    *Blender Manual:* :doc:`Materials<blender_manual:grease_pencil/materials/introduction>` (see #Setting Up Materials)

    Creates a new material with Grease Pencil properties.

    *Blender API:* :class:`Material<blender_api:bpy.types.Material>`

.. _ref-lock-all:

**Lock All Layers**
~~~~~~~~~~~~~~~~~~~

Used by: :ref:`fred.op13 <utility-operators>`

**Lock All**
^^^^^^^^^^^^

``bpy.ops.gpencil.lock_all()``

    *Blender Manual:* :doc:`Layers<blender_manual:grease_pencil/properties/layers>` (see ``#Layer Specials - Lock All``)

    Locks all Grease Pencil layers at once.

    *Blender API:* :func:`Lock All<blender_api:bpy.ops.gpencil.lock_all>`

.. _ref-automerge:

**Toggle Automerge**
~~~~~~~~~~~~~~~~~~~~

Used by: :ref:`fred.op16 <utility-operators>`, :ref:`fred.op17 <utility-operators>`

**Set Automerge**
^^^^^^^^^^^^^^^^^

``bpy.ops.wm.context_set_value(data_path='scene.tool_settings.use_gpencil_automerge_strokes', value='True')``

    *Blender Manual:* :doc:`Automerge<blender_manual:grease_pencil/modes/draw/introduction>` (see #Drawing Options, Automerge)

    Enables or disables automerge toggle for stroke endpoints.

    *Blender API:* :class:`ToolSettings<blender_api:bpy.types.ToolSettings>`

.. _ref-overlay:

**Toggle Overlay**
~~~~~~~~~~~~~~~~~~

Used by: :ref:`fred.op18 <utility-operators>`, :ref:`fred.op19 <utility-operators>`

**Toggle Fade Layers**
^^^^^^^^^^^^^^^^^^^^^^

``bpy.ops.wm.context_toggle(data_path="space_data.overlay.use_gpencil_fade_layers")``

    *Blender Manual:* :doc:`Fading Layers<blender_manual:grease_pencil/properties/layers>` (See ``Visibililty``)

    Fades layers that are not currently active.

    *Blender API:* :class:`SpaceView3D<blender_api:bpy.types.SpaceView3D>`

**Toggle Onion Skins**
^^^^^^^^^^^^^^^^^^^^^^

``bpy.ops.wm.context_toggle(data_path="space_data.overlay.use_gpencil_onion_skin")``

    *Blender Manual:* :doc:`Onion Skinning<blender_manual:grease_pencil/properties/onion_skinning>` (See ``#Display - Fade``)

    Toggles onion skin visibility for adjacent frames.

    *Blender API:* :class:`SpaceView3D<blender_api:bpy.types.SpaceView3D>`

.. _ref-clear-vc:

**Clear Vertex Colors**
~~~~~~~~~~~~~~~~~~~~~~~

Used by: :ref:`fred.op20 <utility-operators>`

**Iterate GP Objects**
^^^^^^^^^^^^^^^^^^^^^^

``for gp in bpy.data.grease_pencils:``

    *Blender Manual:* :doc:`Selecting First/Last<blender_manual:grease_pencil/selecting>`

    Iterates through all Grease Pencil data-blocks in the file.

    *Blender API:* :class:`GreasePencil<blender_api:bpy.types.GreasePencil>`

**Clear Vertex Color**
^^^^^^^^^^^^^^^^^^^^^^

``point.vertex_color = [0.0, 0.0, 0.0, 0.0]``

    *Blender Manual:* :doc:`Vertex Colors<blender_manual:grease_pencil/modes/vertex_paint/editing>` (see #Reset Vertex Color)

    Resets vertex color data to transparent black on all strokes and points.

    *Blender API:* :class:`GPencilStrokePoint<blender_api:bpy.types.GPencilStrokePoint>`

.. _ref-draw-back:

**Toggle Draw on Back**
~~~~~~~~~~~~~~~~~~~~~~~

Used by: :ref:`fred.op21 <utility-operators>`, :ref:`fred.op22 <utility-operators>`

**Set Draw on Back**
^^^^^^^^^^^^^^^^^^^^

``bpy.ops.wm.context_set_value(data_path='scene.tool_settings.use_gpencil_draw_onback', value='True')``

    *Blender Manual:* :doc:`Draw on Back<blender_manual:grease_pencil/modes/draw/introduction>` (see #Drawing Options, Draw-on-back)

    Enables or disables drawing strokes behind existing geometry.

    *Blender API:* :class:`ToolSettings<blender_api:bpy.types.ToolSettings>`

.. _ref-smooth:

**Smooth Stroke**
~~~~~~~~~~~~~~~~~

Used by: :ref:`fred.op24 <utility-operators>`

**Smooth**
^^^^^^^^^^

``bpy.ops.gpencil.stroke_smooth(repeat=2, factor=0.5, ...)``

    *Blender Manual:* :doc:`Smoothing Strokes<blender_manual:grease_pencil/modes/edit/point_menu>` (see #Smooth)

    Smooths the position, thickness, and strength of selected strokes.

    *Blender API:* :func:`Smooth Strokes<blender_api:bpy.ops.gpencil.stroke_smooth>`

.. _ref-mat-set:

**Set Material**
~~~~~~~~~~~~~~~~

Used by: :ref:`fred.op26 <utility-operators>`

**Set Material**
^^^^^^^^^^^^^^^^

``bpy.ops.gpencil.material_set(mat)``

    *Blender Manual:* :doc:`Materials<blender_manual:grease_pencil/materials/introduction>`

    Assigns the active material to selected strokes.

    *Blender API:* :func:`Set Material<blender_api:bpy.ops.gpencil.material_set>`

.. _ref-view-frame:

**View Frame**
~~~~~~~~~~~~~~

Used by: :ref:`fred.op27 <utility-operators>`

``bpy.ops.action.view_selected()``

    *Blender Manual:* :doc:`View Frame<blender_manual:editors/dope_sheet/introduction>` (see #Frame Selected, Numpad `.`)
    Zooms the Dope Sheet to show selected keyframes.

    *Blender API:* :func:`View Selected<blender_api:bpy.ops.action.view_selected>`

**View Frame**
^^^^^^^^^^^^^^

``bpy.ops.action.view_frame()``

    *Blender Manual:* :doc:`View Frame<blender_manual:editors/dope_sheet/introduction>` (see #Go to Current Frame, Numpad `0`)

    Centers the Dope Sheet on the current frame.

    *Blender API:* :func:`View Frame<blender_api:bpy.ops.action.view_frame>`

.. _ref-brush-set:

**Set Brush**
~~~~~~~~~~~~~

Used by: :ref:`fred.op28 <utility-operators>`, :ref:`fred.op29 <utility-operators>`

**Set Brush**
^^^^^^^^^^^^^

``bpy.context.scene.tool_settings.gpencil_paint.brush = bpy.data.brushes["01 PEN"]``

    *Blender Manual:* :doc:`Data Block Menu<blender_manual:grease_pencil/modes/draw/tool_settings/brushes>`

    Sets the active brush to a named brush preset.

    *Blender API:* :class:`Brush<blender_api:bpy.types.Brush>`

.. _ref-mat-vis:

**Toggle Material Visibility**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Used by: :ref:`fred.op31 <utility-operators>`

**Toggle Visibility**
^^^^^^^^^^^^^^^^^^^^^

``obj.hide = True`` (or ``False``)

    *Blender Manual:* :doc:`Materials<blender_manual:grease_pencil/materials/introduction>` (see Common Settings, Viewport/Render Visibility)

    Toggles the visibility of the active Grease Pencil material.

    *Blender API:* :class:`MaterialGPencilStyle<blender_api:bpy.types.MaterialGPencilStyle>`

.. _ref-mat-reveal:

**Reveal Material**
~~~~~~~~~~~~~~~~~~~

Used by: :ref:`fred.op32 <utility-operators>`

**Reveal**
^^^^^^^^^^

``bpy.ops.gpencil.material_reveal()``

    *Blender Manual:* :doc:`Materials<blender_manual:grease_pencil/materials/introduction>`

    Makes all Grease Pencil materials visible.

    *Blender API:* :func:`Reveal Material<blender_api:bpy.ops.gpencil.material_reveal>`

.. _ref-hide-fills:

**Hide All Fills**
~~~~~~~~~~~~~~~~~~

Used by: :ref:`fred.op33 <utility-operators>`

**Toggle Modifier**
^^^^^^^^^^^^^^^^^^^

``bpy.ops.wm.context_toggle(data_path="object.grease_pencil_modifiers['HIDE ALL FILLS'].show_viewport")``

    *Blender Manual:* :doc:`Viewport Visibility<blender_manual:grease_pencil/properties/layers>`

    Toggles the viewport visibility of the "HIDE ALL FILLS" modifier.

    *Blender API:* :class:`Modifier<blender_api:bpy.types.Modifier>` (see ``show_viewport``)

.. _ref-fill-mode:

**Set Fill Draw Mode**
~~~~~~~~~~~~~~~~~~~~~~

Used by: :ref:`fred.op34 <utility-operators>`, :ref:`fred.op35 <utility-operators>`

**Set Mode**
^^^^^^^^^^^^

``bpy.data.brushes["Fill Area"].gpencil_settings.fill_draw_mode = 'CONTROL'`` (or ``'BOTH'``)

    *Blender Manual:* :doc:`Fill Draw Mode<blender_manual:grease_pencil/modes/draw/tool_settings/brushes>` (See #Fill Brushes)

    Sets the fill brush to react to control lines only, or both control lines and strokes.

    *Blender API:* :class:`Brush<blender_api:bpy.types.Brush>` (see ``gpencil_settings.fill_draw_mode``)


.. _ref-native-ops-v5:

**Native Blender Operations (v5.0 Additions)**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*Used by: OP36, OP37, OP38, OP39, OP40, and the rewritten OP8.*

**Toggle Layer Visibility (Hide)**
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

``layer.hide = not layer.hide``

    Toggles whether a layer is visible in the viewport.

    *Used by:* ``fred.op40``

    *Blender API:* :py:class:`bpy.types.GPencilLayer.hide`

**Set Layer Lighting**
^^^^^^^^^^^^^^^^^^^^^^

``layer.use_lights = False``

    Disables scene lighting on a Grease Pencil layer, causing it 
    to render with flat/unlit colors regardless of scene lights.

    *Used by:* ``fred.op37``

    *Blender API:* :py:class:`bpy.types.GPencilLayer.use_lights`

**Iterate All Objects by Type**
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

``for obj in bpy.data.objects:if obj.type == 'GPENCIL':``

    Loops through every object in the blend file and filters by type.
    ``obj.type`` returns a string enum such as ``'GPENCIL'``, ``'MESH'``, etc.

    *Used by:* ``fred.op38``

    *Blender API:* :py:class:`bpy.types.BlendData.objects`, :py:class:`bpy.types.Object.type`

**Iterate Screen Areas and Spaces**
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

``for area in context.window.screen.areas:
    if area.type == 'VIEW_3D':
        for space in area.spaces:
            if space.type == 'VIEW_3D':``

    Walks through all editor areas in the current window, then 
    accesses their space data. Used to modify viewport settings 
    that aren't exposed through a simpler API path.

    *Used by:* ``fred.op39``

    *Blender API:* :py:class:`bpy.types.Screen.areas`, :py:class:`bpy.types.Area.type`, :py:class:`bpy.types.SpaceView3D`

**Toggle Viewport Compositor**
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

``space.shading.use_compositor = 'DISABLED'  # or 'ALWAYS'``

    Switches the viewport compositor mode. Valid values are 
    ``'DISABLED'``, ``'CAMERA'``, and ``'ALWAYS'``.

    *Used by:* ``fred.op39``

    *Blender API:* :py:class:`bpy.types.View3DShading.use_compositor`

**Resize (Scale) Transform with Axis Constraint**
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

``bpy.ops.transform.resize(
    value=(1, 0, 1),
    orient_type='GLOBAL',
    constraint_axis=(False, True, False)
    )``

    Scales the selection. Setting a component of ``value`` to ``0`` 
    flattens that axis. ``constraint_axis`` limits the operation to 
    specific axes.

    *Used by:* ``fred.op36``

    *Blender Manual:* :doc:`Resize <blender_manual:api/bpy.ops.transform.resize>`

**Translate with Snap to Nearest Face**
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

``bpy.ops.transform.translate(
    value=(0, 0, 0),
    snap=True,
    snap_elements={'FACE_NEAREST'},
    snap_target='CLOSEST')``

    Moves the selection. With ``snap=True`` and 
    ``snap_elements={'FACE_NEAREST'}``, vertices are projected onto 
    the nearest surface of the target mesh. A zero-value translate 
    with snapping effectively "conforms" geometry to the surface.

    *Used by:* ``fred.op36``

    *Blender Manual:* :doc:`Translate <blender_manual:api/bpy.ops.transform.translate>`

**Smooth Mesh Vertices**
^^^^^^^^^^^^^^^^^^^^^^^^

``bpy.ops.mesh.vertices_smooth(factor=0.5, repeat=3)``

    Averages vertex positions with their neighbors. ``factor`` 
    controls the strength (0.0–1.0), ``repeat`` controls iterations.

    .. warning::
       This operator only works in **Mesh Edit Mode**. It will fail 
       on Grease Pencil objects.

    *Used by:* ``fred.op36``

    *Blender Manual:* :doc:`Smooth Vertices <blender_manual:api/bpy.ops.mesh.vertices_smooth>`

**Integer Property for Dialog Input**
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

``arg1: bpy.props.IntProperty(
  name="Strength",
  default=1,
  min=1,
  max=1000)``

    Defines an integer property on an operator class. When used 
    with :meth:`invoke_props_dialog`, the property appears as a 
    slider/input field in a popup dialog before execution.

    *Used by:* ``fred.op8`` (Jiggle)

    *Blender API:* :py:class:`bpy.props.IntProperty`

**Invoke Properties Dialog**
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

``def invoke(self, context, event):return context.window_manager.invoke_props_dialog(self)``

    Opens a popup dialog showing the operator's properties before 
    running ``execute()``. The user can adjust values, then click 
    OK to proceed. Must be defined alongside ``execute()``.

    *Used by:* ``fred.op8`` (Jiggle), ``fred.applynoise``

    *Blender API:* :py:meth:`bpy.types.WindowManager.invoke_props_dialog`