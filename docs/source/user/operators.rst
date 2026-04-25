.. _operator-inventory:

=========================================
Operator Inventory (v1.0)
=========================================

This page lists every custom operator provided by **The Violence Layer Manager**.
Each operator is mapped to its function. For the specific native Blender operations
executed by these macros, see the :ref:`blender-ref-appendix` at the bottom of this page.

.. note::

   **v1.0 Limitations:** Some operators are marked as **Non-functional** or **Buggy**.
   These are documented for transparency but should not be used until fixed in v2.0.

.. _layer-switching-operators:

Layer Switching Operators
-------------------------

These operators act as "macros" that perform a sequence of native actions:
switching to Draw Mode, locking/unlocking layers, setting the brush tool,
and assigning the correct material.

**Stroke (Line) Operators**
~~~~~~~~~~~~~~~~~~~~~~~~~~~

These switch to the "Lines" layer for a specific body part and set the appropriate brush.

.. list-table::
   :widths: 25 25 25 25
   :header-rows: 1

   * - Operator ID
     - UI Label
     - Primary Action
     - Ref Key
   * - ``fred.body_lines``
     - STROKE: Body
     - Switch to Body Lines, Set Ink Pen
     - :ref:`ref-unlock-act`
   * - ``fred.head_lines``
     - STROKE: Head
     - Switch to Head Lines, Set Ink Pen
     - :ref:`ref-unlock-act`
   * - ``fred.eyes_lines``
     - STROKE: Eyes
     - Switch to Eyes Lines, Set Ink Pen
     - :ref:`ref-unlock-act`
   * - ``fred.mouth_lines``
     - STROKE: Mouth
     - Switch to Mouth Lines, Set Ink Pen
     - :ref:`ref-unlock-act`
   * - ``fred.extra_lines``
     - STROKE: Extra
     - Switch to Extra Lines, Set Ink Pen
     - :ref:`ref-unlock-act`
   * - ``fred.foreground_lines``
     - STROKE: FOREGROUND
     - Switch to Foreground Lines, Set Ink Pen
     - :ref:`ref-unlock-act`
   * - ``fred.background_lines``
     - STROKE: BACKGROUND
     - Switch to Background Lines, Set Ink Pen
     - :ref:`ref-unlock-act`
   * - ``fred.layer8_lines``
     - STROKE: LAYER 8
     - Switch to Layer 8 Lines, Set Ink Pen
     - :ref:`ref-unlock-act`
   * - ``fred.layer9_lines``
     - STROKE: LAYER 9
     - Switch to Layer 9 Lines, Set Ink Pen
     - :ref:`ref-unlock-act`
   * - ``fred.layer10_lines``
     - STROKE: LAYER 10
     - Switch to Layer 10 Lines, Set Ink Pen
     - :ref:`ref-unlock-act`

**Fill Operators**
~~~~~~~~~~~~~~~~~~

These switch to the "Fills" layer and set the appropriate brush.

.. list-table::
   :widths: 25 25 25 25
   :header-rows: 1

   * - Operator ID
     - UI Label
     - Primary Action
     - Ref Key
   * - ``fred.body_fills``
     - FILL: Body
     - Switch to Body Fills, Set Fill Brush
     - :ref:`ref-unlock-act`
   * - ``fred.head_fills``
     - FILL: Head
     - Switch to Head Fills, Set Fill Brush
     - :ref:`ref-unlock-act`
   * - ``fred.eyes_fills``
     - FILL: Eyes
     - Switch to Eyes Fills, Set Fill Brush
     - :ref:`ref-unlock-act`
   * - ``fred.mouth_fills``
     - FILL: Mouth (Mask)
     - Switch to Mouth Mask, Set Fill Brush
     - :ref:`ref-unlock-act`
   * - ``fred.extra_fills``
     - FILL: Extra
     - Switch to Extra Fills, Set Fill Brush
     - :ref:`ref-unlock-act`
   * - ``fred.foreground_fills``
     - FILL: FOREGROUND
     - Switch to Foreground Fills, Set Fill Brush
     - :ref:`ref-unlock-act`
   * - ``fred.background_fills``
     - FILL: BACKGROUND
     - Switch to Background Fills, Set Fill Brush
     - :ref:`ref-unlock-act`
   * - ``fred.layer8_fills``
     - FILL: LAYER 8
     - Switch to Layer 8 Fills, Set Fill Brush
     - :ref:`ref-unlock-act`
   * - ``fred.layer9_fills``
     - FILL: LAYER 9
     - Switch to Layer 9 Fills, Set Fill Brush
     - :ref:`ref-unlock-act`
   * - ``fred.layer10_fills``
     - FILL: LAYER 10
     - Switch to Layer 10 Fills, Set Fill Brush
     - :ref:`ref-unlock-act`

.. _mouth-jaw-operators:

Mouth & Jaw Operators
---------------------

Specialized operators for muzzle/mouth layers.

