.. _troubleshooting:

Troubleshooting & Known Issues
==============================

Quick Reference Table
---------------------

+----------------------------+-------------------------------------------+
| **Symptom**                | **Section**                               |
+============================+===========================================+
| Keybinds not working       | :ref:`trouble-keymaps`                    |
+----------------------------+-------------------------------------------+
| Fills not working          | :ref:`trouble-fills`                      |
+----------------------------+-------------------------------------------+
| Toggles get stuck          | :ref:`trouble-modal-toggles`              |
+----------------------------+-------------------------------------------+
| Tool doesn't activate      | :ref:`trouble-installation`               |
+----------------------------+-------------------------------------------+
| Performance issues         | :ref:`trouble-performance`                |
+----------------------------+-------------------------------------------+
| Layer reordering broken    | :ref:`known-issue-page-down`              |
+----------------------------+-------------------------------------------+

.. _trouble-keymaps:

Keybinds & Shortcuts Not Working
--------------------------------

**My layer-switching keybinds (Shift/Ctrl/Alt + Numbers) aren't firing**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- **Cause:** Keymaps weren't saved, or were corrupted on reload.

**Fix:**

   1. Go to **Edit → Preferences → Keymaps**.
   2. Search by key binding (type ``Ctrl+1``, for example).
   3. Delete any broken entries.
   4. Re-import the keymap file.
   5. **Save preferences** before closing Blender.

.. admonition:: Critical

   If you change keymaps and close Blender without **saving preferences** in the preferences menu, all changes are lost.

**Camera view framing or centre timeline doesn't work when I try to use the ~/` key.**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- **Cause:** Your keyboard layout differs from US, OR another OS/Blender binding intercepts it.

