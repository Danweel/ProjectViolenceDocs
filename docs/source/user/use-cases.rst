.. _use-cases:

Animation Workflows (AFIS)
==========================

The following core animator use cases describe the standard workflow for an animator using **The Violence Tool** in a **Fred-prepared scene**.

.. warning::

   These assume the scene already contains the correct Grease Pencil objects, materials, and layer structures.

Future versions of the tool will more thoroughly handle setting up a scene from scratch, so for now we will leave that to Fred's expertise.

These 'user flows' are simple how-tos for now, see 2.0 of the docs for full 'process documentations' vs 'user manual' writeups.

.. admonition:: Fred's Tip

   Before drawing, always verify:

   1. **Layer:** Is the correct layer active (green)?

   2. **Tool:** Is the **Draw** or **Fill** tool selected?

   3. **Material:** Is the correct material selected?

   The Violence Tool buttons aim to automate these three steps for you.

--------------------------------------------------------------------------------

.. _uc-draw-frame:

Draw a New Frame on a Specific Layer
------------------------------------

**Goal:** The animator wants to draw the next frame of the character's body lines.

**Precondition:** A Fred-prepared scene is open. The "Body" layer exists and is unlocked.

Steps
~~~~~

1. **Move Timeline**

   Animator moves the timeline playhead to the next frame (e.g., Frame 2).

   *System Response:* Timeline advances.

2. **Activate Layer**

   Animator clicks the **"STROKE: Body"** button in the Violence Panel.

   *System Response:*

   - Tool unlocks the "Body" layer.

   - Tool sets "Body" as the **Active Layer**.

   - Tool locks all other layers.

   - Tool sets the brush to **"Ink Pen"** with **Hardness 1.0**.

3. **Draw Stroke**

   Animator draws a stroke with the pen.

   *System Response:* The stroke appears **only** on the "Body" layer.

**Result:** The animator successfully draws on 1. the next frame, 2. on the correct layer, 3. with the correct brush settings.

.. admonition:: Fred's Tip

   If you want to edit individual points later, hit **Ctrl+Tab** to enter **Edit Mode**. You can use **Proportional Editing** (mouse wheel) to grab and move vertices without affecting neighbors. Use **Alt+S** to change stroke thickness globally.

.. _uc-draw-frame-extensions:

Possible Issues
~~~~~~~~~~~~~~~

2a. **Nothing happens when clicking "STROKE: Body".**

    *   **Cause:** You are in the wrong mode (Object Mode instead of Draw Mode).
    *   **Fix:** Press **Ctrl+Tab** and select **Draw Mode**. Ensure the Grease Pencil object is selected.

2b. **Strokes appear invisible.**

    *   **Cause:** The "Black Stroke" material slot is missing or unassigned.
    *   **Fix:** Go to **Material Properties**. Create a new material named "Black Stroke", set it to **Stroke** (not Fill), and ensure it is assigned to the active slot.

2c. **Strokes appear on the wrong layer.**

    *   **Cause:** The target layer is locked or hidden in the Outliner.
    *   **Fix:** Open the **Outliner**, find the "Body" layer, and ensure the **Lock** (padlock) and **Eye** (visibility) icons are active. Click the tool button again.

--------------------------------------------------------------------------------

.. _uc-duplicate-frame:

Duplicate the Previous Frame (Onion Skinning?)
----------------------------------------------

**Goal:** The animator wants to carry over the previous drawing to the new frame to trace/modify it.

**Precondition:** A Fred-prepared scene is open. The current frame has strokes.

Steps
~~~~~

1. **Move Timeline**

   Animator moves the timeline playhead to the next frame.

   *System Response:* Timeline advances.

2. **Duplicate Keyframe**

   1. With cursor over the Dopesheet panel, Animator hits hotkey ``I`` to bring up New Keyframe dropdown.
   2. Animator chooses "In Active Group" (Also ``I``)

   *System Response:* Blender creates new frame based on active, visible layers

3. **Verify Frame**

   Animator sees the previous artwork on the new frame.

   *System Response:* The strokes are now visible on Frame N, ready to be modified.


