.. _use-cases:

User Scenarios
==============

OLD, NEEDS REVISION for 2.0

Needs:
- Map all v1.0→v2.0 operator names,
- convert panel-button instructions to keybinds,
- update API references (grease_pencil.*, tool_settings.*)

.. admonition:: Dan's Notes

   User walkthroughs and tutorials are intended to be written from these 'use cases', which capture functionality
   in a structured way. They're just a starting-point, readability-wise, until I can get to writing friendlier guides
   (after testing functionality paths with these and making sure everything is recorded right, and works as intended).
   Tests and failure messages can also be written from these, so they are multipurpose (and therefore no good themselvles
   for specific needs).

The following workflows describe how to use **The Violence Tool** in a **Fred-prepared scene**.

.. warning::

   These assume the scene already contains the correct Grease Pencil objects, materials, and layer structures.

.. admonition:: Fred's Tip

   Before drawing, always verify:

   1. **Layer:** Is the correct layer active (green)?

   2. **Tool:** Is the **Draw** or **Fill** tool selected?

   3. **Material:** Is the correct material selected?

   The Violence Tool buttons aim to automate these three steps for you.

Future versions of the tool will more thoroughly handle setting up a scene from scratch, so for now we will leave that to Fred's expertise.

--------------------------------------------------------------------------------

Drawing & Layer Management
--------------------------

These workflows focus on setting up the correct layer, brush, and material before drawing.

.. _uc-draw-frame:

Draw on a Specific Layer
~~~~~~~~~~~~~~~~~~~~~~~~

**Goal:** Draw the next frame of the character's body lines.

**Preconditions:**

1. A Fred-prepared scene is open.
2. The target layer exists and is unlocked.

**Steps:**

1.  **Actor** moves the timeline playhead to the next frame (e.g., Frame 2).
    *System* advances the timeline.

2.  **Actor** clicks the **"STROKE: Body"** button in the Violence Panel.
    *System* executes the layer-switching macro:

    - Searches all layers for the tag ``"01L"`` in ``layer.info``.
    - Locks **all** layers.
    - Unlocks the layer matching ``"01L"``.
    - Sets that layer as the **Active Layer**.
    - Switches to **Paint Mode** (``PAINT_GPENCIL``).
    - Sets the brush tool to **Draw** (``bpy.ops.brush.curve_preset(shape='SMOOTH')``).
    - Sets brush size to ``mybrushsize`` (default: 13).
    - Sets brush strength to 1.0.
    - Iterates material slots; assigns the first slot matching ``"1 I LINE"`` via ``bpy.ops.gpencil.material_set()``.
    - Pushes an undo step (``bpy.ops.ed.undo_push(message="...")``).

3.  **Actor** draws a stroke with the pen.
    *System* renders the stroke on the active layer using the assigned material.

**Extensions:**

2a. **Nothing happens when clicking the button.**

    *Issue:* The operator fails silently if no Grease Pencil object is selected.

    1. *System* checks for an active GP object. If none is found, the operator exits without feedback.
    2. **Actor** selects the Grease Pencil object in the Outliner.
    3. **Actor** clicks the button again.

2b. **The wrong layer becomes active.**

    *Issue:* The tag-based search (``"01L"`` in ``layer.info``) matches the first layer containing that string. If a layer was renamed and the tag was removed or duplicated, the wrong layer may be selected.

    1. *System* finds a layer with ``"01L"`` in its info string, but it is not the intended "Body" layer.
    2. **Actor** notices strokes appearing on the wrong layer.
    3. **Actor** checks the layer names in the Outliner for duplicate or missing tags.
    4. **Actor** corrects the ``layer.info`` string manually or contacts Fred.

2c. **The material is not assigned.**

    *Issue:* The code iterates ``bpy.context.active_object.material_slots`` looking for ``"1 I LINE"`` in the slot name. If the material was renamed or the slot is empty, no material is set.

    1. *System* loops through slots but finds no match for ``"1 I LINE"``.
    2. *System* skips the ``material_set()`` call without warning.
    3. **Actor** draws, but strokes use whatever material was previously active (possibly wrong color/type).
    4. **Actor** opens **Material Properties**, verifies the slot exists and is named correctly.