.. list-table::
   :widths: 25 25 25 25
   :header-rows: 1

   * - Operator ID
     - UI Label
     - Primary Action
     - Ref Key
   * - ``fred.mouth1``
     - MOUTH: Lines
     - Unlock Mouth Lines, Set Ink Pen
     - :ref:`ref-unlock-act`
   * - ``fred.mouth2``
     - MOUTH: Mask
     - Unlock Mouth Mask, Set Fill Brush
     - :ref:`ref-unlock-act`
   * - ``fred.mouth3``
     - MOUTH: Upper Jaw/Teeth
     - Unlock Upper Teeth, Set Ink Pen
     - :ref:`ref-unlock-act`
   * - ``fred.mouth4``
     - MOUTH: Lower Jaw/Teeth
     - Unlock Lower Teeth, Set Ink Pen
     - :ref:`ref-unlock-act`

.. _sculpt-isolation-operators:

Sculpt & Isolation Operators
----------------------------

These operators isolate specific body parts for "butterknifing" (nudging lines).
Briefly enters **Sculpt Mode** to set the **Push Brush**, then return to **Draw Mode**.
Unlocks appropriate layers.

.. list-table::
   :widths: 25 25 25 25
   :header-rows: 1

   * - Operator ID
     - UI Label
     - Primary Action
     - Ref Key
   * - ``fred.sculpt1``
     - SCULPT: Body
     - Unlock Body (Lines+Fills), Set Push Brush
     - :ref:`ref-sculpt-push`
   * - ``fred.sculpt2``
     - SCULPT: Head
     - Unlock Head (Lines+Fills), Set Push Brush
     - :ref:`ref-sculpt-push`
   * - ``fred.sculpt3``
     - SCULPT: Eyes
     - Unlock Eyes (Lines+Fills), Set Push Brush
     - :ref:`ref-sculpt-push`
   * - ``fred.sculpt4``
     - SCULPT: Mouth
     - Unlock Mouth (Lines+Mask), Set Push Brush
     - :ref:`ref-sculpt-push`
   * - ``fred.sculpt5``
     - SCULPT: Extra
     - Unlock Extra (Lines+Fills), Set Push Brush
     - :ref:`ref-sculpt-push`
   * - ``fred.sculpt6``
     - SCULPT: FOREGROUND
     - Unlock Foreground, Set Push Brush
     - :ref:`ref-sculpt-push`
   * - ``fred.sculpt7``
     - SCULPT: BACKGROUND
     - Unlock Background, Set Push Brush
     - :ref:`ref-sculpt-push`
   * - ``fred.sculpt8``
     - SCULPT: LAYER 8
     - Unlock Layer 8, Set Push Brush
     - :ref:`ref-sculpt-push`
   * - ``fred.sculpt9``
     - SCULPT: LAYER 9
     - Unlock Layer 9, Set Push Brush
     - :ref:`ref-sculpt-push`
   * - ``fred.sculpt10``
     - SCULPT: LAYER 10
     - Unlock Layer 10, Set Push Brush
     - :ref:`ref-sculpt-push`

.. _effects-operators:

Effects & FX Operators
----------------------

Specialized tools for shadows, highlights, and applying noise.

.. list-table::
   :widths: 25 25 25 25
   :header-rows: 1

   * - Operator ID
     - UI Label
     - Primary Action
     - Ref Key
   * - ``fred.shadowfills``
     - FX: Shading
     - Unlock Shadow Layer, Set Large Brush
     - :ref:`ref-unlock-act`
   * - ``fred.highlights1``
     - FX: Highlights 1
     - Unlock Highlights, Set Material
     - :ref:`ref-unlock-act`
   * - ``fred.highlights2``
     - FX: Highlights 2
     - Unlock Highlights, Set Material
     - :ref:`ref-unlock-act`
   * - ``fred.highlights3``
     - FX: Highlights 3
     - Unlock Highlights, Set Material
     - :ref:`ref-unlock-act`
   * - ``fred.applynoise``
     - FRED: Apply Noise
     - **Dialog Box**. Selects random vertices, applies noise transform.
     - :ref:`ref-noise`

.. _keyframe-operators:

Keyframe & Frame Management
---------------------------

Operators to prepare layers for animation or duplicate frames.

.. list-table::
   :widths: 25 25 25 25
   :header-rows: 1

   * - Operator ID
     - UI Label
     - Primary Action
     - Ref Key
   * - ``fred.frames1``
     - FRAMES: Mouth & Mask
     - Unlock Mouth & Mask layers
     - :ref:`ref-unlock-act`
   * - ``fred.frames2``
     - FRAMES: Mouth, Mask, Lower Jaw
     - Unlock Mouth, Mask, Lower Jaw
     - :ref:`ref-unlock-act`
   * - ``fred.addkeyframes``
     - KEYFRAMES: Add keyframes
     - Duplicate current frame on all unlocked layers
     - :ref:`ref-dup-frame`

.. _utility-operators:

Utility & Custom Operators
--------------------------

Tools for brush settings, randomization, and system toggles.

