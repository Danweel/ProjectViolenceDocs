.. _operator-inventory:

Operator Inventory
==================

v2.0 (Blender 5.x / Grease Pencil 3)
-------------------------------------

This page lists all operators provided by **The Violence Layer Manager** v2.0. It serves as
technical reference for developers and advanced users. Each operator is mapped to its function
and the native Blender operations it wraps.

.. note::

   **Architectural Change:** v2.0 consolidates the many individually-named layer operators from v1.0
   (e.g., ``fred.body_lines``, ``fred.sculpt1``) into a small set of **parameterized operators** that
   accept ``layer_filter`` and ``material_filter`` string properties. This was necessary because
   Grease Pencil 3 changed how layers and materials are referenced internally.

.. warning::

   All operators require a **Grease Pencil object** to be selected and active.
   If no object is selected, the operator will report an error or fail silently.

.. _v2-active-operators:

Active Operators (v2.0)
-----------------------

Layer Switching Operators
~~~~~~~~~~~~~~~~~~~~~~~~~

.. list-table::
   :widths: 30 15 55
   :header-rows: 1

   * - Operator ID
     - Undo Support
     - Description
   * - ``fred.grease_layer_switch``
     - ``undo_push``
     - Switch to specified **line** layer. Locks all other layers, sets active layer, activates Draw tool + "MY STROKE" brush, sets material via filter match, resets brush size to ``mybrushsize`` (0.004) and strength to 1.
   * - ``fred.grease_layer_fill_switch``
     - ``undo_push``
     - Switch to specified **fill** layer. Locks all other layers, sets Fill tool, opens material selection menu (``VIEW3D_MT_greasepencil_material_active``). Does NOT set material automatically — user picks from popup.
   * - ``fred.grease_layer_fill_specific_switch``
     - ``undo_push``
     - Switch to specified **fill** layer with a **specific material**. Same as above but sets material via filter match instead of opening the menu. **Keybind TBD — ask Fred.**
   * - ``fred.grease_layer_sculpt_switch``
     - ``undo_push``
     - Unlock **both line and fill** layers for sculpting. Takes two layer filters (``layer_filter`` + ``layer2_filter``). Sets Sculpt mode, activates sculpt brush. Contains a duplicated code block with comment ``#HAS TO GO A SECOND TIME FOR WHATEVER REASON?`` — workaround for a GP3 behavior.

.. note::

   All four layer-switching operators share a common pattern: iterate layers, find matching name via substring filter, lock all, unlock target, set active. The code is **duplicated within each operator** (the layer-finding loop runs twice in succession). This is a workaround for a timing issue in GP3's layer activation. I believe the Blender team has been informed.

Drawing & Erasing Operators
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. list-table::
   :widths: 30 15 55
   :header-rows: 1

   * - Operator ID
     - Undo Support
     - Description
   * - ``gpencil.draw_mode``
     - None
     - Switch to Paint mode, activate Draw tool, activate "MY STROKE" brush via ``brush.asset_activate``.
   * - ``gpencil.erase_stroke``
     - None
     - Switch to Paint mode, activate Erase tool, activate "ERASE STROKE" brush.
   * - ``gpencil.erase_point``
     - None
     - Switch to Paint mode, activate Erase tool, activate "ERASE POINT" brush.
   * - ``gpencil.erase_all_of_selected``
     - ``undo_push``
     - Select linked geometry (``grease_pencil.select_linked``), delete all (``grease_pencil.delete(mode='ALL')``).

.. note::

   In Blender 5.2 LTS, the "Default Eraser" setting was removed (commit ``8c22be8d89``). The last activated
   eraser brush is now used automatically. The tool's two eraser operators work around this by explicitly
   activating the desired eraser brush before switching to erase mode. Also note: the Python API for
   ``paint.eraser_brush`` and ``paint.eraser_brush_asset_reference`` has been removed in 5.2.

Modal Toggle Operators
~~~~~~~~~~~~~~~~~~~~~~~~