.. admonition:: Fred's Tip

   In the **Dope Sheet** (set to 'Grease Pencil'), you can see the keyframes as diamonds. If you hit **I** and choose 'In Active Group', you copy the whole frame.

.. _uc-duplicate-frame-extensions:

Possible Issues
~~~~~~~~~~~~~~~

2b. **The duplicated frame is empty.**

    *   **Cause:** The previous frame had no strokes on the layer.
    *   **Fix:** Check the previous frame in the Dope Sheet. If it is empty, you must draw a frame manually before duplicating.

2c. **Only some layers of the frame are duplicated.**

    *   **Cause:** The tool might be targeting a specific layer subset.
    *   **Fix:** Ensure you are using the "All Layers" option in the standard **I** key menu if the tool fails.

--------------------------------------------------------------------------------

.. _uc-apply-jitter:

Apply Organic Jitter to Lines
-----------------------------

**Goal:** The animator wants to make clean vector lines look more hand-drawn and organic.

**Precondition:** Strokes are selected on an unlocked layer.

This uses Blender's native **Randomize** modifier, which is **non-destructive**.
Your original strokes are preserved; you can adjust or remove the effect at any time.

Steps
~~~~~

1. Select your Grease Pencil object
2. Go to the **Modifiers Tab** (Wrench icon in the Properties Editor)
3. Click **Add Modifier** → **Effect** → **Randomize**
4. Adjust the following settings:

   **Random**
      Set to ``1``. The default is 4, which only recalculates the jitter
      every 4th frame. Setting it to 1 ensures the lines shift every frame,
      creating the "squiggle vision" effect (similar to *Dr. Katz* or
      *Home Movies*).

   **Position**
      Controls how far the vertices displace. Start with a small value
      (a subtle shift). Increase for wilder jitter; decrease for subtler
      movement. Fred recommends adjusting this "just about a little bit."

   **Noise Scale**
      Controls the detail and intricacy of the displacement pattern.
      At ``0``, there is no visible effect. Increase gradually — higher
      values produce more detailed, intricate jitter patterns.

5. Check the result in the viewport. Play the animation (``Shift+Space``)
      to see the effect across frames.
6. Adjust the sliders until the movement feels natural.

**Result:** The lines have a natural, hand-drawn texture.

.. admonition:: Fred's Tip

   Don't overdo it! A small amount of noise makes it look alive. If you draw too many vertices, the file gets huge. Use the **Adaptive** tool (search 'Adaptive' in F3) to simplify the strokes *after* you draw, reducing file size without losing quality.


Possible Issues
~~~~~~~~~~~~~~~

2a. **No change occurs after clicking "Randomize Line Art".**

    *   **Cause:** The layer is locked, preventing modifications.
    *   **Fix:** Open the **Outliner**, find the target layer, and ensure the **Lock** (padlock) icon is disabled.


2b. **User cannot find the Modifiers Tab:**

    Scenario: The user clicks the Wrench icon but sees a list of Mesh modifiers (Solidify, Subdivision Surface) instead of Grease Pencil effects.
    * **Cause:** The user has a 3D Mesh object selected (like a Cube) instead of the Grease Pencil object, or the object type is unrecognized.
    * **Fix:**

      - Verify the object is selected in the Outliner (it should have a green pencil icon).
      - Ensure you are in Object Mode (press Tab if in Edit Mode).
      - If the list is empty or wrong, check that the object is indeed a Grease Pencil object (Shift+A → Grease Pencil → Stroke if missing).


3a. **The lines look too chaotic or broken.**

    *   **Cause:** The randomization strength is too high (configurable within the tool code) or applied to too many vertices.
    *   **Fix:** Undo (**Ctrl+Z**) and try again with a lower setting. Alternatively, use the **Noise Modifier** in the Properties panel for more controlled animation.

.. warning::

    Right now, the hardcoded setting should be correct for the AFIS project. If it doesn't look right, see Fred about the file. This is noted in case you are using the tool for something else.

3b. **The file size increases drastically after randomization.**

    *   **Cause:** Adding noise can increase vertex count if the tool subdivides strokes.
    *   **Fix:** Immediately run **Adaptive** (F3 → Adaptive) to simplify the strokes back down. See :ref:`uc-optimize-strokes`.

