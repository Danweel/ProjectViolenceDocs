.. _usage:

AFIS Workflow Guide
===================

.. note::

   **This guide covers The Violence Tool v2.0 for Blender 5.1.2 and 5.2 LTS.**
   If you're using Blender 4.1.1, see the "Stable" documentation version instead.

Before beginning, download and open the practice files to follow along:

* **Practice File (v2.0)**: [5.1.2]NEW_SCRIPT.blend pinned in the #GreasePencil channel on Discord.
* **Expected size**: ~6 MB | **Format**: .blend

also:

* **REX_keymap_rev1**: A keymap file for starting out. See :doc:`keybindings` for details.

Once opened, verify your setup:

1. Select the Grease Pencil object in the **Outliner**
2. Press ``N`` to open the Sidebar
3. Look for the **"Fred"** tab (note: FRED panel is not yet implemented in v2.0; use keybinds instead)*

If you see layer buttons, the tool is active. For verification, press ``F3`` and search for ``gpencil.draw_mode`` — if it appears, the addon is installed correctly.

.. warning::

    Because the panel isn't implemented yet, check if the script is working by pressing **Shift-1**. This should highlight several lines on-screen.

---

.. _workflow-prerequisites:

Prerequisites: Gap Settings & Visual Aids
-----------------------------------------

Before drawing, configure two critical fill settings to avoid frustration:

**Gap Closure**
~~~~~~~~~~~~~~~

   1. Select the **Bucket Fill** tool
   2. In the **Tool Settings** panel (left side), expand **Advanced**
   3. Find **Gap Closure** (default: 0)
   4. Set to **5** or higher for automatic gap bridging

   *Higher values bridge larger gaps but may "leak" into adjacent areas.*

**Visual Aids**
~~~~~~~~~~~~~~~

   1. In the same **Advanced** section
   2. Enable **Visual Aids**
   3. This shows extension lines when clicking to fill, helping you close shapes

   *If Visual Aids feel too aggressive, disable them and rely on the gap closure slider instead.*

**Cross over existing strokes by 2-3 pixels** while drawing. This creates a physical overlap that guarantees fills work without relying on gap closure.

.. admonition:: Fred's Tip

    Make sure you're always on Dope Sheet, not the Timeline.

---

.. _core-drawing-workflow:

Core Drawing Workflow
---------------------

The v2.0 workflow is built around **keyboard-driven layer switching**. Instead of clicking buttons, you use key combinations to instantly jump between line and fill layers.

**Basic Principle**
~~~~~~~~~~~~~~~~~~~

   * **Shift+[0-9]**: Switch to line layer (e.g., ``Shift+1`` = Layer 1 Lines)
   * **Shift+Alt+[0-9]**: Switch to fill layer (opens material picker)
   * **Ctrl+1-4**: Special face/head layers (Mouth, Mask, Teeth)

.. warning::

   If keybinds don't work after restarting Blender, you likely need to **re-import the keymap**:

   1. Edit → Preferences → Keymap
   2. Delete existing Violence Tool keymap entries
   3. Click **Import**, select ``REX_keymap_rev1.py``
   4. **Save Preferences** (bottom left)

---

.. _drawing-techniques:

Drawing Techniques
------------------

**Stroke Overlap (Critical for Fills)**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

When drawing closed shapes (eyes, body parts, etc.):

   1. Start your stroke slightly **before** the intended endpoint
   2. Continue **past** the starting point by 2-3 pixels
   3. Release

This creates a guaranteed overlap. Even if lines look disconnected at first glance, the fill tool will recognize them as closed.

**Automerge Toggle (Hold-to-Activate)**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The ``A`` key toggles **Auto-Merge**, which snaps new strokes to existing ones at contact points.

   * **Press and hold** ``A`` before starting your stroke
   * **Draw** your shape (vertices will snap on contact)
   * **Release** ``A`` only after lifting your pen/stylus

.. warning::

   **Toggle Hang Warning**: If you release ``A`` *while still drawing*, Blender may not register the release event, leaving you stuck in Auto-Merge mode.

   **Fix**: Lift your pen, then **tap** ``A`` once to reset the toggle state.

.. _fill-workflow:

Fill Workflow
-------------

**Standard Fill (Closed Shapes)**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   1. Switch to fill layer: ``Shift+Alt+[layer number]``
   2. Bucket fill the enclosed area
   3. If fill leaks: Increase **Gap Closure** or redraw with better overlaps

**Fill Zoom Bug Workaround**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Blender 5.2 has a known bug where fill detection varies by zoom level. If fills fail at certain zooms:

   1. **Zoom out** to approximately 50-75% viewport size
   2. Retry the fill
   3. This is a screen-space detection issue; a fix is expected in future Blender updates