2d. **Strokes appear invisible despite correct layer.**

    *Issue:* The assigned material may be set to **Fill** type instead of **Stroke** type, or its color alpha is 0.

    1. *System* assigns the material slot as found.
    2. **Actor** draws but sees nothing (stroke is transparent or fill-only).
    3. **Actor** opens **Material Properties**, checks the material is set to **Stroke** type with visible color.

3a. **Strokes appear on the wrong layer despite correct button.**

    *Issue:* The target layer is locked or hidden in the Outliner. The operator unlocks it in the GP data, but if the Outliner's visibility override (eye icon) is off, strokes may not render.

    1. *System* unlocks the layer in the GP data structure.
    2. *System* does **not** check or toggle ``layer.hide`` in the Outliner.
    3. **Actor** draws but strokes are invisible or appear on a fallback layer.
    4. **Actor** opens the **Outliner**, finds the layer, and enables the **Eye** (visibility) icon.

.. _uc-sculpt-shape:

Sculpt & Adjust Shapes
~~~~~~~~~~~~~~~~~~~~~~~

**Goal:** Push or pull lines to fix proportions without redrawing.

**Preconditions:** A Fred-prepared scene is open. Strokes exist on the target layer.

**Steps:**

1.  **Actor** clicks the **"BOTH"** button for the desired part (e.g., Body).
    *System* executes the sculpt-isolation macro:

    - Unlocks both the **Lines** and **Fills** layers for the target part (e.g., ``"01L"`` and ``"01F"``).
    - Locks all other layers.
    - Switches to **Sculpt Mode** (``SCULPT_GPENCIL``).
    - Sets the active brush to **Push** (``bpy.ops.brush.curve_preset(shape='SMOOTH')``).
    - Sets brush size to ``mysculptsize`` (default: 30).
    - Immediately switches back to **Paint Mode** (``PAINT_GPENCIL``).
    - Pushes an undo step.

    *Note:* The mode switch to Sculpt and back to Paint is intentional. It prepares the Push brush so that when the actor presses ``Ctrl+Tab`` to enter Sculpt Mode manually, the correct brush is already loaded.

2.  **Actor** presses **Ctrl+Tab** and selects **Sculpt Mode**.
    *System* enters Sculpt Mode with the Push brush active.

3.  **Actor** uses the brush to push/pull lines ("butter-knifing").
    *System* deforms the stroke geometry in real-time.

4.  **Actor** clicks **"LINES"** or **"FILLS"** to return to drawing.
    *System* switches back to **Paint Mode** and resets the brush to **Ink Pen**.

**Extensions:**

1a. **The brush does nothing or moves the whole object.**

    *Issue:* The actor is still in **Object Mode** and did not enter Sculpt Mode after clicking BOTH.

    1. *System* prepared the brush but left the actor in Paint Mode.
    2. **Actor** must manually enter Sculpt Mode via **Ctrl+Tab** → **Sculpt Mode**.
    3. **Actor** verifies the **Push** brush is active in the toolbar.

3a. **Strokes look distorted after sculpting.**

    *Issue:* Sculpting moves vertices in 3D space. If the camera is front-on, vertices may drift "off-plane" (gaining Z-depth), causing visual artifacts when viewed from other angles.

    1. *System* records the new 3D positions of the sculpted vertices.
    2. **Actor** notices the strokes look warped when rotating the view.
    3. **Actor** enters **Edit Mode**, selects all (**A**), presses **F3**, searches for **Reproject Strokes**, and chooses **Project from View**.
    4. *System* flattens all vertices back to the camera plane.

.. _uc-fill-shapes:

Fill Shapes with Correct Materials
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**Goal:** Fill a closed shape with a specific color.

**Preconditions:** A closed loop of strokes exists on the "Lines" layer.

**Steps:**

1.  **Actor** clicks the **"FILL"** button for the desired part.
    *System* executes the fill-switching macro:

    - Unlocks the **Fills** layer for the target part (e.g., ``"01F"``).
    - Locks all other layers.
    - Sets the Fills layer as active.
    - Switches to **Paint Mode**.
    - Sets the brush tool to **Fill** (``bpy.ops.gpencil.use_tool('FILL')``).
    - Sets brush size to ``myfillsize`` (default: 30).
    - Iterates material slots; assigns the first slot matching the fill material pattern.
    - Pushes an undo step.

2.  **Actor** clicks inside the closed loop.
    *System* fills the enclosed region with the active material.

