.. _tests:

Tests written for weakspots and fixes
=====================================

OLD, NEEDS REVISION for 2.0

Needs:
   - Lots of stuff removed
   - Rewrite tests for current functionality

`fred.op15` - (BOTH button)
---------------------------

Button that changes active layer, unlocks layer, locks other layers, brush changes to Draw and Material switches to 1 I Line.

**Preparation:**
    - Open your Fred-prepared scene (with the Fox rig).
    - Ensure you are in Object Mode with the Grease Pencil object selected.
    - Open the System Console (Window > Toggle System Console) to see any error popups.
    - Keep the Outliner visible so you can see layer visibility (Eye icon) and Lock status.

Regular functionality
~~~~~~~~~~~~~~~~~~~~~

Revision 5.0: **Passes**

**Goal:** Verify the operator works when layers are already visible.

    **Setup:**
        - Ensure Mouth Lines, Mouth Mask, Teeth, and Head layers are Visible (Eye On) and Unlocked.

    **Action:**
        - Run `fred.op15`.

    **Expected Result:**
        - Layers remain Visible and Unlocked.
        - Active Layer switches to Mouth Lines.
        - Brush switches to Draw.
        - Material switches to 1 I LINE.

    **Conclusion:**
        - The operator works correctly when visibility is already set.


If layers were invisible when BOTH is selected, layers do not become visible
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Revision 5.0: **Fails**

**Goal:** Verify that `fred.op15` currently fails to make hidden layers visible.

    **Setup:**
        - In the Outliner, find the Mouth Lines layer ([MOUTH] Lines).
        - Click the Eye icon to hide it (make it invisible).
        - Ensure the layer is Unlocked (padlock open).
        - Ensure Head Lines is also Hidden.

    **Action:**
        - Click the "BOTH" button for Mouth (or press your bound key for fred.op15).

    **Expected Result (BUG):**
        - The operator runs (no error message).
        - The Lock icon in the Outliner changes to Unlocked.
        - BUT: The Eye icon remains Off (Hidden).
        - Viewport: You see nothing (no strokes, no layer active).

    **Conclusion:**
        - The code unlocks layer but does not unhide it.

Locked & Hidden
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Revision 5.0: **Fails**

**Goal:** Verify behavior when layers are both locked and hidden.

    **Setup:**
        - In the Outliner, find Mouth Mask ([MOUTH] Mask).
        - Lock it (Padlock Closed).
        - Hide it (Eye Off).

    **Action:**
        - Run `fred.op15`.

    **Expected Result (BUG):**
        - The Lock icon becomes Unlocked.
        - The Eye icon remains Off.
        - Viewport: Still invisible.

    **Conclusion:**
        - The bug persists even if the layer was locked.

The "Missing Tag" Scenario (Safety Check)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Revision 5.0: **Known Issue**

**Goal:** Verify the code handles missing layers gracefully (if you add the safety check later).

    **Setup:**
        - In the Outliner, rename the Mouth Lines layer to something that does not contain ML (e.g., "Custom Mouth").
        - Ensure other layers are visible.

    **Action:**
        - Run `fred.op15`.

    **Expected Result (Current Code):**
        - Crash/Error: The code tries to access blorp (which is still "[MOUTH] Lines") but the layer name is different.
        - Console: KeyError: '[MOUTH] Lines' or similar.

    **Conclusion:**
        - The current code is fragile and will crash if layer names are slightly off.

    **Workaround:**
        - Leave all layers named the way they are. Scenes are already set up so this is not an issue on AFIS.

Undo Verification
~~~~~~~~~~~~~~~~~

Revision 5.0: **Weak Area**

**Goal:** Verify the undo message is correct.

    **Setup:**
        - Ensure 'Mouth Lines' is Visible.

    **Action:**
        - Run `fred.op15`.
        - Immediately press `Ctrl+Z`.

    **Expected Result:**
        - The Undo Stack message should say something like "Unlock Mouth + Head" or "[MOUTH] Lines".
        - Current Code: Likely says "[MOUTH] Lines" (because `blorp` is used in `undo_push`).

    **Conclusion:**
        - The undo message is dynamic but depends on the `blorp` variable.
        - Blorp is not descriptive so this is a weakspot message & code-reading-wise.
