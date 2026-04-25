.. _troubleshooting:

Troubleshooting & Known Issues
==============================

This page documents current limitations, common problems, and workarounds
for The Violence Tool (v1.0).

If you are stuck in the middle of a workflow, check the **Inline Tips** in the :ref:`Use Cases <use-cases>` first (find the workflow you're in, and check where the problem is). If you have a describable problem, you can try
finding your symptom below.

--------------------------------------------------------------------------------

.. _trouble-drawing:

Drawing & Strokes
-----------------

**Nothing happens when I click a layer button.**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- **Cause:** No Grease Pencil object is selected, or you are not in Draw Mode.

**Possible Fixes:**

       - Select the Grease Pencil object in the **Outliner** (top right) if you can't click it in the viewport.
       - Ensure you are in **Draw Mode** (`Ctrl+Tab` → Draw), not Object Mode.
       - If the object is new/empty, draw a test stroke first to make it selectable.

**My strokes are invisible.**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- **Cause:** The "Black Stroke" material slot is missing, unassigned, or the brush is set to "Fill".

**Fix:**

       1. Go to **Material Properties** (Red Ball icon).
       2. Ensure a material named "Black Stroke" exists in a slot.
       3. Click the material, ensure **Stroke** is checked (not Fill), and color is Black.
       4. In the **Tool** tab (N-panel), ensure the brush is set to **Ink Pen**.

**The fill tool says "Unable to Fill".**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- **Cause:** The area is not a closed loop, or you are trying to fill a "donut" (shape with a hole).

**Fixes:**

       - Zoom in and check for tiny gaps in your lines. Close them in **Edit Mode**.
       - **For Holes (Donuts):** Grease Pencil cannot fill a hole directly.
            1. Fill the outer shape with your main color.
            2. Create a **new material** with the *background* color (e.g., White).
            3. Use the Fill tool with the new material to "punch out" the hole.

**Strokes look soft, faded, or blurry.**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- **Cause:** The brush is not set to **Ink Pen** with **Hardness 1.0**.

**Fix:**

       1. Press **N** to open the sidebar.
       2. Go to the **Tool** tab.
       3. Under **Stroke**, change the pencil type to **Ink Pen**.
       4. Set **Hardness** to **1.0**.

**I can't draw on a new Grease Pencil object.**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- **Cause:** Newly created GP objects may have default layers that don't work with the tool.

**Fix:**

       1. Delete all existing layers on the GP object.
       2. Create a new layer manually (click the **+** button in the Grease Pencil properties).
       3. Ensure the new layer is **active** (highlighted green).
       4. Ensure you are in **Draw Mode** (`Ctrl+Tab` → Draw).

**My strokes are drawing on the wrong layer.**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- **Cause:** The layer may be locked, hidden, or the tool didn't switch properly.

**Fix:**

       1. Check the **Outliner** to ensure the target layer is unlocked and visible.
       2. Click the layer button again to force a re-switch.

If the problem persists, manually select the correct layer in the Grease Pencil properties panel (green icon).

--------------------------------------------------------------------------------

.. _trouble-materials:

Materials & Colors
------------------

**Materials look wrong after switching layers.**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- **Cause:** The material slot may not be assigned correctly to the active layer.

**Fix:**

        - Check the **Material Properties** panel to ensure the correct material is assigned to the active slot.

.. note::

   Remember: strokes are assigned to **material slots**, not specific materials.

**I can't make a "donut fill" (a fill with a hole inside it).**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   *   **Cause:** Blender's Grease Pencil fill system does not support fills with invisible holes.
   *   **Fix:** Create a separate **cutout material** (same color as the background) and use it to "punch out" the area you want to be empty. This is a limitation of the Grease Pencil system, not the tool.

**Changing a color changes it on EVERY frame.**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   *   **Cause:** You are editing a **Shared Material** slot. Material slots are shared across all keyframes by default.
   *   **Fix:**

       1. Click the **"New"** button (shield icon or arrow next to the material name) to create a **Unique Copy**.
       2. Change the color of the *unique* copy.
       3. This ensures only the current frame (or selected strokes) are affected.

Be sure to name this layer something clear.

.. warning::

   You'll probably not have to do this on Fred's projects, let him know if you run into a material problem.

--------------------------------------------------------------------------------

.. _trouble-performance:

Performance & File Size
-----------------------

**My .blend file is huge (>100MB) or Blender is slow.**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   *   **Cause:** Grease Pencil strokes can contain an excessive number of vertices (vertex bloat), especially with pressure sensitivity.
   *   **Fix:** Use the **Adaptive Simplify** tool:

       1. Select all strokes (or enable **Multi-Frame Editing** to select across frames).
       2. Press ``F3`` and search for **"Adaptive"**.
       3. Set the threshold (start with ``0.001`` and adjust).
       4. This reduces vertex count with minimal visual impact.

**Blender is running slowly with the tool active.**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   *   **Cause:** Too many visible layers, complex materials, or active modifiers.
   *   **Fix:**

        - Use **Fade Inactive Layers** (`Ctrl` + `F`) to reduce visual clutter.
        - Hide layers you aren't actively editing.
        - Switch to **Solid** view (`Z` → Solid) while drawing, and only use **Rendered** view for previewing.

**My art looks distorted.**
~~~~~~~~~~~~~~~~~~~~~~~~~~~

   *   **Cause:** Strokes were drawn with depth (projected from the camera to the origin point).
   *   **Fix:** Flatten the art using **Reproject Strokes**:

       1. Go to **Edit Mode** (`Tab`).
       2. Select all strokes (`A`).
       3. Press ``F3`` and search for **"Reproject Strokes"**.
       4. Choose **"Project from View"**.
       5. This flattens the drawing to the current camera view while preserving its appearance.

--------------------------------------------------------------------------------

.. _trouble-dope-sheet:

Dope Sheet & Keyframes
----------------------

**I can't see my keyframes in the Dope Sheet.**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- **Cause:** The Dope Sheet is not set to **Grease Pencil** mode.

**Fix:**

    1. Open the Dope Sheet (change a window to **Dope Sheet**).
    2. Click the **Dope Sheet** dropdown menu (top left of the Dope Sheet window).
    3. Change it from "Dope Sheet" to **Grease Pencil**.
    4. Open the **Summary** arrow to see all layers.

**Keyframes disappeared after I deleted strokes.**

- **Cause:** If you delete all strokes on a layer, the keyframe for that layer may also disappear.

**Fix:** Insert a new blank keyframe (`I` → **Insert Blank Keyframe** → **All Layers**) to recreate the keyframe.

**The "Add Keyframes" button doesn't work.**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- **Cause:** This may be related to the Operator #15 issue (inactive operator).

**Fix:** Use Blender's standard keyframe shortcuts instead:

    1. Move to the desired frame on the timeline.
    2. Press ``I`` and choose **Duplicate Active Keyframe** → **All Layers**.
    3. Edit the new frame.

**My keyframes aren't playing back.**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- **Cause:** The playback range may be incorrect, or the Dope Sheet may have "hold" checkboxes enabled.

**Fix:**

    1. Check the **Timeline** start/end frames.
    2. In the Dope Sheet, ensure the **hold checkboxes** (next to each layer) are not freezing the frame.

--------------------------------------------------------------------------------

.. _trouble-installation:

Installation & Setup
--------------------

**The "Fred" tab doesn't appear in the sidebar.**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- **Cause:** The script wasn't run, or failed silently.

**Fix:**

    1. Make sure you clicked the **Play** button in the Text Editor (Method 1) or enabled the add-on in Preferences (Method 2).
    2. Press **N** to open the sidebar and look for the "Fred" tab.

If it still doesn't appear, check the Blender System Console (`Window → Toggle System Console`) for error messages.

**Errors appear in the console after running the script.**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- **Cause:** Blender version incompatibility.

**Fix:** Ensure you are using **Blender 4.1.1**. Other versions may have incompatible API changes.

.. warning::

   The tool uses Grease Pencil APIs introduced in Blender 4.1+.

**The script overwrites my custom changes.**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- **Cause:** Running the script re-executes the entire file from scratch.

**Fix:** Always save a backup of your modified script before running it.

--------------------------------------------------------------------------------

.. _trouble-general-blender:

General Blender Issues
----------------------

These are common Blender issues that you might encounter.

**I can't select the Grease Pencil object in the viewport.**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- **Cause:** Empty GP objects (no strokes drawn) are very hard to click.

**Fix:** Select the object by name in the **Outliner** (top right), or click near the **orange origin dot**.

--------------------------------------------------------------------------------

.. _trouble-known-issues:

Known Issues for v1.0
---------------------

The following are known limitations in the current version. These are being addressed in v2.0.

**Operator #15 ("New/Clear Mouth Frames")**

   - Not functional, not showing in panel.

   *Workaround:* Use standard Blender keyframe shortcuts (`I` → **Duplicate Active Keyframe**).

**Operator #30 ("Hide & Exit")**

   - Not functional, not showing in panel.

   *Workaround:* Manually hide layers in the Outliner instead.

**Limited Undo**

   - Some tool actions cannot be undone with ``Ctrl+Z``.

   *Workaround:* Save frequently before using tool operations.

**No Error Feedback**

   - Clicking buttons without a GP object selected does nothing — no warning or message.

   *Workaround:* Always select a Grease Pencil object first.

**Hidden layers can't be edited**

   - Layers hidden in the Outliner are skipped by the tool.

   *Workaround:* Make layers visible before attempting to edit them.

**Brush size may not update**

   - Brush size may not match expected layer defaults after switching.

   *Workaround:* Check the Toolbar (left side of 3D Viewport) and adjust manually.

--------------------------------------------------------------------------------

Reporting New Issues
--------------------

If you encounter a problem not listed here:

1. Check the **Blender System Console** (`Window → Toggle System Console`) for error messages.
2. Note the **exact steps** that led to the issue.
3. Report the issue on the project's `GitHub Issues <https://github.com/Danweel/ProjectViolenceDocs/issues>`_ page with:

   - Blender version
   - Description of the problem
   - Steps to reproduce
   - Any error messages from the console

.. _future-improvements:

Future Improvements
-------------------

The following issues are (theoretically) planned to be resolved in future versions:

*   **v2.0:** Integrated undo support, user error messages, known issues fixes, developer API.
*   **v3.0:** Character switching, materials setup.