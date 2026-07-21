.. _setup:

Installation & Setup
====================

.. note::

   **This guide covers The Violence Tool v2.0 for Blender 5.1.2 (or testing 5.2)**
   If you're using Blender 4.1.1, see the "Stable" documentation version instead.
   You can switch between versions in the lower right corner.

Before installing, verify your environment:

   * **Blender Version**: 5.1 or 5.2 LTS (Grease Pencil 3 required)
   * **Download**: Fred's Grease Pencil Layer Manager (v2.0) py script as a plugin
   * **Also**: Rex's Keymap.py file to import to keybinds in preferences.

.. _getting-the-tool:

Getting these files
-------------------

The Violence Tool and supporting files are currently distributed exclusively through **Fred's Discord server**.

   1. **Join the Server:** If you haven't already, join the Discord community linked on the project homepage.
   2. **Ask for access to the Grease Pencil channel:** Resources and the py file are pinned to the channel.
   3. **Download:** Save the Violence Layer manager .py file to your computer.

.. important::

   There is no public website, GitHub repository, or Blender Market listing for this tool yet.
   Access is restricted to the Discord community for early testing and workflow development.
   If you are not a member, please contact Fred directly to request an invitation. We're friendly!

.. _prerequisites:

Prerequisites
-------------

* **Blender 5.2 LTS or 5.1** (required — other versions will cause compatibility issues)
* A Grease Pencil object already created in your scene (typically provided by Fred with pre-set layers and keyframes)
* A **monitor tablet** with pressure sensitivity is recommended but not required
* **Discord**: To get access to the file for now, updates, and the community for help.

*Advanced Prerequisites* for a _blank_ file can be found in :doc:`/user/troubleshooting`.
You'll almost always have this set up for you in advance when working on AFIS.

--------------------------------------------------------------------------------

.. _install-addon:

Installing the Addon
--------------------

**Step 1: Open Addons Preferences**

   1. Launch Blender
   2. Go to **Edit → Preferences**
   3. Select the **Add-ons** tab

**Step 2: Install the Script**

   1. Click the **Install...** button (top-right)
   2. Navigate to where you downloaded ``fredlayermanager.py``
   3. Select it and click **Open**
   4. Find the addon in the list (search: "Fred")
   5. **Enable the checkbox** next to it

**Step 3: Verify Installation**

   * Open the **Text Editor** workspace
   * You should see ``fredlayermanager.py`` loaded
   * Check the **System Console** (Window → Toggle System Console) for any errors

.. warning::

   **The addon must be enabled every time Blender starts.** While Blender saves addon preferences,
   some users report the addon needs re-enabling after updates.

   **Persistent timer issue:** See :ref:`known-issue-timer-addon` if stroke mode switching doesn't work automatically.

--------------------------------------------------------------------------------

.. _install-keymap:

Importing the Keymap
--------------------

**Crucial Step** — The addon does NOT include keybinds by default. You must import Rex's keymap manually.

**Step 1: Locate the Keymap File**

   * Download ``REX_keymap_rev1.py`` from the Discord #GreasePencil channel
   * Expected size: ~15 KB

**Step 2: Import in Keymap Preferences**

   1. In Preferences, switch to the **Keymap** tab
   2. Click the **Import** button (near the search bar)
   3. Select ``REX_keymap_rev1.py``
   4. Click **Import Keymap File**

**Step 3: Verify Keybinds Loaded**

   1. Search for ``fred.grease_layer_switch`` in the search bar
   2. Expand the entry — you should see multiple bindings (Shift+0–9, Ctrl+1–4, etc.)
   3. If nothing appears, the import failed

**Step 4: Save Preferences**

   * Click **Save Preferences** at the bottom-left of the Preferences window

.. warning::

   **If you close Blender without clicking "Save Preferences," all keybind changes are lost.**
   This is the #1 cause of "my keybinds stopped working" complaints.

--------------------------------------------------------------------------------

.. _verifying-setup:

Verifying Your Setup
--------------------

**Test 1: Layer Switching**

   1. Open any .blend file with a Grease Pencil object
   2. Select the GP object
   3. Press **Shift+1** — you should instantly switch to Layer 1 and Draw Mode
   4. Press **Shift+Alt+1** — you should switch to Fill Layer 1 and see a material popup

**Test 2: Timer Auto-Switch**

   1. Draw a stroke with a "LINE" material
   2. Switch to a material WITHOUT "LINE" in the name
   3. The brush should automatically change stroke type (Stroke → Fill → Both)
   4. If it doesn't, see :ref:`known-issue-timer-addon`

**Test 3: Modal Toggles**

   1. In Draw Mode, press and hold **A** (Auto-Merge)
   2. Start drawing — strokes should snap together
   3. Release A while NOT drawing — toggle should turn off
   4. If toggle hangs, see :ref:`trouble-modal-toggles`

**Test 4: Erase Keys**

   1. Press **E** (tap once) — should switch to point eraser
   2. Press **E** (hold down) — should switch to stroke eraser
   3. Release — should remain on point eraser
   4. Tap E again — should cycle back to stroke eraser