3c. **"Effect" submenu is missing or empty:**

The user clicks Add Modifier but does not see the Effect category, or the Randomize option is greyed out.
    * **Cause:** The user is using an older version of Blender (pre-3.0) where modifiers were organized differently, or the Grease Pencil object lacks the necessary data blocks.
    * **Fix:**

      - Check Blender version (requires 3.0+ for modern Grease Pencil modifier structure).
      - Ensure the object has at least one stroke drawn on it (empty objects sometimes hide modifiers).
      - If using a very old version, the modifier may be named "Noise" instead of "Randomize" and located directly under the main list.

4a. **User sets Random to 0:**

    Scenario: The user sets the Random parameter to 0.
    * **Cause:** The modifier calculates the jitter only once (at frame 1) and holds that static distortion for the entire animation. The "squiggle" effect disappears; the lines look distorted but static.
    * **Fix:**

      - Change Random back to 1 to enable per-frame recalculation.
      - If the user intended a static distortion (e.g., to fix a wobbly line permanently), they can leave it at 0 and then Apply the modifier (see Extension 6a).

4b. **Position value is too high:**

    Scenario: The user cranks the Position slider to the maximum.
    * **Cause:** The lines shake violently, breaking the character's silhouette and making the animation unreadable.
    * **Fix:**

      - Reduce Position immediately.
      - Use the Preview mode (press Z → Wireframe or Solid) to see the underlying geometry if the jitter obscures the view.
      - Reset to a "safe" starting point (usually 0.01–0.05) and increase slowly.

4c. **Noise Scale is set to 0:**

    Scenario: The user leaves Noise Scale at 0.
    * **Cause:** No visible effect occurs, regardless of the Position setting. The user may think the modifier is broken.
    * **Fix:**

      - Increase Noise Scale to at least 1.0.
      - Explain that Scale controls the frequency of the noise; 0 means "no noise pattern."

5a. **The effect looks "digital" or "stepped" instead of organic:**

    Scenario: The jitter appears to jump between discrete values rather than flowing smoothly.
    * **Cause:** The Random seed is changing too abruptly, or the Noise Scale is too low relative to the frame rate.
    * **Fix:**

      - Increase Noise Scale to smooth out the displacement pattern.
      - Ensure Random is set to 1. If set to a higher number (e.g., 4), the effect will "step" every 4 frames.

6a. **User wants to bake the effect (Make it Permanent):**

    Scenario: The user is satisfied with the jitter and wants to save the file without the modifier overhead, or needs to export to a format that doesn't support modifiers.
    Action:

      - Click the dropdown arrow on the Randomize modifier header.
      - Select Apply.

    Consequence: The modifier is removed, and the stroke geometry is permanently altered. The original "clean" strokes are lost.
    Pre-requisite: The user should have saved a backup version of the .blend file before this step.

6b. **User wants to remove the effect entirely:**

    Scenario: The user decides the jitter is too much or unwanted.
    Action:

      - Click the Monitor Icon (⊘) next to the modifier to disable it temporarily.

      OR

      - Click the Minus Icon (-) to delete the modifier.

    Result: The strokes return to their original, clean state (non-destructive recovery).

7a. **Performance lag during playback:**

    Scenario: The viewport becomes sluggish when playing the animation with the Randomize modifier active.
    * **Cause:** High-resolution strokes combined with complex noise calculations on every frame.
    * **Fix:**

      - Reduce Noise Scale or Position slightly.
      - Simplify the strokes first (using the Simplify Stroke operator) before adding the modifier (see Simplify Stroke use case).
      - Toggle Overlays off (Alt+Z or the overlay button) to improve viewport FPS.


--------------------------------------------------------------------------------

.. _uc-optimize-strokes:

Optimize Strokes (Reduce File Size)
-----------------------------------

**Goal:** The animator wants to reduce the file size of a heavy animation by removing unnecessary vertices.

**Precondition:** A heavy animation file is open.

Steps
~~~~~

1. **Enter Edit Mode**

   - Animator enters **Edit Mode** (Ctrl+Tab) and selects all strokes (A).

   *System Response:* All vertices are selected.