3.  **Actor** handles holes if needed (e.g., an ear).
    *System* requires a separate fill with a background-colored material to "punch out" the hole.

**Extensions:**

2a. **"Unable to Fill" error message appears.**

    *Issue:* The shape is not a closed loop. The Fill tool requires a continuous boundary.

    1. *System* detects a gap in the stroke boundary and reports failure.
    2. **Actor** enters **Edit Mode** (``Tab``).
    3. **Actor** zooms in and locates the gap.
    4. **Actor** joins the vertices (**J**) or draws a closing stroke.
    5. **Actor** returns to Paint Mode and retries the fill.

2b. **Fill appears on top of lines instead of behind them.**

    *Issue:* The Fills layer is above the Lines layer in the layer stack.

    1. *System* fills on the active layer regardless of stack order.
    2. **Actor** opens the Grease Pencil properties and drags the **Fills** layer below the **Lines** layer.

2c. **Fill doesn't create a "donut" (fills the hole instead of leaving it empty).**

    *Issue:* Grease Pencil cannot fill a shape with an invisible hole directly.

    1. *System* fills the entire enclosed region.
    2. **Actor** creates a **new material** with the background color.
    3. **Actor** fills the hole area with this background material.
    4. *System* renders the hole as "cut out" against the background.

.. _uc-lock-layers:

Lock/Unlock Layers for Animation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**Goal:** Isolate specific body parts (e.g., Mouth + Head) for animation while protecting others.

**Preconditions:**

1. A "Fox" object is active.
2. Layers are in a mixed locked/unlocked state.
3. Keybind required.

**Steps:**

1.  **Actor** presses **``M``** (bound to ``fred.op15``).
    *System* executes the mouth+head unlock macro:

    - Unlocks **Mouth Lines** (``"04L"``), **Mouth Mask** (``"04F"``), **Upper Teeth**, **Lower Teeth**, **Head Lines** (``"02L"``), and **Head Fills** (``"02F"``).
    - Locks all other layers.
    - Pushes an undo step.

2.  **Actor** animates the jaw and head on the unlocked layers.

**Extensions:**

1a. **Layers remain hidden after unlocking.**

    *Issue:* The operator unlocks layers (sets ``layer.lock = False``) but does **not** check or toggle ``layer.hide``. If layers were hidden in the Outliner, they remain invisible.

    1. *System* sets ``layer.lock = False`` for the target layers.
    2. *System* does **not** set ``layer.hide = False``.
    3. **Actor** notices the layers are still invisible in the viewport.
    4. **Actor** manually unhides the layers in the Outliner (click the Eye icon).
    5. **Actor** re-runs the operator or proceeds manually.

    *Future Fix:* The operator should include ``layer.hide = False`` before unlocking.

1b. **Actor only wants to animate the mouth (no head).**

    *Issue:* ``fred.op15`` always includes head layers. There is no panel button for mouth-only.

    1. **Actor** binds ``fred.op14`` (Legacy) to a key.
    2. **Actor** presses the bound key.
    3. *System* unlocks only **Mouth Lines**, **Mouth Mask**, **Upper Teeth**, and **Lower Teeth**.
    4. Head layers remain locked.

1c. **Actor wants to protect non-character layers before applying effects.**

    1. **Actor** presses ``L`` (bound to ``fred.op13``).
    2. *System* locks Background, Foreground, and Misc layers.
    3. *System* leaves Body, Head, Eyes, Mouth, and Extra layers unlocked.
    4. **Actor** can now safely apply noise/jitter without affecting BG/FG.

--------------------------------------------------------------------------------

Animation & Timing
------------------

.. _uc-duplicate-frame:

Duplicate the Previous Frame
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**Goal:** Carry over the previous drawing to the new frame to trace or modify it.

**Preconditions:** A Fred-prepared scene is open. The current frame has strokes.

**Steps:**

1.  **Actor** moves the timeline playhead to the next frame.
    *System* advances the timeline.

2.  **Actor** presses **``I``** with the cursor over the Dope Sheet panel, then selects **"In Active Group"** (also **``I``**).
    *System* duplicates the keyframe for all active, visible layers onto the new frame.

3.  **Actor** verifies the previous artwork appears on the new frame.
    *System* renders the duplicated strokes.

**Extensions:**