.. note::

   If you're looking for the 1.0/4.1.1 Fred Panel, it is **not yet implemented** in v2.0. To verify the tool is running,
   press ``F3`` and search for one of the tool's operators (e.g., ``gpencil.draw_mode``).
   If it appears in the search results, the tool is installed and active, or the above.

--------------------------------------------------------------------------------

.. _configuring:

Configuring Keybindings
-----------------------

For optimal workflow, we highly recommend configuring specific keyboard shortcuts. See :doc:`keybindings` for detailed setup instructions on:

   - Holding **Alt** to nudge lines while drawing (often referred to as 'sculpt'ing lines)
   - Using **F** to change sculpt radius
   - Quick-switching between Draw, Erase, Sculpt, and Fill modes with single keys
   - Toggling "Fade Inactive Layers"

And everything else!

--------------------------------------------------------------------------------

.. _updating:

Updating the Tool
-----------------

When a new version of the script is released:

   1. **Save any custom changes** you made to the script first (if applicable).
   2. Close the old script in the Text Editor (Method 1) or remove the old add-on in Preferences (Method 2).
   3. Load the new ``.py`` file.
   4. Run the script or re-enable the add-on.
   5. Re-implement any changes you may have made.

.. warning::

   Updating will overwrite any unsaved changes to the script file. Always save your modifications before updating.

If you receive an error, try changing the name to TheViolenceLayerManager.py.

.. _first-file:

Opening Your First File
------------------------

**Using the Practice File**

The practice file (``TheViolence_Practice_File_v2.blend``) comes with:

   * All brushes pre-installed
   * Correct layer structure
   * Material slots configured
   * Test character ready to animate

Steps:

   1. Download the practice file from releases
   2. Open it in Blender
   3. Ensure addon is enabled (Edit → Preferences → Add-ons)
   4. **If stroke mode auto-switching doesn't work**, see below

**Timer Issue on File Load**

.. warning::

   **If you switch materials but the stroke mode doesn't auto-update (still draws fills when it should draw strokes)**,
   the background timer didn't initialize.

   **Immediate fix:**

      1. Open the **Text Editor** workspace
      2. Find ``fredlayermanager.py`` in the dropdown
      3. Click the **▶ Play** button

   The timer should now run, and material switching will work automatically.

   This is a known bug. See :ref:`known-issue-timer-addon` for permanent workarounds and future fixes.

**Creating a New File from Scratch**

If you want to start fresh:

   1. Create a new Grease Pencil object
   2. Add layers following the naming pattern above
   3. Add materials in the correct slot order
   4. Assign the four required brushes
   5. Save the file as a template for future projects

Alternatively, start from the practice file and delete James's layers to get a blank slate with everything configured.

See :doc:`/user/troubleshooting` for detailed instructions on what the Fred tool requires in a document.

--------------------------------------------------------------------------------

.. _preferences-save:

Saving Preferences
------------------

After completing the setup:

   1. **Save Preferences** in Add-ons tab
   2. **Save Preferences** in Keymap tab
   3. **Save your .blend file** with all brushes and materials

**Create a Template (.blend file)**

   1. With everything configured, go to **File → Defaults → Save Startup File**
   2. Or save as ``violence_tool_template.blend``
   3. Future projects: File → New → General, then append the template

This eliminates the need to reinstall everything for each new animation project.

--------------------------------------------------------------------------------

.. _common-setup-problems:

Common Setup Problems
---------------------

**Addon installs but keybinds don't work**

   1. Keymap wasn't imported (go back to :ref:`install-keymap`)
   2. Preferences weren't saved (click "Save Preferences" button)
   3. GP object isn't selected (keybinds require active GP object)

**All keybinds switch to Layer 1**

   1. Keymap properties didn't resolve on startup
   2. Go to Edit → Preferences → Keymap
   3. Find the layer switch entries
   4. Check that ``layer_filter`` values are correct (e.g., "01L", "02L", etc.)
   5. If they're all "01L", delete and re-import the keymap

**Material menu opens but is empty**

   1. No materials assigned to the GP object
   2. Add material slots via the Material Properties panel (green sphere icon)
   3. Assign brushes to each material slot

**Cursor location matters**

Some keybinds require the mouse to be in the **3D Viewport**. If a key does nothing:

   1. Move your cursor into the 3D Viewport
   2. Try the key again

.. _setup-faq:

What if I want to use this for my own project?
----------------------------------------------

This is welcome, but could involve some organization that might be unique to your project, depending on your style. Here's what we recommend to start:

   1. Practice with the provided scene files using the default setup for AFIS to get an idea of how the system works
   2. Play around and find your personal workflow
   3. Consider sharing with us what you discovered!

.. note::

   As the community grows, we hope to share your invented workflows, keybinds, and guides.

--------------------------------------------------------------------------------

.. _next-steps

Next Steps
----------

Once setup is complete:

   1. Review the :doc:`keybindings` reference for all shortcuts
   2. See :doc:`blender-basics` if you are new to Blender in general. Be sure to watch the linked videos!
   2. Read :doc:`usage` for daily workflow and how to practice with the provided scene file.
   3. Keep :doc:`troubleshooting` handy for common issues