.. list-table::
   :widths: 30 15 55
   :header-rows: 1

   * - Operator ID
     - Undo Support
     - Description
   * - ``gp.auto_merge_on``
     - None
     - Sets ``scene.tool_settings.use_gpencil_automerge_strokes = True``. Designed for hold-to-activate keybind.
   * - ``gp.auto_merge_off``
     - None
     - Sets ``scene.tool_settings.use_gpencil_automerge_strokes = False``. Designed for release keybind.
   * - ``gp.sculpt_mode_on``
     - None
     - Calls ``grease_pencil.sculptmode_toggle()``. Designed for hold-to-activate keybind.
   * - ``gp.sculpt_mode_off``
     - None
     - Calls ``grease_pencil.paintmode_toggle()``. Designed for release keybind.
   * - ``gp.draw_behind_on``
     - None
     - Sets ``scene.tool_settings.use_gpencil_draw_onback = True``.
   * - ``gp.draw_behind_off``
     - None
     - Sets ``scene.tool_settings.use_gpencil_draw_onback = False``.

.. warning::

   Modal toggle operators have no undo support (obviously, I guess, but as a note). Toggles are instantaneous
   state changes that don't produce discrete operations to undo. **However**, if a toggle "hangs" due to
   Blender not registering press/release during a stroke, see :ref:`trouble-modal-toggles`.

Brush & Material Operators
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. list-table::
   :widths: 30 15 55
   :header-rows: 1

   * - Operator ID
     - Undo Support
     - Description
   * - ``gp.draw_brush_strength_full``
     - None
     - Sets ``bpy.data.brushes["MY STROKE"].strength = 1``.
   * - ``gp.draw_brush_strength_none``
     - None
     - Sets ``bpy.data.brushes["MY STROKE"].strength = 0``.
   * - ``gp.apply_material_and_stroke``
     - **``REGISTER, UNDO``**
     - Applies active material to selected strokes (``grease_pencil.stroke_material_set``), sets stroke type from brush settings (``grease_pencil.set_stroke_type``). Includes error check for missing brush.
   * - ``gp.join_and_smooth``
     - ``undo_push``
     - Joins selected strokes (``grease_pencil.join_selection(type='JOINSTROKES')``), smooths (``grease_pencil.stroke_smooth(iterations=10, factor=0.5)``).

Navigation & Timeline Operators
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. list-table::
   :widths: 30 15 55
   :header-rows: 1

   * - Operator ID
     - Undo Support
     - Description
   * - ``gp.prev_keyframe``
     - ``undo_push``
     - Jump to previous keyframe (``screen.keyframe_jump(next=False)``). Pushes undo so Ctrl-Z snaps back.
   * - ``gp.next_keyframe``
     - ``undo_push``
     - Jump to next keyframe (``screen.keyframe_jump(next=True)``). Same undo behavior.
   * - ``gp.prev_marker``
     - ``undo_push``
     - Jump to previous marker (``screen.marker_jump(next=False)``).
   * - ``gp.next_marker``
     - ``undo_push``
     - Jump to next marker (``screen.marker_jump(next=True)``).
   * - ``gp.center_timeline``
     - None
     - Centers timeline: ``action.view_selected()`` + ``action.view_frame()``.

Viewport & Overlay Operators
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. list-table::
   :widths: 30 15 55
   :header-rows: 1

   * - Operator ID
     - Undo Support
     - Description
   * - ``gp.toggle_fade``
     - None
     - Toggles ``space_data.overlay.use_gpencil_fade_layers``, forces ``show_overlays = True`` so the fade is visible.
   * - ``scene.toggle_realtime_compositor``
     - None
     - Iterates screen areas, finds VIEW_3D, toggles ``shading.use_compositor`` between ``DISABLED`` and ``ALWAYS``.

Background Timer (Not an Operator)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. list-table::
   :widths: 30 15 55
   :header-rows: 1

   * - ID
     - Type
     - Description
   * - ``_my_stroke_check_material``
     - ``bpy.app.timers``
     - Polls every 0.2 seconds (5 times/second). Checks if the active material index has changed. If so, inspects the material name: if it contains ``"LINE"`` (case-insensitive), sets ``brush.gpencil_settings.stroke_type = 'STROKE'``. If it contains ``"FILLONLY"``, sets ``stroke_type = 'FILL'``. Otherwise sets ``stroke_type = 'BOTH'``. Registered during ``register()``, unregistered during ``unregister()``.