2a. **The duplicated frame is empty.**

    *Issue:* The previous frame had no strokes on the active layers.

    1. *System* creates a keyframe but it contains no stroke data.
    2. **Actor** checks the previous frame in the Dope Sheet.
    3. **Actor** draws a frame manually before attempting to duplicate.

2b. **Only some layers of the frame are duplicated.**

    *Issue:* "In Active Group" only copies layers that are currently unlocked and visible.

    1. *System* duplicates only the keyframe data for layers that are active and visible at the time of the ``I`` key press.
    2. **Actor** ensures all desired layers are unlocked and visible before pressing ``I``.
    3. Alternatively, **Actor** uses the "All Layers" option in the ``I`` key menu.

.. _uc-navigate-keyframes:

Navigate Keyframes
~~~~~~~~~~~~~~~~~~

**Goal:** Jump between keyframes and be able to "undo" the jump itself to return to the previous frame instantly.

**Preconditions:**

1. A Grease Pencil object with keyframes exists.
2. The animator is in the 3D Viewport.
3. Requires Keybind

**Setup:** Bind **``Right Arrow``** to ``fred.op5`` and **``Left Arrow``** to ``fred.op4`` in **3D View → 3D View (Global)**.

**Steps:**

1.  **Actor** presses **``Right Arrow``** (bound to ``fred.op5``).
    *System* executes:

    - Calls ``bpy.ops.screen.keyframe_jump(next=True)`` to advance the playhead.
    - Calls ``bpy.ops.ed.undo_push(message="Next Keyframe")`` to record the navigation on the Undo Stack.
    - **Left Arrow** calls ``(bpy.ops.screen.keyframe_jump(next=False))`` to reverse playhead.

2.  **Actor** makes an edit on the new frame.

3.  **Actor** presses **``Ctrl+Z``** to undo the navigation.
    *System* reverses the "Next Keyframe" action, snapping the playhead back to the previous frame.

**Extensions:**

1a. **Actor wants to navigate markers instead of keyframes.**

**Setup:** Bind **``Ctrl-Right Arrow``** to ``fred.op7`` and **``Ctrl-Left Arrow``** to ``fred.op6`` in **3D View → 3D View (Global)**.

    1. **Actor** presses **``Ctrl+Right Arrow``** (bound to ``fred.op7``).
    2. *System* calls ``bpy.ops.screen.marker_jump(next=True)`` and pushes to the Undo Stack.
    3. **Actor** presses **``Ctrl+Left Arrow``** (bound to ``fred.op6``).
    4. *System* calls ``bpy.ops.screen.marker_jump(next=False)`` and pushes to the Undo Stack.

1b. **Actor wants to preserve native "silent" navigation.**

    *Issue:* Binding Fred's operators to Arrow Keys replaces the native Blender behavior (which does not push undo steps).

    1. **Actor** binds ``fred.op5`` to a different key (e.g., **Page Down**).
    2. *System* fires the undo-supported navigation only when that key is pressed.
    3. Native Arrow Keys continue to jump silently (no undo record).

--------------------------------------------------------------------------------

Line Art Polish & Effects
-------------------------
.. _uc-apply-jitter:

Apply Organic Jitter to Lines
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**Goal:** Make clean vector lines look more hand-drawn and organic by applying a static, destructive noise effect.

**Preconditions:**

1.  A Grease Pencil object with the standard "Fox" layer structure is active.
2.  The animator has drawn strokes on one or more layers.
3.  Layers intended for texturing are **unlocked**. Layers not intended for texturing are **locked**.
4.  Keybind Required (Alt-R suggested)

**Steps:**

1.  **Actor** presses **``Alt-R``** (bound to ``fred.op8``).
    *System* executes:

    - Opens a custom dialog window titled **"FRED: Jiggle"**.
    - Displays three integer properties: **Strength** (default 1, max 1000), **Size** (default 5, max 50), and **Repeat** (default 1, max 10).
    - Waits for **Actor** to adjust values and click **OK** or **Cancel**.
    - Starting amount suggestions: Strength: 50, Size: 50, Repeat: 1 (repeat is how many times to repeat the operation, usually 1)

.. image:: /_static/images/jiggle-dialog.png
    :alt: The Fred Panel in the 3D Viewport sidebar
    :align: center