2. **Run Adaptive**

   - Animator presses **F3** and searches for **"Adaptive"**.

   *System Response:* The "Simplify Stroke" dialog appears.

3. **Set Threshold**

   - Animator sets the value to **0.001** (or 0.0001) and presses Enter.

   *System Response:* Tool removes redundant vertices while preserving the shape.

**Result:** The file size is reduced significantly, and the animation plays smoother.

.. admonition:: Fred's Tip

   You can do this on **Multi-Frame** editing. Select all frames in the timeline, then run Adaptive. It cleans up the whole animation in one go.

1a. **The "Adaptive" tool is not found in F3 search.**

    *   **Cause:** You are not in **Edit Mode**. The Adaptive tool only appears in Edit Mode.
    *   **Fix:** Press **Ctrl+Tab** to enter **Edit Mode**, select all strokes (**A**), then press **F3** and search again.

3a. **The lines look jagged or lose their shape after simplification.**

    *   **Cause:** The threshold value is too high (e.g., 0.1 instead of 0.001).
    *   **Fix:** Undo (**Ctrl+Z**) and try a smaller value. Adjust incrementally.

3b. **The operation takes too long or freezes Blender.**

    *   **Cause:** You are trying to optimize thousands of frames at once without **Multi-Frame Editing** enabled.
    *   **Fix:** Enable **Multi-Frame Editing** in the Dope Sheet header, select all frames, then run Adaptive. Alternatively, process frames in smaller batches.

.. warning::

   Simplification is **destructive**. It permanently removes vertices from your
   strokes. Press ``Ctrl+Z`` immediately to undo if you don't like the result.
   Once you save or clear the undo history, the original detail is gone.

--------------------------------------------------------------------------------

.. _uc-change-material:

Global Color Change via Materials
---------------------------------

**Goal:** The animator wants to change the color of a character's jacket from Green to Red across *all* 300 frames instantly.

**Precondition:** The character uses a specific Material Slot (e.g., "Jacket_Green") for the fill.

Steps
~~~~~

1. **Open Materials**

   - Animator opens the **Material Properties** tab for the Grease Pencil object.

   *System Response:* The list of material slots appears.

2. **Change Color**

   - Animator finds the "Jacket_Green" slot and changes the **Base Color** to Red.

   *System Response:* **All** strokes in the entire animation that use this material slot instantly update to Red.

3. **Verify Animation**

   - Animator plays the animation.

   *System Response:* The jacket is red in every frame.

.. admonition:: Fred's Tip

   This is the biggest advantage of Grease Pencil. Unlike Photoshop where you have to repaint every frame, here you just change the **Material**. If you need a unique color for one frame, you must create a **Unique Copy** of the material (click the 'New' button with the arrow) and assign it to that specific frame.

1a. **The material slot is missing entirely.**

    *   **Cause:** The material was deleted or the slot was never created.
    *   **Fix:** Go to **Material Properties**, click **+** to add a new material slot, and assign the correct material to it.

2a. **Changing the color updates EVERY frame unexpectedly.**

    *   **Cause:** You are editing a **Shared Material** slot. This is expected behavior — material slots are shared across all keyframes by default.
    *   **Fix:** If you need a unique color for one frame only, click the **"New"** button (shield icon) next to the material name to create a **Unique Copy** before changing the color.

2b. **The color change does not appear on screen.**

    *   **Cause:** You are in **Solid View** mode, which sometimes caches colors and does not reflect material changes.
    *   **Fix:** Press **Z** and switch to **Rendered** or **Material Preview** mode to see the update.


--------------------------------------------------------------------------------

.. _uc-sculpt-shape:

Sculpt Mode for Shape Adjustment
--------------------------------

**Goal:** The animator wants to push/pull the shape of a line without redrawing it.

**Precondition:** A Fred-prepared scene is open.

Steps
~~~~~

1. **Activate Sculpt**

   Animator clicks **BOTH** button.

   *System Response:*

   - Tool briefly switches Blender to **Sculpt Mode** (`SCULPT_GPENCIL`).

   - Tool sets the active brush to **"Push"**.

   - Tool ensures the corresponding layer is active/unlocked.