.. note::

   **Why this timer exists:** Grease Pencil 3 removed per-material tickboxes for toggling strokes and fills on/off.
   In GP Blender 4.x, you could set a material to draw strokes only, fills only, or both, per material. That capability
   is gone — you must manually click "Stroke", "Fill", or "Both" at the top of the viewport every time you switch materials.

   Fred's timer restores the old workflow: materials with ``"LINE"`` in their name automatically get stroke-only mode.
   All other materials get both mode. Setting fill color alpha to 0% does NOT work as a workaround — invisible fills
   are still rendered and progressively slow down drawing as strokes grow longer.

Global Variables
~~~~~~~~~~~~~~~~~

.. list-table::
   :widths: 30 15 55
   :header-rows: 1

   * - Variable
     - Value
     - Used By
   * - ``mybrushsize``
     - ``0.004``
     - Layer switch operators (sets ``unprojected_size`` on "MY STROKE" / "MY FILL" brushes)
   * - ``myshadowsize``
     - ``70``
     - **Unused** — declared but not referenced anywhere in v2.0 code. Preserved from v1.0 shadow fill operator.
   * - ``myextrasize``
     - ``13``
     - **Unused** — declared but not referenced. Preserved from v1.0 extra layer operator.
   * - ``seeder``
     - ``1``
     - **Unused** — declared but not referenced. Possibly intended for randomize operator (now removed).

.. _deprecated-operators:

Deprecated / Removed Operators (v1.0 Reference)
------------------------------------------------

These operators existed in v1.0/"Revision 5" (Blender 4.1.1) but are **not present** in the v2.0
code. They are documented here for reference — especially for users migrating or referencing v1.0 projects.

.. _removed-layer-operators:

Removed: Individually-Named Layer Operators
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**Replaced by:** ``fred.grease_layer_switch`` (lines), ``fred.grease_layer_fill_switch`` (fills),
``fred.grease_layer_sculpt_switch`` (sculpting).

.. list-table::
   :widths: 30 70
   :header-rows: 1

   * - Old Operator ID
     - v1.0 Function
   * - ``fred.body_lines`` / ``fred.body_fills``
     - Switch to Body line/fill layer
   * - ``fred.head_lines`` / ``fred.head_fills``
     - Switch to Head line/fill layer
   * - ``fred.eyes_lines`` / ``fred.eyes_fills``
     - Switch to Eyes line/fill layer
   * - ``fred.mouth_lines`` / ``fred.mouth_fills``
     - Switch to Mouth line/fill layer
   * - ``fred.extra_lines`` / ``fred.extra_fills``
     - Switch to Extra line/fill layer
   * - ``fred.foreground_lines`` / ``fred.foreground_fills``
     - Switch to Foreground line/fill layer
   * - ``fred.background_lines`` / ``fred.background_fills``
     - Switch to Background line/fill layer
   * - ``fred.layer8_lines`` through ``fred.layer10_fills``
     - Switch to Misc 8-10 layers
   * - ``fred.sculpt1`` through ``fred.sculpt10``
     - Isolate body part for sculpting (Lines + Fills)
   * - ``fred.mouth1`` through ``fred.mouth4``
     - Mouth Lines, Mask, Upper Teeth, Lower Teeth

**Why removed:** Grease Pencil 3 changed how layers and materials are referenced. Maintaining
one operator per body part required updating each individually for GP3 compatibility. The
parameterized approach (one operator with filter strings) achieves the same result with far
less code duplication and easier maintenance.

.. _removed-effects-operators:

Removed: Effects & Noise Operators
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. list-table::
   :widths: 30 30 40
   :header-rows: 1

   * - Old Operator ID
     - v1.0 Function
     - v2.0 Replacement
   * - ``fred.op8`` (Jiggle/Randomize Small)
     - Select random vertices, apply small noise transform via dialog
     - **Noise Modifier** (Modifiers → Effect → Noise). Non-destructive, keyframable.
   * - ``fred.op23`` (Randomize Large)
     - Select random vertices, apply large noise transform
     - **Noise Modifier** with higher Strength setting.
   * - ``fred.op12`` (Randomize Legacy)
     - Earlier version of randomize
     - Same — Noise Modifier.
   * - ``fred.applynoise`` (Dialog)
     - Dialog box for noise application with fixed ranges
     - **Noise Modifier** provides interactive sliders in the modifier panel.
   * - ``fred.shadowfills``
     - Switch to Shadows layer, set brush size 70px
     - ``fred.grease_layer_fill_switch`` with ``layer_filter="shadow"`` (if layer exists in scene)
   * - ``fred.highlights1`` / ``fred.highlights2`` / ``fred.highlights3``
     - Switch to Highlights layers with specific materials
     - ``fred.grease_layer_fill_specific_switch`` with appropriate filters