.. _special-workflows:

Special Workflows
-----------------

**Pupils & Small Elements**
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Instead of creating separate Line/Fill layers for pupils:

   1. Switch to the **Eye Line Layer**: ``Shift+3`` (Layer 3)
   2. Press ``4`` to open the **Material Menu**
   3. Select **Black Fill Material** (Slot 2)
   4. Draw the pupil as a single circle

   *Result*: One stroke with both stroke and fill data, movable as a single unit.

With this technique, the pupil moves instantly with a single selection.

**Mouth Construction (Complex Anatomy)**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The mouth uses a **four-layer system** for editability during lip-sync:

   * **Ctrl+1**: Mouth Lines (outer muzzle outline)
   * **Ctrl+2**: Mouth Mask (invisible 0-alpha layer)
   * **Ctrl+3**: Upper Teeth
   * **Ctrl+4**: Lower Teeth + Tongue + Throat

**Step-by-Step Mouth Build**:

1. **Draw the muzzle outline**:
   - Press ``Ctrl+1`` (Mouth Lines)
   - Select muzzle material via ``4`` key (or whichever colour suits this part of the face)
   - Draw the top half of the muzzle
   a. **Draw the lower jaw:**
   - Hold ``B`` (Draw Behind) *before* drawing if jaw overlaps other facial elements
   b. **Draw the nose.**
   - You can use the same method as for the pupil for the black nose-shape.

2. **Create the mask**:
   - Draw a **temporary closing line** at the throat opening - just a regular black line is fine
   - Press ``Ctrl+2`` (Mouth Mask)
   - Tap to fill the enclosed area (mask is invisible but functional)
   - Return to ``Ctrl+1``, erase the temporary line with ``E``

3. **Draw the teeth**:
   - Press ``Ctrl+3`` (Upper Teeth)
   - Draw teeth (they only appear through the mask)
   - Press ``Ctrl+4`` (Lower Teeth)
   - Draw lower teeth

4. **Add tongue/throat (optional)**:
   - On ``Ctrl+4``, press ``4`` to change material
   - Select **Throat Material**
   - Hold ``B`` to draw behind the teeth
   - Draw a large oval representing the throat cavity

