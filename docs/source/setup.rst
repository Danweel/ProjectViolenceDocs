.. _setup:

The Violence Tool Installation
==============================

Requirements & Warnings for Fred's projects
-------------------------------------------

.. important::

   The Violence Layer Manager is designed for a specific Grease Pencil
   workflow. It will **not work** with arbitrary GP objects.

**Your Grease Pencil Object MUST have:**

1. **Multi-layer format** — Layers named and organized according to the
   Violence Tool convention (Body, Head, Eyes, Mouth, etc.)

2. **Material slot setup** — The ``1234/QWER/ASDF`` material slot configuration

3. **Blender 4.1.1 or higher** — The add-on uses GPencil APIs introduced in
   Blender 4.x

**If your object doesn't match this format:**

- The layer switching operators will fail silently
- The panel buttons won't select the correct layers
- You may see errors in the Blender console

What if I want to use this for my own project?
----------------------------------------------

This is welcome, but could involve some organization that might be unique to your project, depending on your style.
    1. Practice with the files included here, using the default setup to get an idea of how the system works
    2. Look through our documentation on ::doc::`altsetups<alternative setups>` from other users (under construction)
    3. Play around and find your personal workflow
    4. Consider sharing with us what you discovered!

Prerequisites:
--------------

* **Blender 4.1.1** or higher (The add-on uses GPencil APIs introduced in Blender 4.x).
* A Grease Pencil object with the correct layer/material **structure** (the addon will help with this)
* **The Violence Layer Manager** add-on installed (see :doc:`installation`).
* It can be helpful - but not necessary, to have a **monitor tablet** with pressure sensitivity.

.. _installing:

Installing
============

Step 1: Install the Add-on
---------------------------

1. **Save the Script**:
   * Save the ``TheViolenceLayerManager.py`` file to a location on your computer.
   * *Tip: You can also run it directly from Blender's Text Editor, but saving it allows for permanent installation.*

2. **Open Preferences**:
   * In Blender, go to **Edit** → **Preferences**.

3. **Install**:
   * Click the **Add-ons** tab.
   * Click the **Install...** button (top left).
   * Navigate to your saved ``TheViolenceLayerManager.py`` file and select it.

4. **Enable**:
   * Find "The Violence: Grease Pencil Layer Manager" in the list (or search for "Violence").
   * **Check the box** to enable it.
   * Click **Save Preferences** (bottom left) to ensure it loads on startup.


.. note:: You don't need to do this on files that are already set up by Fred, like an inbetween or test file. However, when a revision comes out, you may want to update, in which case you'll need to re-'run' the script.

5. **Initializing the script**

   * Open the python panel in Blender
   * Press the play button at the top of the window.

.. note:: 'Playing' the script file will **rewrite** the changes you may have made to it, if any.

Step 2: Verify Installation
-----------------------------

1. Open the **Sidebar** in the 3D View (press ``N`` if hidden).
2. Click the **Fred** tab.
3. You should see the **LAYER SELECTOR** panel with buttons for "Body", "Head", "Eyes", etc.
4. Press your assigned hotkey to see the **Layer Switcher** menu.

Step 3: Configure Keybindings (Recommended)
--------------------------------------------

For optimal workflow, we highly recommend configuring specific keyboard shortcuts.
See the :ref:`keybindings` page for detailed setup instructions on:

* Holding **Alt** to nudge lines while drawing
* Using **F** to change sculpt radius
* Quick-switching between Draw, Erase, Sculpt, and Fill modes with single keys
* Toggling "Fade Inactive Layers"

.. note::
    These keybindings are optional but will significantly improve your efficiency
    when using The Violence Layer Manager.

Once installed, you can find :ref:`onboarding` to get your practice files.

.. _troubleshooting:

Setup Troubleshooting
========================

Before assuming something is broken, check these common issues:

.. include:: _troubleshooting/setup-trouble.rst