2.  **Actor** adjusts sliders (e.g., Strength 5, Size 5, Repeat 1) and clicks **OK**.
    *System* executes the noise loop:

    - Enters **Edit Mode** (``EDIT_GPENCIL``).
    - Selects all strokes on the active layer.
    - Iterates ``Repeat`` times:
        - Calculates a random noise offset: ``random.uniform(-0.0001, 0.0001) * (1 + int(Strength/8))``.
        - Calculates a brush radius: ``int(1 + int(Size/2))``.
        - Applies the noise offset to **99.5%** of the vertices (randomly deselects 0.5%).
        - Adjusts stroke thickness based on the calculated radius.
    - Exits **Edit Mode** and returns to **Paint Mode**.
    - Pushes a single undo step (``bpy.ops.ed.undo_push(message="Jiggle Applied")``).

3.  **Actor** inspects the result.
    *System* renders the modified strokes.

4.  **Actor** presses **``Ctrl+Z``** if the effect is too strong.
    *System* reverts the strokes to their pre-jitter state.

**Extensions:**

1a. **Actor** presses ``L`` (bound to ``fred.op13``) to lock non-character layers.
    *System* locks Background, Foreground, and Misc layers.
    *System* leaves character layers unlocked for jittering.

2a. **No change occurs after clicking OK.**

    *Issue:* The target layer is locked.

    1. *System* checks ``layer.lock`` for the active layer. If ``True``, the operator skips the modification loop.
    2. *System* does **not** display a warning message.
    3. **Actor** notices no change.
    4. **Actor** opens the **Outliner**, finds the layer, and disables the **Lock** (padlock) icon.
    5. **Actor** retries the operator.

2b. **The effect is too subtle or too chaotic.**

    *Issue:* The **Strength** or **Repeat** values were set too low or too high.

    1. *System* applies the calculated noise.
    2. **Actor** observes the result.
    3. **Actor** presses **``Ctrl+Z``** to undo.
    4. **Actor** re-runs the operator with adjusted values.

2c. **The file size increases drastically.**

    *Issue:* The noise algorithm may subdivide strokes or increase vertex count slightly.

    1. *System* modifies the stroke data.
    2. **Actor** notices the file size growing or playback lagging.
    3. **Actor** runs **Adaptive** (F3 → Simplify Stroke) to reduce vertex count.

.. _uc-optimize-strokes:

Optimize Strokes (Reduce File Size)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**Goal:** Reduce file size by removing unnecessary vertices while preserving shape.

**Preconditions:** A heavy animation file is open. Strokes exist.

**Steps:**

1.  **Actor** enters **Edit Mode** (``Ctrl+Tab``).
    *System* switches to Edit Mode.

2.  **Actor** selects all strokes (``A``).
    *System* highlights all vertices.

3.  **Actor** presses **``F3``** and searches for **"Adaptive"** (Simplify Stroke).
    *System* opens the "Simplify Stroke" dialog.

4.  **Actor** sets the **Threshold** to **0.001** (or 0.0001) and presses **Enter**.
    *System* executes:

    - Iterates through all selected strokes.
    - Removes vertices where the deviation from the curve is less than the threshold.
    - Preserves the overall shape.
    - Pushes an undo step.

5.  **Actor** verifies the file size reduction and playback smoothness.

**Extensions:**

1a. **The "Adaptive" tool is not found in F3 search.**

    *Issue:* The actor is not in **Edit Mode**. The tool is only available in Edit Mode.

    1. *System* hides the operator from the search menu if the context is not Edit Mode.
    2. **Actor** presses **``Ctrl+Tab``** to enter Edit Mode.
    3. **Actor** retries the search.

3a. **The lines look jagged or lose their shape.**

    *Issue:* The **Threshold** value is too high (e.g., 0.1).

    1. *System* aggressively removes vertices, distorting the curve.
    2. **Actor** notices jagged edges.
    3. **Actor** presses **``Ctrl+Z``**.
    4. **Actor** retries with a smaller threshold (e.g., 0.001).

3b. **The operation freezes Blender.**

    *Issue:* Too many frames are selected simultaneously without **Multi-Frame Editing** enabled.

    1. *System* attempts to process thousands of frames at once.
    2. *System* consumes excessive memory/CPU.
    3. **Actor** enables **Multi-Frame Editing** in the Dope Sheet header.
    4. **Actor** selects all frames and retries, or processes in smaller batches.

