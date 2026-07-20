.. _troubleshooting:

Troubleshooting & Known Issues
==============================

This page documents current limitations, common problems, and workarounds
for The Violence Tool 2.0.

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

- **Cause:** The active material is set to "Fill" only mode, or the brush stroke mode doesn't match the material type.

**Fix:**

       1. Check the material name in the Material Properties (Red Ball icon).
       2. If it contains **"LINE"**, the tool should automatically set stroke-only mode.
       3. If it contains **"FILLONLY"**, the tool will set fill-only mode.
       4. For all other materials, both modes are enabled by default.
       5. If strokes still appear invisible, ensure you're drawing on the correct layer
          (visible Eye icon in the Outliner).

.. note::

   In Grease Pencil 3, per-material stroke/fill toggles were removed. The Violence Tool
   uses a background timer to detect material name changes and automatically adjust
   the brush stroke mode. Do not attempt to use alpha=0% fills as a workaround —
   invisible fills still render and will degrade performance over time.

**The fill tool says "Unable to Fill".**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- **Cause:** The area is not a closed loop, or you are trying to fill a "donut" (shape with a hole).

**Fixes:**

       - Zoom in and check for tiny gaps in your lines. Close them in **Edit Mode**.
       - **For Holes (Donuts):** Grease Pencil cannot fill a hole directly.
            1. Fill the outer shape with your main color.
            2. Create a **new material** with the *background* color (e.g., White).
            3. Use the Fill tool with the new material to "punch out" the hole.


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

.. _trouble-automerge-stuck:

Automerge Toggle Gets "Stuck" Enabled or Disabled
--------------------------------------------------

**Symptom:** Automerge stays on (or off) even after you release the ``A`` key. The toggle seems frozen.

**Cause:** Blender does not register key press/release events while a stroke is actively being drawn. If you press or release ``A`` mid-stroke, the event is missed and the toggle hangs.

**Fix:**

   1. Lift your pen off the tablet (stop drawing)
   2. Tap ``A`` once to reset the toggle state
   3. Resume drawing

**Prevention:**

   * Always hold ``A`` **before** starting a stroke
   * Always release ``A`` **after** lifting your pen from the tablet
   * Never press or release any modal toggle key while a stroke is in progress

.. note::

   This applies to all hold-to-activate keys in The Violence Tool, including
   ``Alt`` (sculpt mode) and ``A`` (automerge). The same Blender limitation
   affects both.

-----------------------------------------------------------------------------------

Materials & Colors
------------------

**Performance Degradation (Invisible Fills)**

Drawing slows progressively as strokes grow longer.

- **Cause:** Invisible fills (alpha 0% fill color) are still rendered in
  Grease Pencil 3. These invisible shapes accumulate performance cost.

**Fix:**
      Use materials with "LINE" in the name to draw stroke-only
      data. Do not attempt to hide fills via alpha transparency.

.. _trouble-materials:

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

**Tool throws an error when trying to install**

- **Cause:** The script may need to be named "TheViolenceLayerManager.py"

**Fix:** Rename the file manually. If you're keeping track of multiple versions, place them in differently named folders.

Make sure you've uninstalled the previous version.

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

**Fix:** Ensure you are using **Blender 5.1 or 5.2 LTS**. Other versions may have
incompatible API changes.

.. warning::

   The tool uses Grease Pencil 3 APIs introduced in Blender 4.3+ and finalized in 5.x.
   It will not work with Blender 4.1.1 or earlier.

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

Known Issues for v2.0
---------------------

The following are known limitations in the current version.

**Panel UI Not Implemented**

   - The Fred Panel tab in the N-sidebar is not implemented in v2.0.
   - All workflow is driven by keyboard shortcuts instead.

   *Workaround:* Use the keybinds documented in :doc:`keybindings`. Panel UI
   may be added in v2.1.

**Limited Undo Support**

   - Some tool actions (layer switching, modal toggles) use `undo_push()` instead
     of `bl_options = {'REGISTER', 'UNDO'}`, so undo granularity may vary.
   - ``gp.apply_material_and_stroke`` has full undo support.

   *Workaround:* Save frequently before using tool operations. Most operators
   push an undo step anyway, so basic reversal is possible.

**No Error Feedback on Failed Operators**

   - Clicking layer keybinds without a Grease Pencil object selected does nothing
     — no warning or message appears.

   *Workaround:* Always select a Grease Pencil object first. If a keybind fails,
   check the System Console for error messages.

**Hidden Layers Can't Be Edited**

   - Layers hidden in the Outliner (Eye icon off) are skipped by the tool,
     even if unlocked.

   *Workaround:* Make layers visible before attempting to edit them. The tool
   does not automatically toggle Outliner visibility.

**Brush Size May Not Update**

   - Brush size may not reset to the expected default after switching layers,
     especially if manually overridden.

   *Workaround:* Check the Toolbar (left side of 3D Viewport) and adjust
   the Radius slider manually. This is a known GP3 timing issue.

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

