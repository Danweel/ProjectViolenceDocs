.. _keybind-trouble:

Keybindings (like ``D``, ``E``, ``S``) do not work or trigger unexpected actions.
---------------------------------------------------------------------------------

    **Check:** Is your keyboard set to the **wrong language**?
    **Fix:** Switch your OS keyboard layout to **US/International**.
    **How:** Look at your system tray (Windows) or menu bar (macOS/Linux) and ensure the input language is **English (US)**.

    *Tip:* The tool's keymap is configured for the QWERTY US layout. Other layouts (like AZERTY or QWERTZ) map keys differently.


"Operator not found" error.
---------------------------

    **Check:** Is the keybinding name correct?
    **Fix:** Verify the keybinding name and restart Blender.
    **How:**

        1. Go to **Edit → Preferences → Keymap**.
        2. Search for ``OBJECT_MT_Fred_Custom_Layer_Menu``.
        3. Ensure the name is spelled exactly as shown (case-sensitive).
        4. If the keybinding exists but doesn't work, **restart Blender** to ensure the add-on loaded correctly.
        5. If the error persists, check the **System Console** (Window → Toggle System Console) for specific error messages.