**Why removed:** The Noise/jitter functionality is now available natively through Blender's
GP3 Noise Modifier, which is non-destructive and keyframable. The old operators used
``bpy.ops.transform.translate`` with random values — which is a "destructive" operation - i.e., once done, it can't be adjusted afterwards.

.. _removed-utility-operators:

Removed: Utility Operators
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. list-table::
   :widths: 30 30 40
   :header-rows: 1

   * - Old Operator ID
     - v1.0 Function
     - v2.0 Replacement
   * - ``fred.op19`` (Toggle Onion Skins)
     - Toggle ``space_data.overlay.use_gpencil_onion_skin``
     - **Native Overlay toggle:** Overlays button → check Onion Skinning. Per-layer via eye icon.
   * - ``fred.op20`` (Clear Vertex Paints)
     - Iterate all GP objects, set ``vertex_color = [0,0,0,0]`` on all points
     - **Native:** Object Data Properties → Vertex Colors → click X. Or Vertex Paint mode → Clear brush.
   * - ``fred.op24`` (Smooth Stroke standalone)
     - ``bpy.ops.gpencil.stroke_smooth(repeat=2, factor=0.5)``
     - **Native:** Edit Mode → F3 → "stroke smooth". Or ``gp.join_and_smooth`` (Alt-F).
   * - ``fred.op11`` (Create blank GP)
     - Create new GP object "ART_FOX" with one layer/material
     - **Removed.** Use Fred's provided scene files.
   * - ``fred.op13`` (Lock non-character)
     - ``bpy.ops.gpencil.lock_all()``
     - Manual lock in Outliner.
   * - ``fred.op14`` / ``fred.op15``
     - Unlock mouth/head layers
     - ``fred.grease_layer_sculpt_switch`` with appropriate filters.
   * - ``fred.op25`` (Create GP Fox)
     - Generate full Fox template with materials
     - **Removed.** Use provided scene files.
   * - ``fred.op26`` through ``fred.op35``
     - Various legacy material/brush/modifier toggles
     - Mix of ``gp.apply_material_and_stroke`` and native Blender operations.
   * - ``fred.op36`` (Retopo Helper)
     - Flatten Y-axis, smooth, snap to face
     - **Removed.** Experimental, not for production use.
   * - ``fred.op37`` (Disable Lights)
     - Set ``layer.use_lights = False``
     - Manual toggle in layer properties.
   * - ``fred.op38`` (Bulk GP action)
     - Loop all GP objects (placeholder)
     - **Removed.** Never performed an actual action.
   * - ``fred.op39`` (Toggle Compositor)
     - Toggle ``shading.use_compositor``
     - **Renamed** to ``scene.toggle_realtime_compositor`` — still exists in v2.0.
   * - ``fred.op40`` (Toggle Layer Hide)
     - Toggle ``layer.hide``
     - Manual toggle in Outliner.

.. _blender-ref-appendix:

Technical Appendix: Native Blender Operations (v2.0)
-----------------------------------------------------

This section documents the specific native Blender API calls used by the v2.0 operators.
Updated for the Grease Pencil 3 API paths (Blender 5.1/5.2 LTS).

.. _ref-mode-set:

**Mode Switching**
~~~~~~~~~~~~~~~~~~

.. code-block:: python

   bpy.ops.object.mode_set(mode='PAINT_GREASE_PENCIL')
   bpy.ops.object.mode_set(mode='SCULPT_GREASE_PENCIL')

*Blender API:* :func:`mode_set <blender_api:bpy.ops.object.mode_set>`

.. note::

   **GP3 API Change:** The mode enums changed from ``PAINT_GPENCIL`` / ``SCULPT_GPENCIL`` (GP2?)
   to ``PAINT_GREASE_PENCIL`` / ``SCULPT_GREASE_PENCIL`` (GP3). This was one of the core
   breaking changes that necessitated a v2.0 of the tool.

.. _ref-layer-active:

**Set Active Layer**
~~~~~~~~~~~~~~~~~~~~

.. code-block:: python

   gp = bpy.context.active_object.data
   index = gp.layers.find(target_layer_name)
   if index != -1:
       bpy.ops.grease_pencil.layer_active(layer=index)