.. _uc-change-material:

Global Color Change via Materials
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**Goal:** Change the color of a character's jacket from Green to Red across *all* frames instantly.

**Preconditions:** The character uses a specific Material Slot (e.g., "Jacket_Green") for the fill.

**Steps:**

1.  **Actor** opens the **Material Properties** tab for the Grease Pencil object.
    *System* displays the list of material slots.

2.  **Actor** finds the "Jacket_Green" slot and changes the **Base Color** to Red.
    *System* updates the material data block.

3.  **Actor** plays the animation.
    *System* renders all frames using the updated material.

**Extensions:**

2a. **The color change updates EVERY frame.**

    *Issue:* The material slot is **Shared** across all keyframes. This is the default behavior.

    1. *System* applies the color change to the single material data block used by all frames.
    2. **Actor** sees the change globally.
    3. **Actor** decides to change only one frame.
    4. **Actor** clicks the **"New"** button (shield icon) next to the material name to create a **Unique Copy**.
    5. **Actor** changes the color of the unique copy.
    6. *System* applies the new color only to the current frame.

2b. **The color change does not appear on screen.**

    *Issue:* The viewport is in **Solid View** mode, which may cache colors.

    1. *System* updates the material but the viewport renderer does not refresh immediately.
    2. **Actor** presses **``Z``** and switches to **Rendered** or **Material Preview** mode.
    3. *System* refreshes the viewport.

--------------------------------------------------------------------------------

Viewport & Display Controls
----------------------------

.. _uc-toggle-compositor:

Toggle Viewport Compositor
~~~~~~~~~~~~~~~~~~~~~~~~~~

**Goal:** Instantly toggle the viewport compositor (e.g., to check flat colors vs. lit colors).

**Preconditions:** A Grease Pencil object is selected. The 3D Viewport is active.

**Steps:**

1.  **Actor** presses **``F7``** (bound to ``fred.op39``).
    *System* executes:

    - Iterates through all areas in the current window.
    - Finds the area where ``area.type == 'VIEW_3D'``.
    - Iterates spaces in that area.
    - Finds the space where ``space.type == 'VIEW_3D'``.
    - Checks ``space.shading.use_compositor``.
    - If ``'DISABLED'``, sets it to ``'ALWAYS'``.
    - If ``'ALWAYS'``, sets it to ``'DISABLED'``.
    - Pushes an undo step.

2.  **Actor** sees the change (e.g., lighting disappears, revealing flat colors).

**Extensions:**

1a. **Actor wants to disable lights on the object specifically.**

    1. **Actor** presses **``F6``** (bound to ``fred.op37``).
    2. *System* sets ``layer.use_lights = False`` for all layers of the selected object.
    3. *System* renders the object with flat colors regardless of scene lights.


BUG: **The operator crashes on the second click.**

    *Issue:* The operator defines a nested class ``VIEW3D_OT_toggle_viewport_compositor`` inside the function and calls ``register()`` every time.

    1. *System* attempts to register the class again.
    2. *System* raises a ``RuntimeError: register_class(...): already registered as bpy struct``.
    3. *System* may crash or freeze the viewport.
    4. **Actor** must restart Blender or reload the addon to recover.
    5. **Actor** avoids clicking the button twice in rapid succession.

    *Future Fix:* Inline the logic without registering a nested class.



--------------------------------------------------------------------------------

Setup & Utilities
-----------------

.. _uc-create-fox:

Create a New Rig
~~~~~~~~~~~~~~~~

.. _warning:

   This only creates a 'Fox' GP object, for now. OP25 replaces OP11, which only creates 1 layer and 1 material.

**Goal:** Create a new Grease Pencil object pre-configured with the correct layers, materials, and brushes.

**Preconditions:**
- The addon is installed and enabled.
- No Grease Pencil object is currently selected.
- fred.op25 is assigned to a key.

**Steps:**

1.  **Actor** presses **``F5``** (bound to ``fred.op25``).
    *System* executes:

    - Creates a new Grease Pencil data-block named "ANIM_FOX".
    - Creates a new object and links the data.
    - Generates **18 layers** (Body, Head, Eyes, Mouth, etc.).
    - Creates **20+ material slots** (1 I LINE, B HOLDOUT, etc.) and assigns them.
    - Sets up custom brush presets.
    - Makes the new object active.

