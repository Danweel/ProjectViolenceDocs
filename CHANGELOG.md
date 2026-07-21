# Docs Version 2.1 (July 2026)

"Post meeting re-write"

## **Documentation Releases for The Violence Tool v2.0 (Blender 5.1.2)**
### **New Documentation**
#### **usage.rst** — Complete v2.0 workflow guide covering:
- Animation preparation and keyframing
- Mouth construction with four-layer system
- Gap crossing and stroke overlap methodology
- Sculpt mode butter-knifing workflows
- Pupils on line layer technique

#### **keybindings.rst** — Comprehensive technical reference including:
- All 25 operators from FRED LAYER MANAGER.py
- Layer switching, modal toggles, and drawing tools reorganization
- Platform-specific notes/troubleshooting (Ubuntu Studio, non-US layouts)
- Fred's tips and common gotchas

#### **keybinds-cheat-sheet.md** — Community-friendly quick reference:
- Clean tables for daily use
- Common troubleshoots section
- Distributable file and online version

#### **setup.rst** — Installation and verification:
- Addon and keymap import procedures
- Scene requirements and material naming
- Verification instructions
- First file opening guidance

#### **troubleshooting.rst**
- Keymap issues and resolution
- Fill tool problems and gap closure
- Modal toggle hang fixes
- Known Blender-side bugs (5.1/5.2)
- Moved new file setup to here

### **Documentation Organization**
- Reorganized keybindings.rst with thematic grouping (Core Workflow → Secondary → Advanced)
- Moved blank file setup guidance to troubleshooting (beginner-focused)
- Separated technical keybind docs from community Markdown cheat sheet for readability

### **Accuracy Corrections**
- Brush strength bindings: `1` = 100% (full), `2` = 0% (none)
- Clarified `Shift+A` context (Edit Mode for stroke selection operations)
- Verified all 25 operators documented against FRED LAYER MANAGER.py

### **Known Issues Documented**
- Timer initialization in addon mode (persistent=True workaround)
- Cyclic stroke bug #157190 (Blender 5.2)
- Page Down multi-select failure (confirmed by YimingWu)
- Fill tool screen-space detection at high zoom
- Alt+F join/smooth regression (GP3)
- Ubuntu Studio Alt+~ system shortcut conflict

### **Pending Items for Future Docs**
- use-cases.rst (entirely v1.0 — full rewrite needed)
- tests.rst (entirely v1.0 — archive and/or rewrite)
- Screenshots for keybinds.rst image placeholders
- Any other new useful screenshots from meeting video of Fred's screen
- Closing out overtaken issues in the tracker.

### **Repository**
- Cleaned up a few files

`25 files changed, 2205 insertions(+), 1479 deletions(-)`


---

## Docs Version 2.0, Tool version 2.0:
"Pre-meeting preparation"

### **Added:**
- Partial rewrite of `usage.rst` for v2.0 keybind-driven workflow
- Warnings on old content

### **Updated:**
- `keybindings.rst`, `setup.rst`, `troubleshooting.rst` to v2.0 operator names, `index.rst`, `versioning.rst`

### **Fixed:**
- Multiple typos in `blender-basics.rst`, etc.

### **Deferred:**
- `use-cases.rst` and `tests.rst` updates
- Closing out overtaken issues in the tracker.

---

# [0.2.0] - 2026-05-21

## Added
### **Keybindings Page (`keybindings.rst`)**
- "Keymap Section Path" column to all shortcut tables, telling users exactly
  where to navigate in Edit → Preferences → Keymap to bind each operator
- "Blender Operator ID" column to the Essential Blender Shortcuts table
- "How to Bind Operators to Keys" step-by-step guide for the "+ Add New"
  method (since unbound operators don't appear in search)
- "Setting Up Hold-to-Activate Keys" instructions for Press/Release bindings
- "Choosing the Right Keymap Context" section explaining when to use
  3D View (Global) vs. Paint Mode vs. Edit Mode
- "Why use these instead of Arrow Keys?" explanation of the undo-stack
  navigation feature in OP4–OP7
- OP16/OP17 (Automerge) and OP36 (Retopo Helper) to the shortcut tables
- OP12 (Randomize Selected) with clarification of how it differs from
  OP8 (Jiggle) and OP23 (Large Pass)
- "Additional Operators" table for tools with no panel button
- "Excluded Operators" section documenting broken/deprecated operators

### **Operators Page (`operators.rst`)**
- Section anchor labels for all subsections (fixes undefined reference warnings)
- v5.0 operator entries: OP8 (Jiggle), OP15, OP36–OP40
- Technical Appendix entries for v5.0 native Blender operations:
  - Toggle Layer Visibility, Set Layer Lighting, Iterate Objects by Type,
    Iterate Screen Areas, Toggle Viewport Compositor, Resize with Axis
    Constraint, Translate with Snap, Smooth Mesh Vertices, IntProperty
    for Dialog Input, Invoke Properties Dialog
- Bug warnings for OP15, OP30, and OP39 in the Warnings section

### **Changed**
- Standardized all shortcut table column order to: Shortcut, Action,
  Keymap Section Path, Operator ID
- Replaced inline-literal code formatting (double backticks) with proper
  `.. code-block:: python` directives in the Technical Appendix
- Clarified OP36 as "Mesh Only" — will crash on Grease Pencil objects
- Clarified OP39 as having a known crash bug on second use

### **Fixed**
- Sphinx build warnings: "Inline literal start-string without end-string"
- Sphinx build warnings: "unknown document" for Blender Manual cross-references
- Undefined label warnings for mouth-jaw-operators, effects-operators,
  keyframe-operators, sculpt-isolation-operators, layer-switching-operators
- Pre-push Git hook: "poetry: not found" error (hook now sources user profile)

### **Suspcted Known Issues**
Documented, Not Fixed, Not Verified - I'll do this in a future update. This is code-read, not tested.
- `fred.op39`: RuntimeError on second use due to nested class registration
- `fred.op36`: Crashes on Grease Pencil objects (uses mesh.vertices_smooth)
- `fred.op30`: Broken syntax (hide_viewport is a property, not callable)
- `fred.op26`: Wrong argument type (passes Material object instead of string)
- `fred.op15`: Fails to unhide invisible layers before unlocking
- `fred.op38`: Placeholder — loops through GP objects but performs no action