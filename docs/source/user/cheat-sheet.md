# The Violence Tool — Keybind Cheat Sheet
> **Quick daily reference.** - View default online @ https://project-violence-docs.readthedocs.io/en/latest/user/cheat-sheet.html
> For full setup instructions, technical details, and troubleshooting, see: https://project-violence-docs.readthedocs.io/en/latest/user/keybindings.html
---
## Modes
| Key | Action |
|------|--------|
| `D` | Draw Mode + MY STROKE brush |
| `Tab` | Toggle Draw ↔ Edit |
| `Ctrl+Tab` | Mode pie menu (Draw / Edit / Sculpt / Object) |
| `Alt` (hold) | Sculpt Mode (temporary — returns to Draw on release) |
| `S` | Sculpt Mode (permanent — exit via `Tab` or `Ctrl+Tab`) |
|||

## Layer Switching
### Line Layers (Draw Mode)
| Key | Layer |
|------|-------|
| `Shift+1` | Layer 1 (Body) |
| `Shift+2` | Layer 2 (Head) |
| `Shift+3` | Layer 3 (Eyes) |
| `Shift+4` | Layer 4 (Tail) |
| `Shift+5` | Layer 5 (Arms) |
| `Shift+6` | Layer 6 (Hands) |
*(Shift+7–0 continue the pattern)*
|||
### Fill Layers (opens material picker)
| Key | Layer |
|------|-------|
| `Shift+Alt+1` | Fill Layer 1 |
| `Shift+Alt+2` | Fill Layer 2 |
| `Shift+Alt+3` | Fill Layer 3 |
| *(Shift+Alt+4–0 continue the pattern)* | |
|||
### Sculpt Layers (unlocks Line + Fill pair)
| Key | Layers |
|------|--------|
| `Alt+1` | Line 1 + Fill 1 |
| `Alt+2` | Line 2 + Fill 2 |
| *(Alt+0–9 continue the pattern)* | |
|||
### Face / Mouth Layers
| Key | Layer | Notes |
|------|-------|-------|
| `Ctrl+1` | Mouth Lines | Muzzle, nose, jaw outline, temporary mask line |
| `Ctrl+2` | Mouth Mask | Invisible clipping mask — no material popup |
| `Ctrl+3` | Upper Teeth | Doesn't move with jaw |
| `Ctrl+4` | Lower Teeth / Tongue / Throat | Moves with jaw |
|||
### Special Layers
| Key | Layer |
|------|-------|
| `Shift+Ctrl+1` | Shadows |
| `Shift+Ctrl+2` | Highlights |
|||
## Quick Menus
| Key | Action |
|------|--------|
| `3` | Layer popup menu |
| `4` | Material popup menu |
|||
## Drawing & Erasing
| Key | Action | Notes |
|------|--------|-------|
| `D` | Draw Mode + MY STROKE brush | |
| `1` | Brush strength 100% | |
| `2` | Brush strength 0% | |
| `E` (tap) | Erase Point brush | Pixel-style erasure |
| `E` (hold) | Erase Stroke brush | Deletes entire strokes on contact |
| `C` (hold) | Trim tool | Lasso-cut at intersections |
| `C` (release) | Return to Brush | Momentary — not a toggle |
| `Ctrl+X` | Delete all connected strokes/fills | Edit Mode only |
|||
## Modal Toggles (Hold-to-Activate)
| Key | Hold (Press) | Release | Warning |
|------|-------------|---------|---------|
| `A` | Auto-Merge ON | Auto-Merge OFF |
| `B` | Draw Behind ON | Draw Behind OFF |
| `Alt` | Sculpt Mode (temp) | Return to Draw |
|||
> **Toggle Hang:** If you release `A`, `B`, or `E` **while still drawing**,
> the toggle gets stuck ON.
> **Fix:** Lift your pen, then tap the stuck key once.
## Editing
| Key | Action | Notes |
|------|--------|-------|
| `Tab` | Toggle Draw ↔ Edit | |
| `C` | Trim / connect strokes | Requires Edit Mode |
| `Alt+F` | Join & Smooth | Press repeatedly for more smoothing |
| `Shift+A` | Apply material + stroke type to selection | |
| `Ctrl+Shift+B` | Send to Back (Z-order) | |
| `Ctrl+Shift+F` | Send to Front (Z-order) | |
| `Ctrl+Shift+R` | Toggle sculpt selection mode | All strokes vs. selected only |
|||
### C vs Alt+F — What's the Difference?
- **`C` (Trim):** Cuts strokes at where they cross. Like scissors.
- **`Alt+F` (Join & Smooth):** Connects the nearest endpoints and smooths them.
  Like welding. Does not require overlapping strokes, but don't lean on it.
