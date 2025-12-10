# emacs-r-devkit Keybinding Summary

**Emacs Version:** GNU Emacs 30.2 (Homebrew emacs-plus)  
**Date:** 2025-12-10

---

## 🎯 Quick Reference

### Modifier Keys (macOS)

**Your Current Configuration:**

```elisp
Command (⌘) → Meta (M-)
Option (⌥)  → Super (s-)
Control     → Control (C-)
```

**This means:**

- `M-x` = `Command-x` (NOT Option-x!)
- `s-` bindings use `Option`
- `C-` bindings use `Control`

---

## 📦 Package-Provided Keybindings

### Consult (Enhanced Search/Navigation)

| Key | Function | Description |
|-----|----------|-------------|
| `C-s` | `consult-line` | **Replaces** standard search with fuzzy line search |
| `C-x b` | `consult-buffer` | Enhanced buffer switching with preview |
| `M-y` | `consult-yank-pop` | Browse and paste from clipboard history |
| `M-g g` | `consult-goto-line` | Visual line number jump |

### Company (Completion)

*Active only in completion popup:*

| Key | Function |
|-----|----------|
| `C-n` | Next completion |
| `C-p` | Previous completion |
| `TAB` | Accept completion |
| `C-g` | Cancel |

### Magit (Git)

| Key | Function |
|-----|----------|
| `C-x g` | Open Magit status |

### Projectile (Project Management)

| Key | Function |
|-----|----------|
| `C-c p` | Projectile command map prefix |

*Common Projectile subcommands:*

- `C-c p f` - Find file in project
- `C-c p p` - Switch project
- `C-c p s s` - Search in project (grep)

### Citar (Bibliography/Zotero)

| Key | Function |
|-----|----------|
| `C-c b` | Insert citation |
| `M-b` | Insert preset (in minibuffer) |

---

## 🔧 Custom emacs-r-devkit Bindings

### Core R Development (`C-c r` prefix)

**Documentation & Code Generation:**

| Key | Function | Purpose |
|-----|----------|---------|
| `C-c r r` | Insert roxygen skeleton | Parse function signature and create documentation |
| `C-c r S` | Toggle styler | Enable/disable auto-formatting on save |
| `C-c r P` | Export GUI PATH | Fix macOS PATH for GUI Emacs |

**File Creation (usethis):**

| Key | Function | Purpose |
|-----|----------|---------|
| `C-c r u` | Create R file | Calls `usethis::use_r()` |
| `C-c r t` | Create test file | Calls `usethis::use_test()` |
| `C-c r p` | Package documentation | Calls `usethis::use_package_doc()` |

**S7 OOP Helpers (`C-c r s` subprefix):**

| Key | Function | Purpose |
|-----|----------|---------|
| `C-c r s c` | Insert S7 class | Generate class skeleton with properties |
| `C-c r s m` | Insert S7 method | Generate method implementation |
| `C-c r s g` | Insert S7 generic | Generate generic function |

### Obsidian Integration (`C-c o` prefix)

| Key | Function | Purpose |
|-----|----------|---------|
| `C-c o l` | Link R project | Connect to Obsidian Research Lab |
| `C-c o f` | Log file | Add current file to research log |
| `C-c o t` | Fetch theory | Retrieve theory note for context |
| `C-c o d` | Sync draft | Synchronize draft content |

---

## 📋 Standard Emacs Bindings (Preserved)

### File Operations

| Key | Function |
|-----|----------|
| `C-x C-f` | Find/open file |
| `C-x C-s` | Save file |
| `C-x C-w` | Save as |
| `C-x C-c` | Quit Emacs |

### Editing

| Key | Function |
|-----|----------|
| `C-space` | Start selection (mark) |
| `C-w` | Cut (kill region) |
| `M-w` | Copy |
| `C-y` | Paste (yank) |
| `C-/` | Undo |

### Navigation

| Key | Function |
|-----|----------|
| `C-a` | Beginning of line |
| `C-e` | End of line |
| `C-n` | Next line |
| `C-p` | Previous line |
| `M-f` | Forward word |
| `M-b` | Backward word |

---

## 🔴 Critical Issue Found

**Modifier Key Documentation Mismatch:**

Your `init.el` configures:

```elisp
mac-command-modifier 'meta      ; Command = Meta
mac-option-modifier 'super      ; Option = Super
```

But `docs_mkdocs/keybindings.md` states:

```
| M- | Option (⌥) | Meta/Option key
```

**Impact:** All documentation telling users to use `Option` for Meta commands is **wrong**. They should use `Command` instead.

---

## 💡 Enhancement Recommendations

### 1. Fix Documentation (CRITICAL)

Update all docs to reflect `Command` = `Meta`:

- [ ] `docs_mkdocs/keybindings.md`
- [ ] `guides/TUTORIAL.md`
- [ ] `guides/CHEAT-SHEET.md`

### 2. Add Mac-like Shortcuts

Use `Option` (Super) for familiar shortcuts:

```elisp
(global-set-key (kbd "s-s") 'save-buffer)        ; Option-s to save
(global-set-key (kbd "s-c") 'kill-ring-save)     ; Option-c to copy
(global-set-key (kbd "s-v") 'yank)               ; Option-v to paste
(global-set-key (kbd "s-x") 'kill-region)        ; Option-x to cut
(global-set-key (kbd "s-a") 'mark-whole-buffer)  ; Option-a select all
```

### 3. Expand R Developer Shortcuts

```elisp
(global-set-key (kbd "C-c r c") 'ess-r-devtools-check-package)
(global-set-key (kbd "C-c r b") 'ess-r-devtools-build-package)
(global-set-key (kbd "C-c r l") 'ess-r-devtools-load-package)
(global-set-key (kbd "C-c r x") 'ess-r-devtools-test-package)
```

### 4. Add Which-Key Descriptions

```elisp
(which-key-add-key-based-replacements
  "C-c r" "r-devkit"
  "C-c r s" "s7-oop"
  "C-c o" "obsidian")
```

---

## 📊 Summary Statistics

- **Custom prefixes:** 2 (`C-c r`, `C-c o`)
- **R development bindings:** 9
- **Obsidian bindings:** 4
- **Package bindings:** ~10
- **Overridden standard bindings:** 1 (`C-s`)

**Total custom keybindings:** ~25

---

## ✅ Next Steps

1. **Decide:** Keep current modifier mapping or switch to traditional?
2. **Fix:** Update all documentation to match `init.el`
3. **Enhance:** Add Mac-like shortcuts and R development conveniences
4. **Document:** Update this summary after changes