2.  **Actor** may drawing immediately.


.. _uc-hide-layer:

Hide/Show Active Layer
~~~~~~~~~~~~~~~~~~~~~~

**Goal:** Quickly hide the current layer to see what's underneath.

**Preconditions:** A layer is active.

**Steps:**

1.  **Actor** presses **``H``** (bound to ``fred.op40``).
    *System* executes:

    - Identifies the active layer.
    - Toggles ``layer.hide`` (True ↔ False).
    - Pushes an undo step.

2.  **Actor** sees the layer disappear or reappear.

.. _uc-reveal-materials:

Reveal Hidden Materials
~~~~~~~~~~~~~~~~~~~~~~~

**Goal:** Make all hidden Grease Pencil materials visible again.

**Preconditions:** Some materials are hidden.

**Steps:**

1.  **Actor** presses **``Shift+H``** (bound to ``fred.op32``).
    *System* executes:

    - Iterates all materials in the object.
    - Sets ``material.use_nodes = True`` (if needed) and ensures visibility flags are reset.
    - Pushes an undo step.

2.  **Actor** sees all materials visible in the viewport.

--------------------------------------------------------------------------------

Utility Tools
-------------

.. _uc-hold-automerge:

Hold-to-Activate Automerge
~~~~~~~~~~~~~~~~~~~~~~~~~~

**Goal:** Temporarily enable stroke merging while drawing, then disable it upon release.

**Preconditions:** The actor is in **Paint Mode**.

**Setup:** Bind **``A``** (Press) to ``fred.op16`` and **``A``** (Release) to ``fred.op17`` in **Grease Pencil → Stroke Paint Mode**.

**Steps:**

1.  **Actor** holds down **``A``**.
    *System* executes ``fred.op16``:

    - Sets ``context.scene.gpencil_settings.use_gpencil_automerge_strokes = True``.
    - Pushes an undo step.

2.  **Actor** draws strokes.
    *System* merges new strokes with existing ones automatically.

3.  **Actor** releases **``A``**.
    *System* executes ``fred.op17``:

    - Sets ``context.scene.gpencil_settings.use_gpencil_automerge_strokes = False``.
    - Pushes an undo step.

4.  **Actor** resumes normal drawing (no merging).

**Extensions:**

1a. **Merging does not occur while holding.**

    *Issue:* The keybind is in the wrong context (e.g., 3D View Global instead of Paint Mode).

    1. *System* ignores the key press because the context is wrong.
    2. **Actor** re-binds the key in **Grease Pencil → Stroke Paint Mode**.

.. _uc-hold-draw-behind:

Hold-to-Activate Draw Behind
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**Goal:** Temporarily draw new strokes *behind* existing ones while holding a key.

**Preconditions:** The actor is in **Paint Mode**.

**Setup:** Bind **``D``** (Press) to ``fred.op21`` and **``D``** (Release) to ``fred.op22`` in **Grease Pencil → Stroke Paint Mode**.

**Steps:**

1.  **Actor** holds down **``D``**.
    *System* executes ``fred.op21``:

    - Sets ``context.scene.gpencil_settings.use_draw_behind = True``.
    - Pushes an undo step.

2.  **Actor** draws strokes.
    *System* places new strokes behind existing ones.

3.  **Actor** releases **``D``**.
    *System* executes ``fred.op22``:

    - Sets ``context.scene.gpencil_settings.use_draw_behind = False``.
    - Pushes an undo step.

4.  **Actor** resumes normal drawing (strokes on top).

.. _uc-brush-swaps:

Swap Brushes Quickly
~~~~~~~~~~~~~~~~~~~~

**Goal:** Instantly switch to specific custom brushes without opening menus.

**Preconditions:** The actor is in **Paint Mode**.

**Setup:** Bind keys to ``fred.op9`` (Eraser Point), ``fred.op10`` (Eraser Stroke), ``fred.op28`` (01 PEN), ``fred.op29`` (01 PEN STRENGTH P).

**Steps:**

1.  **Actor** presses the bound key (e.g., **``1``** for Eraser Point).
    *System* executes:

    - Sets the active brush to the specified preset.
    - Pushes an undo step.

2.  **Actor** draws with the new brush.

**Extensions:**