**Fix:**

   1. Go to **Edit → Preferences → Keymaps**.
   2. Search for "View 3D Frame".
   3. Change the binding from tilde/accent-key (`` ` `` ) to another key.
   4. If the problem persists, check your **desktop environment** (Ubuntu Studio KDE, etc.) for system-level conflicting shortcuts.

.. note::

   Ubuntu Studio users specifically reported Alt+Accent/Tilde conflicts with default desktop environment shortcuts. Disable those in your OS settings.

**My Ctrl+Number keys work but switch to WRONG layers**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- **Cause:** Keymap properties defaulted all ``layer_filter`` values to ``01L`` on load.

**Symptom:** Pressing Ctrl+1, Ctrl+2, Ctrl+3, Ctrl+4 all activate Layer 1.

**Fix:**

   1. Go to **Edit → Preferences → Keymap**
   2. Select a different keymap
   3. Switch back to the correct keymap, to get it to register now that the plugin has loaded in fully.

This is a known Blender startup bug where StringProperty values fail to resolve before addon operators register.

**Keybinds stop working after restarting Blender**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- **Cause:** Multiple possibilities:

   * Keymaps weren't saved to preferences
   * Addon wasn't re-enabled
   * Timer didn't initialize
   * GP object isn't selected

**Fix:**

   1. Verify preferences are saved
   2. Check addon is enabled (Edit → Preferences → Add-ons)
   3. Open Text Editor and run the script (Play button)
   4. Select your Grease Pencil object
   5. Test keybinds again

See :ref:`trouble-installation` for addon activation issues.

**"3" Key Doesn't Open Layer Menu**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- **Cause:** The binding may not exist in your keymap version
- **Symptom:** Pressing "3" does nothing or opens wrong menu
- **Fix:** Manually bind ``gpencil.layer_set_active`` to "3", or use Layers panel directly

**Viewport Navigation Broken (Can't Zoom or Pan)**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- **Cause:** Fred's personal keymap overrides default Blender navigation keys.
  If you switch between Fred's and Rex's keymaps (or back to default), some
  bindings don't reset properly.

**Affected Bindings:**

+-----------------------+-----------------------+-----------------------+
| **Function**          | **Default Blender**   | **Fred's Override**   |
+=======================+=======================+=======================+
| Zoom                  | ``Ctrl + MMB``        | ``Ctrl+Shift+LMB``    |
+-----------------------+-----------------------+-----------------------+
| Pan                   | ``Shift + MMB``       | ``Spacebar`` or       |
|                       |                       | ``Spacebar+LMB``      |
+-----------------------+-----------------------+-----------------------+

**Fix:**

   1. Go to **Edit → Preferences → Keymap**.
   2. Search for ``view3d.zoom`` — find any entry bound to
      ``Ctrl+Shift+Left Mouse`` and change it to ``Ctrl+Middle Mouse``.
   3. Search for ``view3d.move`` — find any entry bound to ``Spacebar``
      or ``Spacebar+Left Mouse`` and change it to ``Shift+Middle Mouse``.
   4. **Save preferences.**

.. admonition:: Fred's Tip

   "Anything zoom-related that is bound to Ctrl+Shift+Left
   Mouse (in the 'Fred' keybind set) needs to go back to Ctrl+Middle Mouse. Anything view.pan related
   that is bound to Spacebar or Spacebar+Left Mouse should go back to
   Shift+Middle Mouse."

   This mainly affects users who imported Fred's personal keymap instead
   of Rex's. If you're using Rex's keymap (recommended), this shouldn't
   be an issue.

See :ref:`quick-menu-keys` for details.

---

.. _trouble-modal-toggles:

Modal Toggles Getting "Stuck" (Auto-Merge, Draw Behind, Sculpt)
---------------------------------------------------------------

**Symptom:** Auto-merge, draw-behind, or sculpt mode stays enabled even after releasing the key (``A``, ``B``, or ``Alt``).

**Cause:** Blender does not register key press/release events while a stroke is actively being drawn. If you release the toggle key mid-stroke, the event is missed and the toggle hangs.

**Fix:**

   1. Lift your pen off the tablet (complete the stroke).
   2. Tap the stuck toggle key once.
   3. Resume drawing.

**Prevention:**

   * Always press the toggle key **BEFORE** starting a stroke.
   * Always release the toggle key **AFTER** lifting your pen.
   * Never press or release any modal toggle key while a stroke is in progress.

.. admonition:: Fred's Tip

   "If you forget whether a toggle is on or off, tap it once. Don't waste time checking the toolbar icon — that wastes more time than tapping."

See also: :ref:`known-issue-timer-addon` (timer issues can cause stroke-mode auto-switching to fail).

**Why doesn't this affect the C key?**

The ``C`` key is a tool swap (via ``wm.tool_set_by_id``), not a boolean toggle. It doesn't have a press/release pair — holding it just keeps the Trim tool active, releasing it returns to the Brush tool.

---

.. _trouble-fills:

Fills Not Working ("Unable to Fill")
------------------------------------

**The fill tool says "Unable to fill unclosed areas"**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- **Cause:** Strokes don't fully enclose the area, even if they look closed visually.

**Fixes:**

   1. **Increase Gap Closure:** On the Fill tool options, set **Gap Closure** to **5-10** for large gaps, **1-4** for small gaps.
   2. **Enable Visual Aids:** Check "Visual Aids" on the Fill tool to get drag handles that extend stroke endpoints.
   3. **Manual Connection:** In Edit Mode, use **C** to connect unconnected strokes.
   4. **Zoom Out:** If zoomed in very far, the fill tool may fail due to screen-based detection. Zoom out and try again.

.. admonition:: Fred's Tip

   "If your lines look closed and you're like, 'what the fuck?' pick something small like one or two for gap closure."

.. warning::

   **Don't rely on very small gap values forever.** Build muscle memory to **cross strokes over at least halfway** when drawing outlines. This prevents gaps from forming in the first place.

**Fill tool ignores my strokes (seems to fail consistently)**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- **Cause:** "Ignore Transparency" checkbox is disabled.

**Fix:** Under Fill tool → **Advanced**, enable the **"Ignore Transparency"** checkbox.

**Fills look strange**
~~~~~~~~~~~~~~~~~~~~~~

- **Cause:** You filled the same area twice without noticing the first fill.

**Fix:**

   1. Press **Tab** to enter Edit Mode.
   2. **Lasso select** the duplicate fill strokes.
   3. Press **Ctrl+X** to delete all connected strokes/fills of the selection.

See also: :ref:`known-issue-fill-zoom-bug` (zoom-dependent fill failures).

---

.. _trouble-installation:

Installation & Script Activation
--------------------------------

**The tool doesn't activate when installed as an addon**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- **Cause:** The background timer (`_my_stroke_check_material`) does not start automatically when the script is installed as an addon.

**Symptoms:**

   * Layer switching works.
   * Material auto-switching (Stroke/Fill/Both mode based on material name) **does not work**.

**Fix (Current Workaround):**

   1. Open the **Text Editor** in Blender.
   2. Load the script file.
   3. Click the **Play/Run** button to manually start the timer.

.. warning::

   This is a known bug. Fred plans to fix this in v2.1. Until then, you must run the script manually after loading any .blend file.

See also: :ref:`trouble-keymaps` (if keymaps reset, you may need to reload them too).

**The "Fred" tab doesn't appear in the sidebar**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- **Cause:** Script wasn't run, or addon failed to load. **CURRENTLY UNIMPLEMENTED**

**Fix:**

   1. Check the **System Console** (`Window → Toggle System Console`) for error messages.
   2. Verify you're running **Blender 5.1 or 5.2 LTS** (the tool uses GP3 APIs).
   3. Run the script manually via the Text Editor if using addon installation.

**Errors appear in the console after running the script**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- **(Likely) Cause:** Version incompatibility or missing dependencies.

**Fix:**

   1. Ensure you're running **Blender 5.1 or 5.2 LTS**
   2. Check System Console (Window → Toggle System Console) for exact errors
   3. Verify all four brushes (MY STROKE, ERASE STROKE, ERASE POINT, MY FILL) exist
   4. Ensure GP object uses correct layer/material structure

**Addon installed but nothing happens when I press keys**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- **Cause:** GP object not selected.

**Fix:** Select your Grease Pencil object in the Outliner or 3D Viewport before testing keybinds.

**I'm in a blank file and the tool doesn't do anything.**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. important::

   The Violence Layer Manager is designed for a specific Grease Pencil
   workflow. It will **not work** with arbitrary GP objects.

   This Grease Pencil Object must have:

   1. **Multi-layer format** — Layers named and organized according to the Violence Tool convention (Body, Head, Eyes, Mouth, etc.)

   2. **Material slot setup** — The ``1234/QWER/ASDF`` material slot configuration

   3. **Blender 5.2 LTS or 5.1** — The add-on now uses GPencil conventions introduced in Blender 4.3 and finalized in 5.0+.

**If your object doesn't match this format:**

   - The layer switching operators will fail (silently, as of now)
   - The panel buttons won't select the correct layers, or possibly any
   - You may see errors in the Blender console, or, it could fail silently depending on the issue.
   - If you're getting trouble like this on one of Fred's files, report it right away in the GreasePencil channel.


**Multi-Layer Format**

The Violence Tool expects Grease Pencil objects in Fred's multi-layer structure:

   * Each body part has **Line** and **Fill** layers paired
   * Names follow pattern: ``XXL`` (Line) and ``XXF`` (Fill)
   * Layers are unlocked individually when switched to

Example Outliner structure:

::

   GreasePencil
     ├── 01L Body Lines
     ├── 01F Body Fills
     ├── 02L Head Lines
     ├── 02F Head Fills
     ├── 03L Eye Lines
     ├── 03F Eye Fills
     └── ...

If your scene doesn't follow this, the keybinds won't find the right layers.

**Required Brushes (must exist in your blend file)**

The tool relies on four brushes that must be present in your scene:

| Brush Name | Purpose |
|------------|---------|
| ``MY STROKE`` | Primary drawing brush |
| ``ERASE STROKE`` | Full-stroke eraser |
| ``ERASE POINT`` | Pixel-style eraser |
| ``MY FILL`` | Fill bucket brush |

If these don't exist in your project, download the **Practice File (v2.0)** which includes them pre-configured.

**Material Naming Convention**

Your Grease Pencil object must have material slots following this pattern:

| Slot | Naming Pattern | Example |
|------|---------------|---------|
| Line materials | ``{number} {letter} LINE`` | ``1 I LINE`` |
| Fill materials | ``{number} {letter} FILL`` | ``1 A FILL`` |
| Shadow layer | ``Shadow`` | ``Shadow`` |
| Highlight layer | ``Highlight`` | ``Highlight`` |
| Black fill | ``BLACK FILL`` | ``BLACK FILL`` |

The tool uses substring matching on material names to determine stroke type:

* **``LINE``** in name → Stroke-only mode
* **``FILLONLY``** in name → Fill-only mode
* **Neither** → Both stroke and fill

**How to Fix Misnamed Layers**

   1. In the Outliner, right-click each layer
   2. Rename to match the pattern (e.g., ``01L Body``)
   3. Re-import the keymap if layer filters were hardcoded

.. admonition:: Fred's Tip

   "The layer_filter is a 'substring' match, not an exact match. As long as your layer name
   *contains* the filter string somewhere, the operator will find it. For example, a filter of
   ``01L`` will match ``01L Body Lines``, ``Layer 01L``, or anything containing ``01L``."

**Material Slot Order**

The material slots must be arranged in the Property Panel in this order:

1. ``1 I LINE`` — Body Line
2. ``1 A FILL`` — Body Fill
3. ``2 I LINE`` — Head Line
4. ``2 A FILL`` — Head Fill
5. (continue pattern...)
6. ``BLACK FILL`` — Secondary color (for pupils, noses, goatees)
7. ``SHADOW`` — Shadow layer material
8. ``HIGHLIGHT`` — Highlight layer material

Material order affects the material popup behavior when switching layers.

---

.. _trouble-performance:

Performance & File Size
-----------------------

**Blender is slowing down progressively**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- **Cause:** Invisible fills (alpha=0% colors) still render and accumulate performance cost in GP3.

**Fix:** Use materials with **"LINE"** in the name for stroke-only data. Do NOT use alpha transparency to hide fills.

**My .blend file is huge (>100MB)**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- **Cause:** Excessive vertex count (vertex bloat), especially with pressure sensitivity.

**Fix:**

   1. Select all strokes (or enable Multi-Frame Editing).
   2. Press **F3** and search for **"Adaptive"**.
   3. Set threshold (start with ``0.001``).
   4. Reduces vertex count with minimal visual impact.

**Art looks distorted after rotating the camera**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- **Cause:** Strokes were projected from camera to origin point.

**Fix:** Flatten art using **Reproject Strokes**:

   1. Go to Edit Mode (**Tab**).
   2. Select all strokes (**A**).
   3. Press **F3**, search for **"Reproject Strokes"**.
   4. Choose **"Project from View"**.

---

.. _trouble-layer-ordering:

Layer Management Issues
-----------------------

**Page Down doesn't reorder multiple selected layers**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- **Cause:** Bug in Blender 5.1 — Page Down only moves one layer at a time, even with multi-select.

**Fix (Workaround):**

   * Move layers down one at a time.
   * Or use the arrow buttons in the layer panel.

.. admonition:: Known Bug

   Page Up works normally. Fred has flagged this to the Blender team and they responded postiively.
   Plans to Possibly write a script workaround. May be fixed in 5.2. TODO regression test PgDn in 5.2.

**Layers switch but nothing appears**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- **Cause:** Target layer is hidden (eye icon off) or locked.

**Fix:** Check the **Outliner** — ensure the layer is both visible AND unlocked.

.. warning::

   The tool does NOT automatically toggle Outliner visibility. Hidden layers are skipped even if unlocked.

See also: :ref:`trouble-keymaps` (incorrect filter values cause wrong layers to activate).

---

.. _known-issues:

Known Issues for v2.0 (and Blender 5.1.2)
-----------------------------------------

The following are confirmed limitations and bugs. Some are being fixed upstream
by the Blender development team for the 5.2 release.

.. _known-issue-timer-addon:

**Timer Doesn't Initialize in Addon Mode**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The material-name-based auto-switching timer (`_my_stroke_check_material`) does not start
when the script is installed as an addon. This disables automatic stroke-mode switching
between Stroke/Fill/Both based on material name.

**Workaround:** Run the script manually from the Text Editor after opening any .blend file.

**Status:** Known bug. Fred plans to fix in v2.1.

.. _known-issue-cyclic-stroke:

**Strokes Default to Cyclic When Using "Both" Mode (Blender 5.2)**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In Blender 5.2, strokes drawn with "Both" stroke mode default to **cyclic state**, creating
closed loops unintentionally. There is no user setting to disable this behavior, forcing
manual intervention in Edit Mode to toggle cyclic state off.

**Steps to Reproduce:**

   1. Set stroke mode to "Both" (via material name).
   2. Draw a stroke.
   3. Observe that the stroke closes automatically.
   4. To fix: Go to Edit Mode → select the stroke → press **F3** → search **"Toggle Cyclic"**.

**Status:** Confirmed by Blender team (may be related to issue #157190).

**Workaround:**

   * Manually toggle cyclic off after each "Both" mode stroke.
   * Fred recommends using **Stroke-only** or **Fill-only** materials where possible to avoid this issue entirely.

.. admonition:: Developer Note

   This is a regression from 5.1.2 → 5.2. Fred has reported it and the Blender team confirmed
   a fix is incoming.

.. _known-issue-page-down:

**Page Down Not Reordering Multiple Selected Layers**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Multi-selected Grease Pencil layers cannot be moved down together using Page Down. The undo
dialog appears but no movement occurs. Page Up works normally for multi-select.

**Affects:** Both Timeline and Dope Sheet views.

**Status:** Confirmed by Blender team (YimingWu). Fix incoming for 5.2.

**Workaround:**

   * Move layers down one at a time.
   * Use the arrow buttons in the layer panel instead of Page Up/Page Down.

.. _known-issue-fill-zoom-bug:

**Fill Tool Fails When Zoomed In Too Far (Screen-Based Detection)**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The Fill tool's gap detection is partially screen-based. At high zoom levels, "unable to fill"
errors occur even when strokes are closed.

**Workaround:** Zoom out to 50-70% of the viewport before attempting fills.

**Status:** Unknown. Fred plans to report to Blender if not resolved in 5.2.

.. _known-issue-no-smooth-auto:

**Alt+F Doesn't Auto-Smooth Connections (GP3 Regression)**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In GP3 (Blender 4.3+), connecting strokes with **C** no longer auto-smooths the join.
Additionally, the joined strokes don't stay selected after connecting, unlike Blender 4.1.1.

**Workaround:**

   1. Press **C** to connect the strokes.
   2. Re-select the joined area (since 5.x deselects after connecting).
   3. Press **Alt+F** repeatedly (a few times) to smooth manually.

**Status:** Unknown regression. No official fix timeline.

---

Reporting New Issues
--------------------

If you encounter a problem not listed here:

1. Check the **Blender System Console** (`Window → Toggle System Console`) for error messages.
2. Note the **exact steps** that led to the issue.
3. Report on `GitHub Issues <https://github.com/Danweel/ProjectViolenceDocs/issues>`_ with:

   * Blender version
   * Problem description
   * Steps to reproduce
   * Any console error messages
   * Whether it's reproducible in the practice file

You can also DM or @ Danweel directly on the AFIS sever. Can be faster!

Appendix: Blender-Side Bug Summary
----------------------------------

These are bugs in Blender itself, not the Violence Tool. All reported to the Blender team.

+----------------------------------------+----------------------------------+------------------+
| **Bug**                                | **Blender Version**              | **Fix Expected** |
+========================================+==================================+==================+
| Cyclic stroke bug (#157190)            | 5.2                              | 5.2 patch        |
+----------------------------------------+----------------------------------+------------------+
| Page Down multi-select failure         | 5.1, 5.2                         | 5.2 patch        |
+----------------------------------------+----------------------------------+------------------+
| Fill zoom detection (screen-space)     | All                              | Unknown          |
+----------------------------------------+----------------------------------+------------------+
| Alt+F auto-smooth regression           | 4.3+, 5.1, 5.2                   | Unknown          |
+----------------------------------------+----------------------------------+------------------+