*Blender API:* :func:`layer_active <blender_api:bpy.ops.grease_pencil.layer_active>`

.. note::

   **GP3 API Change:** In GP2, layers were set active via ``gp.layers.active = gp.layers[name]``.
   In GP3, this is done via the ``grease_pencil.layer_active`` operator with an index parameter.
   The tool searches by substring match (``layer_filter in layer.name``) rather than exact name
   to accommodate naming variations across projects.

.. _ref-tool-set:

**Set Brush Tool**
~~~~~~~~~~~~~~~~~~

.. code-block:: python

   bpy.ops.wm.tool_set_by_id(name="builtin.brush")       # Draw tool (v2.0)
   bpy.ops.wm.tool_set_by_id(name="builtin_brush.Draw")  # Draw tool (alternate)
   bpy.ops.wm.tool_set_by_id(name="builtin_brush.Fill")  # Fill tool
   bpy.ops.wm.tool_set_by_id(name="builtin_brush.Erase") # Erase tool

*Blender API:* :func:`tool_set_by_id <blender_api:bpy.ops.wm.tool_set_by_id>`

.. note::

   **GP3 API Change:** Tool IDs changed slightly between GP2 and GP3. ``builtin_brush.Draw``
   was the GP2 draw tool ID; in some GP3 contexts ``builtin.brush`` is used instead. The v2.0
   code uses ``builtin.brush`` for sculpt mode and ``builtin_brush.Draw`` for paint mode,
   suggesting the correct ID depends on context. **Test which works in 5.2 LTS specifically.**

.. _ref-brush-activate:

**Activate Brush Asset**
~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: python

   bpy.ops.brush.asset_activate(
       asset_library_type='LOCAL',
       relative_asset_identifier="Brush/MY STROKE"
   )

*Blender API:* :func:`asset_activate <blender_api:bpy.ops.brush.asset_activate>`

.. note::

   **GP3 API Change:** In GP2, brushes were set via ``bpy.context.scene.tool_settings.gpencil_paint.brush = bpy.data.brushes["NAME"]``.
   In GP3 with Blender 5.x, brushes are managed as **assets** and must be activated via
   ``brush.asset_activate`` with a ``relative_asset_identifier``. This is a significant change
   in the brush management system.

   However, some parts of the v2.0 code still use the old direct-access pattern:
   ``bpy.data.brushes["MY STROKE"].strength = 1``. This hybrid approach works because
   the brush data-block still exists even when the asset system is used for activation.

.. _ref-automerge-v2:

**Toggle Automerge**
~~~~~~~~~~~~~~~~~~~~

.. code-block:: python

   context.scene.tool_settings.use_gpencil_automerge_strokes = True  # or False

*Blender API:* :class:`ToolSettings <blender_api:bpy.types.ToolSettings>` (see ``use_gpencil_automerge_strokes``)

.. note::

   **GP3 API Change:** In v1.0, this was done via ``bpy.ops.wm.context_set_value(data_path=..., value=...)``
   with string arguments. The v2.0 code accesses the property directly, which is cleaner and
   avoids string-based data path lookups.

.. _ref-delete-v2:

**Delete All Connected**
~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: python

   if bpy.ops.grease_pencil.select_linked.poll():
       bpy.ops.grease_pencil.select_linked()
   bpy.ops.grease_pencil.delete(mode='ALL')

*Blender API:* :func:`select_linked <blender_api:bpy.ops.grease_pencil.select_linked>`,
:func:`delete <blender_api:bpy.ops.grease_pencil.delete>`

.. note::

   **GP3 API Change:** The ``grease_pencil`` namespace replaced the old ``gpencil`` namespace
   for most operators. ``bpy.ops.gpencil.select_linked`` → ``bpy.ops.grease_pencil.select_linked``.

.. _ref-join-smooth-v2:

**Join & Smooth Strokes**
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: python

   bpy.ops.grease_pencil.join_selection(type='JOINSTROKES')
   bpy.ops.grease_pencil.stroke_smooth(iterations=10, factor=0.5)

*Blender API:* :func:`join_selection <blender_api:bpy.ops.grease_pencil.join_selection>`,
:func:`stroke_smooth <blender_api:bpy.ops.grease_pencil.stroke_smooth>`