.. list-table::
   :widths: 25 25 25 25
   :header-rows: 1

   * - Operator ID
     - UI Label
     - Primary Action
     - Ref Key
   * - ``fred.op1``
     - STROKE STRENGTH: 0%
     - Set brush strength to 0
     - :ref:`ref-strength`
   * - ``fred.op2``
     - STROKE STRENGTH: 100%
     - Set brush strength to 1
     - :ref:`ref-strength`
   * - ``fred.op3``
     - Join and Smooth Strokes
     - Join 2 selected strokes, smooth them
     - :ref:`ref-join-smooth`
   * - ``fred.op4``
     - Previous Keyframe
     - Jump to previous keyframe
     - :ref:`ref-keyjump`
   * - ``fred.op5``
     - Next Keyframe
     - Jump to next keyframe
     - :ref:`ref-keyjump`
   * - ``fred.op6``
     - Previous Marker
     - Jump to previous marker
     - :ref:`ref-keyjump`
   * - ``fred.op7``
     - Next Marker
     - Jump to next marker
     - :ref:`ref-keyjump`
   * - ``fred.op8``
     - Randomize Line Art (Small)
     - Select random vertices, apply noise
     - :ref:`ref-noise`
   * - ``fred.op9``
     - Eraser Point
     - Set brush to "Eraser Point"
     - :ref:`ref-eraser`
   * - ``fred.op10``
     - Eraser Stroke
     - Set brush to "Eraser Stroke"
     - :ref:`ref-eraser`
   * - ``fred.op11``
     - Create GP (Fox)
     - Create new GP object with Fox materials
     - :ref:`ref-create-gp`
   * - ``fred.op12``
     - Randomize Selected Vertices
     - Select random vertices, apply noise
     - :ref:`ref-noise`
   * - ``fred.op13``
     - Lock Non-Character Layers
     - Lock all, then unlock character layers
     - :ref:`ref-lock-all`
   * - ``fred.op14``
     - ALL MOUTH LAYERS
     - Unlock all mouth-related layers
     - :ref:`ref-unlock-act`
   * - ``fred.op15``
     - **NON-FUNCTIONAL**
     - **Bug:** Code incomplete. Does nothing.
     - N/A
   * - ``fred.op16``
     - Enable Automerge
     - Enable automerge strokes
     - :ref:`ref-automerge`
   * - ``fred.op17``
     - Disable Automerge
     - Disable automerge strokes
     - :ref:`ref-automerge`
   * - ``fred.op18``
     - Toggle Fade Inactive Layers
     - Toggle fade layers overlay
     - :ref:`ref-overlay`
   * - ``fred.op19``
     - Toggle Onion Skins
     - Toggle onion skin overlay
     - :ref:`ref-overlay`
   * - ``fred.op20``
     - Remove All Vertex Paints
     - Clear vertex colors on all GP objects
     - :ref:`ref-clear-vc`
   * - ``fred.op21``
     - Enable Draw on Back
     - Enable draw on back
     - :ref:`ref-draw-back`
   * - ``fred.op22``
     - Disable Draw on Back
     - Disable draw on back
     - :ref:`ref-draw-back`
   * - ``fred.op23``
     - Randomize Line Art (Large)
     - Select random vertices, apply large noise
     - :ref:`ref-noise`
   * - ``fred.op24``
     - Smooth Stroke
     - Smooth selected stroke
     - :ref:`ref-smooth`
   * - ``fred.op25``
     - Create GP (Fox McCloud)
     - Create full Fox rig
     - :ref:`ref-create-gp`
   * - ``fred.op26``
     - Set Active Material
     - Set active material
     - :ref:`ref-mat-set`
   * - ``fred.op27``
     - View Selected Frame
     - View selected frame
     - :ref:`ref-view-frame`
   * - ``fred.op28``
     - Set Brush "01 PEN"
     - Set brush to "01 PEN"
     - :ref:`ref-brush-set`
   * - ``fred.op29``
     - Set Brush "01 PEN STRENGTH P"
     - Set brush to "01 PEN STRENGTH P"
     - :ref:`ref-brush-set`
   * - ``fred.op30``
     - **CRASH RISK**
     - **Bug:** Syntax error. Do not use.
     - N/A
   * - ``fred.op31``
     - Toggle GP Material Visible
     - Toggle material visibility
     - :ref:`ref-mat-vis`
   * - ``fred.op32``
     - Reveal Material
     - Reveal material
     - :ref:`ref-mat-reveal`
   * - ``fred.op33``
     - Hide All Fills
     - Hide all fill layers
     - :ref:`ref-hide-fills`
   * - ``fred.op34``
     - Set Fill Draw Mode: Control
     - Set fill draw mode to Control
     - :ref:`ref-fill-mode`
   * - ``fred.op35``
     - Set Fill Draw Mode: Both
     - Set fill draw mode to Both
     - :ref:`ref-fill-mode`

.. _warnings:

Warnings & Known Bugs
----------------------

``fred.op15``

    Marked as **Non-functional** in the code. It currently only pushes an undo message.

    - *Intended:* Unlock and clear Mouth/Head frames via hotkey (Ctrl+Alt+Shift+4).

    - *Bug:* The code fails to make invisible layers visible before unlocking them. (V1.0)

    - *Workaround:* Manually ensure layers are visible and unlocked in the Outliner.

``fred.op30``

    Marked as **Crash Risk**. The code contains a syntax error in v1.0. But there's no way for the user to get to it anyway.

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