2. **Modify Geometry**

   Animator uses the brush to push/pull lines (butter-knifing).

   *System Response:* The geometry deforms in real-time.

3. **Return to drawing**

   Animator clicks **LINES** or **FILLS** again to return to drawing.

   *System Response:*

   - Tool switches back to **Draw Mode** (`PAINT_GPENCIL`).

   - Tool resets the brush to "Ink Pen".

.. admonition:: Fred's Tip

   Sculpt mode is great for fixing proportions. But remember, when drawing projecting from camera, you might want to **Reproject Strokes** (F3 -> Reproject -> View) to flatten it back to 2D to prevent unexpected results.

1a. **The brush does nothing or moves the whole object instead of the stroke.**

    *   **Cause:** You are in **Object Mode** or the wrong brush is selected.
    *   **Fix:** Ensure you are in **Sculpt Mode** (Ctrl+Tab). Check the toolbar to ensure the **Push** or **Grab** brush is active, not the **Move** tool for objects.

1b. **The tool switches back to Draw Mode immediately after clicking "BOTH".**

    *   **Cause:** The Violence Tool button is designed to toggle modes. Double-clicking or an interface glitch may cause a rapid toggle.
    *   **Fix:** Click the "BOTH" button once, deliberately. If the issue persists, manually switch to Sculpt Mode via **Ctrl+Tab** → **Sculpt Mode**, and let the maintainers know.

3a. **The strokes look distorted after returning to Draw Mode.**

    *   **Cause:** The strokes were sculpted in 3D space and now have incorrect depth relative to the camera.
    *   **Fix:** In **Edit Mode**, select all (**A**), press **F3**, search for **Reproject Strokes**, and choose **Project from View**. This flattens the art back to the camera plane.

--------------------------------------------------------------------------------

.. _uc-fill-shapes:

Fill Shapes with Correct Materials
----------------------------------

**Goal:** The animator wants to fill a closed shape with a specific color.

**Precondition:** A closed loop of strokes exists on the "Lines" layer.

Steps
~~~~~

1. **Activate Fill**

   Animator clicks the **FILL** button.

   *System Response:*

   - Tool switches to **Fill Tool**.

   - Tool activates the "Fill" layer.

   - Tool selects the "Skin" material.

2. **Click to Fill**

   Animator clicks inside the closed loop.

   *System Response:* The shape fills with the "Skin" color.

3. **Handle Holes (If applicable)**

   *If the shape has a hole (e.g., an ear):*

   - Animator creates a **new material** with the *background* color.

   - Animator fills the hole area with this new material.

   *System Response:* The hole appears "cut out" correctly.


.. admonition:: Fred's Tip

   If the fill tool says 'Unable to fill', your loop isn't closed. Go to **Edit Mode**, select the gap, and join the vertices (J) or close the gap manually.

1a. **The fill appears on the wrong layer (e.g., on top of the lines instead of behind them).**

    *   **Cause:** The "Fill" layer is not active, or the layer order is incorrect.
    *   **Fix:** In the Grease Pencil properties (green icon), click the **Fill** layer to make it active (green highlight) before using the Fill tool. Ensure the Fill layer is **below** the Lines layer in the stack.

.. warning::

   This is unlikely in a AFIS project, let Fred know if this happens.

2a. **"Unable to Fill" error message appears.**

    *   **Cause:** The shape is not a closed loop — there is a gap in the strokes.
    *   **Fix:** Go to **Edit Mode**, zoom in, and find the gap. Join the vertices (**J**) or draw a line to close it.

.. admonition:: Fred's Tip

   There is also a joining toggle hotkey that will automatically close overlapping lines as you draw. See :doc:`keybindings`.

2b. **The fill doesn't create a "donut" (fills the hole instead of leaving it empty).**

    *   **Cause:** Grease Pencil cannot fill a shape with an invisible hole directly.
    *   **Fix:** Fill the outer shape first. Then, create a **new material** with the background color and use the Fill tool to "punch out" the hole with that color.

TODO #34 #33 What happens if the hole is over two or more colours?