.. note::

   **Why separate layers?**: During animation, the upper jaw rarely moves (it's part of the skull). The lower jaw moves significantly. Separating these allows animators to move just the lower jaw without redrawing the upper teeth every frame.

.. admonition:: Fred's Tip

    You don't have to do all of these steps if the muzzle doesn't go outside the frame of the face. Then you just need outlines. This longer process is to hide the face contour lines. Experiment!

**Sculpt Mode (Butter-Knifing)**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

"Sculpting" or "butter-knifing" refers to nudging existing strokes with the Grab brush to refine shapes without redrawing.

   1. **Temporary Sculpt**: Hold ``Alt`` while hovering over a stroke
   2. **Full Sculpt Mode**: Press ``S`` to enter Sculpt Mode
   3. **Selection Mode Toggle**: Press ``Ctrl+Shift+R`` to switch between "Selected Only" and "All Visible"

.. admonition:: Fred's Tip

    *Hold ``Alt`` - if you see gray "edit lines" appearing — this indicates Selected Only mode. Press ``Ctrl+Shift+R`` to remove them (affects all strokes).*

**Join & Smooth (Post-Drawing Cleanup)**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

If strokes are close but not connected:

   1. Enter **Edit Mode**: ``Tab``
   2. Select the two endpoints you want to join
   3. Press ``Alt+F`` (Fred's operator: joins AND smooths simultaneously)
   4. Alternatively, use native Blender: ``M`` → **By Distance**

.. warning::

   ``Alt+F`` (Join & Smooth) is different from ``C`` (Trim Tool). Join connects endpoints; Trim cuts strokes at intersections.

---

.. _layer-management:

Layer Management
----------------

**Organizational Philosophy**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The Violence Tool uses a **multi-layer format** where each anatomical feature has dedicated Line and Fill layers:

   * ``01L`` / ``01F``: Body Lines / Body Fills
   * ``02L`` / ``02F``: Head Lines / Head Fills
   * ``03L`` / ``03F``: Eyes Lines / Eyes Fills
   * (etc. - further layers sometimes depends on the character.)

.. admonition:: Dan's Tip

   Blender groups material ownership by character (in essence) - if there's more than one character, don't worry - when you select them and start drawing,
   these values update and show you the right materials for that character. Setting this up is something Fred's done for us in these scenes (and will be documented seperately).

**Why so many layers?**

The short answer is close to traditional reasons - for animation 'holds':

.. admonition:: Fred's Tip

    "If he's standing still and it's just his arm that's moving, you can adjust the arm and leave the body and the head and everything else alone (if those are on another layer).
    If a character turns a little bit and the wrinkles change on their shirt, you can interpolate that and tween it and it saves so much time.
    If all the arms and hands and heads and everything are all on one layer, you won't be able to do that. It'll get messy really quick."

    (That said,) If the character is doing a blackflip or something, then I might draw everything on one layer, since it's all moving every frame.

**Why separate Line and Fill?**

* **Material independence**: Line and fill materials are separate slots.
     Changing the fill color in a material slot updates every frame using
     that slot instantly — no re-filling required.

.. admonition:: Fred's Tip

   "If I wanted to make Peppy here, if I wanted to make him blue, all I've got to do is go to his main fur color here and change it. [Plays animation back] [...] now he's blue on every single frame."


**Layer Ordering ("Z-Depth")**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Layers are rendered in Outliner order. To change drawing order:

   * **Page Up / Page Down**: Move layer up or down

.. warning::

    **Bug Warning**: Page Down is broken currently. This has been flagged (and recognized) to the Blender devs.

Alternatively:

   1. Select the layer in the **Outliner**
   2. Right-click → **Move to Top/Bottom**
   3. Or use the arrow buttons in the layer properties

.. important::

   **Always keep Fill layers UNDER their corresponding Line layers** (e.g., ``01F`` below ``01L``). Otherwise, fills may obscure line art. (or not fill properly with taps)

**Fade Inactive Layers**
~~~~~~~~~~~~~~~~~~~~~~~~

Dimming non-active layers helps focus on the current element.

   * **Rex's Binding**: ``Ctrl+F``
   * **Fred's Personal Binding**: ``W``

This also automatically enables **Overlays** (``show_overlays = True``) if they were disabled.

---

.. _animation-prep:

Animation Preparation
---------------------

**Keyframes**
~~~~~~~~~~~~~

The Violence Tool does not create keyframes — use Blender's standard workflow:

   1. Select your Grease Pencil object
   2. In the **Dope Sheet** (set to Grease Pencil mode)
   3. Position cursor over the timeline area
   4. Press ``I`` → Select **Duplicate Active Keyframe**

This copies all unlocked layers to the next frame. Lock layers you don't want to carry forward before duplicating.

**Multi-Frame Editing**
~~~~~~~~~~~~~~~~~~~~~~~

Edit strokes across multiple frames simultaneously:

   1. In the **Timeline**, Shift-click multiple frames to select them
   2. Enter **Edit Mode**
   3. Select a stroke — it now selects across all frames in the range
   4. Move, scale, or delete — changes apply to all selected frames

**Stroke Simplification (Adaptive Reduction)**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Reduce vertex count for cleaner files:

   1. Select all strokes (``A``)
   2. Press ``F3`` → Search **"Adaptive"** or **"Simplify Stroke"**
   3. Set threshold: Start with **0.001**
      - Higher = more reduction (fewer vertices, more angular)
      - Lower = preserve detail
   4. Press **Enter**

.. warning::

   **Destructive Operation**: Once you save or clear undo history, simplified strokes cannot be restored. Use ``Ctrl+Z`` immediately if dissatisfied.

---

.. _troubleshooting-tips:

Common Issues & Solutions
-------------------------

**Key Doesn't Work After Restart**
   Re-import the keymap and **Save Preferences**. See :doc:`setup` for steps.

**Toggle Hang (A, B, or E keys stuck)**
   Tap the affected key once while in Draw Mode.

**Fill Won't Close (Gaps persist)**
   Increase Gap Closure to 5-10, or redraw with better overlaps.

**Timer Not Auto-Switching Brush Mode**
   Open the **Text Editor**, load ``FRED LAYER MANAGER.py``, and click **Play**. The persistent timer should now work.

**Alt+~ Doesn't Center Timeline (Ubuntu Studio)**
   Ubuntu's desktop environment hijacks Alt+~. Remap to ``Home`` or brackets in System Settings → Keyboard.

**Pen Pressure Not Working**
   Restart Blender. This is often a tablet driver issue.

There's even more troubleshooting, and more elaborate explanations of these issues here: :doc:`troubleshooting`

---

.. _usage-next-steps:

Usage Next Steps
----------------

With these fundamentals mastered, you can:

1. **Practice with provided scene files** to build muscle memory
2. **Experiment with your own character designs** using the same layer format
3. **Share in the Discord Grease Pencil channel** for feedback and troubleshooting

For keyboard shortcuts reference, see :doc:`keybindings`. For installation help, see :doc:`setup`. For unresolved issues, check :doc:`troubleshooting`.