.. note::

   **GP3 API Change:** Parameters changed: ``repeat`` → ``iterations``, ``factor`` retained.
   Namespace changed from ``gpencil`` to ``grease_pencil``.

.. _ref-keyframe-v2:

**Keyframe / Marker Jump**
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: python

   bpy.ops.screen.keyframe_jump(next=False)  # or True
   bpy.ops.screen.marker_jump(next=False)    # or True

*Blender API:* :func:`keyframe_jump <blender_api:bpy.ops.screen.keyframe_jump>`,
:func:`marker_jump <blender_api:bpy.ops.screen.marker_jump>`

.. note::

   These are standard Blender operators, unchanged between GP2 and GP3. The tool wraps them
   to add ``undo_push()`` calls so timeline navigation appears in the undo stack.

.. _ref-material-set-v2:

**Set Active Material Index**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: python

   for i, slot in enumerate(bpy.context.active_object.material_slots):
       if material_filter in slot.name:
           bpy.context.active_object.active_material_index = i
           break

*Blender API:* :class:`Object <blender_api:bpy.types.Object>` (see ``active_material_index``)

.. note::

   **GP3 API Change:** In v1.0, materials were set via ``bpy.ops.gpencil.material_set(slot=slot.name)``.
   In v2.0, the code iterates material slots directly and sets ``active_material_index``. This
   avoids the ``material_set`` operator which may have changed behavior in GP3.

.. _ref-compositor-v2:

**Toggle Viewport Compositor**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: python

   for area in context.screen.areas:
       if area.type == 'VIEW_3D':
           shading = area.spaces.active.shading
           if shading.use_compositor == 'ALWAYS':
               shading.use_compositor = 'DISABLED'
           else:
               shading.use_compositor = 'ALWAYS'
           break

*Blender API:* :class:`View3DShading <blender_api:bpy.types.View3DShading>` (see ``use_compositor``)

Valid values: ``'DISABLED'``, ``'CAMERA'``, ``'ALWAYS'``.

.. _ref-timer-v2:

**Background Timer (Material Stroke Check)**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: python

   _my_stroke_last_index = None

   def _my_stroke_check_material():
       global _my_stroke_last_index
       obj = bpy.context.object
       if obj and obj.type == 'GREASEPENCIL':
           index = obj.active_material_index
           if index != _my_stroke_last_index:
               _my_stroke_last_index = index
               mat = obj.active_material
               brush = bpy.data.brushes.get("MY STROKE")
               if brush and mat:
                   if "LINE" in mat.name.upper():
                       brush.gpencil_settings.stroke_type = 'STROKE'
                   elif "FILLONLY" in mat.name.upper():
                       brush.gpencil_settings.stroke_type = 'FILL'
                   else:
                       brush.gpencil_settings.stroke_type = 'BOTH'
       return 0.2

   # Registration:
   bpy.app.timers.register(_my_stroke_check_material)

*Blender API:* :class:`app.timers <blender_api:bpy.app.timers>`

.. note::

   The return value of ``0.2`` is the interval in seconds until the next call (5 times/second).
   The timer checks whether the active material index has changed since the last poll, avoiding
   unnecessary brush updates on every tick.

   **GP3 context:** This timer exists because Grease Pencil 3 removed per-material stroke/fill
   toggle controls. Without it, artists must manually click "Stroke" or "Both" at the top of
   the viewport every time they switch between line art and fill materials. The timer automates
   this based on material name conventions.

   **5.2 LTS note:** The ``gpencil_settings.stroke_type`` property and ``brush.gpencil_settings``
   access pattern remain valid in 5.2. The new ``fill_id`` property on strokes (added in 5.2)
   is a separate system — it controls which fill belongs to which stroke at the data level, while
   the timer controls which *mode* the brush is in when drawing. They are complementary, not
   conflicting.

.. _ref-blender-52-changes:

Blender 5.2 LTS — Grease Pencil Changes (Developer Reference)
--------------------------------------------------------------

Blender 5.2 LTS was released July 14, 2026, with LTS support until July 2028. The following
Grease Pencil changes are relevant to The Violence Tool v2.0:

**Breaking Changes:**