### Ctrl+Shift+R — "My nudge does not work?"
If holding `Alt` to nudge strokes and nothing moves, you're in **Selected Only**
mode but haven't selected anything. Either select strokes first, or press
`Ctrl+Shift+R` to switch to "affect all strokes" mode.
- **Gray edit lines visible** → Selected Only mode
- **No edit lines** → All strokes mode
## Timeline Navigation
| Key | Action |
|------|--------|
| `Shift+Z` | Previous keyframe |
| `Shift+X` | Next keyframe |
| `Ctrl+Alt+Z` | Previous marker |
| `Ctrl+Alt+X` | Next marker |
| `` ` `` (grave accent) | Center timeline on selection |
| `Ctrl+Shift+Alt+C` | Toggle realtime compositor |
|||
> **Why not just use arrow keys?** The tool's navigation operators push an
> Undo step. Jump too far? `Ctrl+Z` snaps you right back.
---
## Viewport
| Key | Action | Notes |
|------|--------|-------|
| `Ctrl+F` | Toggle Fade Inactive Layers | Also enables overlays if off |
| `W` | Toggle Fade Inactive Layers | Fred's personal alternative |
| `Alt+Z` | Toggle X-Ray mode | Native Blender |
| `Z` | Viewport shading pie | Native Blender |
| `Ctrl+~` | Reset camera view | Native Blender |
|||
## Common Gotchas
### "My keybinds stopped working after restarting Blender"
You didn't save preferences. Re-import the keymap file, then **Save Preferences**.
### "My layer keys all switch to Layer 1"
Keymap properties didn't resolve on load. Re-select your keymap in Preferences
(or delete and re-import). This is a known Blender startup bug.
### "Fill says 'unable to fill unclosed areas'"
- Increase **Gap Closure** (Fill tool → Advanced) to 5–10
- Enable **Visual Aids** for drag handles
- **Zoom out** — fill detection is screen-based and fails at high zoom
- Best fix: draw strokes that **cross over halfway** to prevent gaps
### "Duplicate fills appeared"
Tab into Edit Mode, lasso select the duplicates, press `Ctrl+X`.
### "Toggle is stuck ON (drawing behind / auto-merging)"
You released the key mid-stroke. Lift pen, tap the stuck key once.
### "Drawing behind even though I'm not holding B"
Same as above — the B toggle hung. Tap `B` once to reset.
### "Pen pressure glitched"
Restart Blender (and/or tablet driver). If a mouse draws fine but the tablet
doesn't, it's a driver issue, not the tool.
### "`3` key doesn't do anything"
It's not bound by default in Rex's keymap. See full docs for manual binding
instructions (~30 seconds in Preferences).
### "I can't zoom or pan normally"
You likely imported Fred's personal keymap instead of Rex's. Fred's overrides
zoom and pan. Either switch to Rex's keymap, or manually fix:
- Zoom: change `Ctrl+Shift+LMB` → `Ctrl+MMB`
- Pan: change `Spacebar` → `Shift+MMB`
### "Alt+~ doesn't center my view (Linux/Ubuntu Studio)"
Your desktop environment is intercepting it. Disable the OS shortcut, or
remap to `Home` or bracket keys in Blender Preferences.