1a. **The brush does not change.**

    *Issue:* The custom brush preset does not exist in the file.

    1. *System* attempts to set the brush but fails silently or falls back to default.
    2. **Actor** checks the **Brush** tab in the Properties panel to verify the preset exists.
    3. **Actor** creates the missing brush preset manually.

.. _uc-fill-modes:

Toggle Fill Brush Modes
~~~~~~~~~~~~~~~~~~~~~~~

**Goal:** Switch the Fill brush between **Control** (points only) and **Both** (strokes + points).

**Preconditions:** The actor is in **Paint Mode**.

**Setup:** Bind **``F``** to ``fred.op34`` (Control) and **``G``** to ``fred.op35`` (Both).

**Steps:**

1.  **Actor** presses **``F``** or **``G``**.
    *System* executes:

    - Sets ``context.scene.gpencil_settings.fill_mode`` to ``CONTROL`` or ``BOTH``.
    - Pushes an undo step.

2.  **Actor** fills shapes with the new mode.

**Extensions:**

1a. **The fill mode does not change.**

    *Issue:* The actor is not in **Paint Mode** or the context is wrong.

    1. *System* ignores the command.
    2. **Actor** ensures they are in **Paint Mode**.

.. _uc-stroke-strength:

Toggle Stroke Strength
~~~~~~~~~~~~~~~~~~~~~~

**Goal:** Instantly set stroke strength to 0% (invisible) or 100% (opaque).

**Preconditions:** The actor is in **Paint Mode**.

**Setup:** Bind **``0``** to ``fred.op1`` (0%) and **``9``** to ``fred.op2`` (100%).

**Steps:**

1.  **Actor** presses **``0``** or **``9``**.
    *System* executes:

    - Sets ``context.scene.gpencil_settings.stroke_strength`` to 0.0 or 1.0.
    - Pushes an undo step.

2.  **Actor** draws with the new strength.

**Extensions:**

1a. **Strokes remain visible/invisible.**

    *Issue:* The actor is drawing on a layer with a material that overrides the global strength.

    1. *System* sets the global strength, but the material's alpha overrides it.
    2. **Actor** checks the **Material Properties** for the active slot.
    3. **Actor** adjusts the material's alpha if needed.

Unavailable Operators (v5.0)
-------------------------------

The following operators exist in the code but are **not recommended** or require caution for use.

+----------------------+------------+-----------------------------------------------------------+
| Operator             | Status     | Issue                                                     |
+======================+============+===========================================================+
| ``fred.op11``        | Deprecated | Superseded by ``fred.op25``. Creates incomplete object.   |
+----------------------+------------+-----------------------------------------------------------+
| ``fred.op26``        | Broken     | Passes Material object instead of string to               |
|                      |            | ``gpencil.material_set()``. Raises TypeError.             |
+----------------------+------------+-----------------------------------------------------------+
| ``fred.op30``        | Broken     | Treats ``hide_viewport`` as callable operator             |
|                      |            | instead of property. Raises AttributeError.               |
+----------------------+------------+-----------------------------------------------------------+
| ``fred.op36``        | Broken     | Calls ``mesh.vertices_smooth`` on GP objects.             |
|                      |            | Raises context error. Works on Mesh only.                 |
+----------------------+------------+-----------------------------------------------------------+
| ``fred.op38``        | Placeholder| Loops through all GP objects but performs no action.      |
+----------------------+------------+-----------------------------------------------------------+
| ``fred.op39``        | Partial    | Works on first click. Nested class registration causes    |
|                      |            | RuntimeError on second click.                             |
+----------------------+------------+-----------------------------------------------------------+

.. admonition:: Dan's Notes

    Use case statuses and what to do with them for user facing instructions:

+------------------+------------------------------------------------------------------+
| Status           | Action for User Guides                                           |
+==================+==================================================================+
| Working          | Write full tutorial                                              |
+------------------+------------------------------------------------------------------+
| Partial          | Write tutorial with workaround note                              |
+------------------+------------------------------------------------------------------+
| Keybind Required | Write tutorial with setup instructions                           |
+------------------+------------------------------------------------------------------+
| Broken           | Omit from user guides, or include as "experimental" with warning |
+------------------+------------------------------------------------------------------+
| Placeholder      | Omit entirely                                                    |
+------------------+------------------------------------------------------------------+
| Deprecated       | Omit, or mention only as "don't use this"                        |
+------------------+------------------------------------------------------------------+