.. list-table::
   :widths: 40 60
   :header-rows: 1

   * - Change
     - Impact on Violence Tool
   * - ``paint.eraser_brush`` and ``paint.eraser_brush_asset_reference`` API removed (``8c22be8d89``)
     - The tool's eraser operators use ``brush.asset_activate`` instead — not affected by this removal. However, any code referencing ``paint.eraser_brush`` directly would need updating.
   * - "Default Eraser" setting removed — last activated eraser brush is now used
     - The tool's two eraser operators (``gpencil.erase_stroke`` / ``gpencil.erase_point``) explicitly activate the desired eraser brush before switching modes, so this change is **compatible** with the tool's approach.

**New Features (potential future use):**

.. list-table::
   :widths: 40 60
   :header-rows: 1

   * - Feature
     - Potential Tool Integration
   * - **Delaunay fill algorithm** — new default, with automatic gap detection, inverse filling, zoom independence, faster performance
     - Fill workflow may behave differently. Test whether ``fred.grease_layer_fill_switch`` results change with the new algorithm. The old flood-fill is still available under Advanced settings.
   * - **``fill_id`` and ``hide_stroke`` properties** on strokes in the Python API (``2c7b705658``)
     - ``fill_id`` allows per-stroke fill assignment. Could eventually replace the material-name-based timer approach if integrated. ``hide_stroke`` could replace visibility toggle operators.
   * - **``layer.layer_masks.add`` / ``layer.layer_masks.remove``** functions (``7ff9668c49``)
     - Could be used for programmatic mask layer management if the tool ever needs to create/modify masks dynamically.
   * - **Line material placement settings** (Count, Density, Radius) for Dots/Squares — generated at render time
     - If the tool's materials use Dots or Squares rendering, performance may improve significantly. No code change needed — this is automatic.
   * - **New curve type setting** in Draw Tool (Bézier, Catmull-Rom, NURBS)
     - Strokes created with the tool will use this setting. If specific curve types are needed for line art, the tool may want to set this programmatically in the future.
   * - **New "Fill Strokes" option in Line Art** — generated strokes can carry fill material
     - Relevant if the tool integrates with Blender's Line Art system. Currently the tool does its own line art, so no immediate impact.
   * - **Vertex Paint blend modes** added (matching mesh vertex paint)
     - If the tool ever reintroduces vertex paint operations, these new blend modes would be available.

**Quality of Life:**

.. list-table::
   :widths: 40 60
   :header-rows: 1

   * - Change
     - Notes
   * - "Move to Layer" operator shows layer groups as menus/submenus matching tree structure
     - Helps with manual layer organization. The tool's parameterized operators bypass this UI, but users managing layers manually benefit.
   * - ``Shift + L`` deselects fully-selected strokes
     - Useful for editing workflows with the tool.
   * - Eraser uses last activated eraser brush (no more "Default Eraser" setting)
     - Aligns with tool's approach of explicitly setting eraser brushes per operator.
   * - New bundled Grease Pencil brushes + 19 new online brushes by Blender Studio artists
     - Tool uses custom brushes ("MY STROKE", "MY FILL", "ERASE STROKE", "ERASE POINT") — bundled brushes are irrelevant unless the tool is adapted to use them.
   * - **Playback Loop modes** added (Infinite, Stop at End/Start, Restore Frame, Bounce)
     - Useful for animators reviewing their work. Not tool-specific.

**Migration Notes for 5.2 LTS:**

   1. The tool's ``bl_info`` declares ``"blender": (5, 1, 2)``. This is compatible with 5.2 LTS
      since 5.2 is a superset of 5.1's API. No changes needed for 5.2 compatibility — but the
      version number should be bumped to ``(5, 2, 0)`` or ``(2, 0)`` for the tool's own version.
   2. The ``brush.asset_activate`` API used by the tool was introduced in 5.0 and remains
      stable in 5.2.
   3. The ``grease_pencil`` namespace operators used by the tool (``layer_active``,
      ``select_linked``, ``delete``, ``join_selection``, ``stroke_smooth``,
      ``stroke_material_set``, ``set_stroke_type``, ``sculptmode_toggle``,
      ``paintmode_toggle``) are all present in 5.2 LTS.
   4. The ``bpy.app.timers`` API used by the material-check timer is unchanged in 5.2.
   5. **Asset files must be re-saved** when upgrading from 5.1 to 5.2 (same as the 5.0→5.1
      migration). Practice files and scene files may need to be opened and re-saved in 5.2
      to ensure compatibility.