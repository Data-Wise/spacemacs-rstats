# Keybinding Analysis and Enhancement Plan

## Background Research: emacs-plus on macOS

### Key Findings

**emacs-plus vs Vanilla Emacs:**

- emacs-plus is vanilla GNU Emacs with macOS-specific patches for better integration
- **Default keybindings are identical to vanilla Emacs** - no special "emacs-plus bindings"
- The main difference is **how macOS modifier keys are handled**

**Modifier Key Mapping (Current vs Common Practice):**

Your current `init.el` (lines 133-137):

```elisp
(setq mac-command-modifier 'meta
      mac-option-modifier 'super
      mac-right-option-modifier nil)
```

**Common Alternative Configurations:**

1. **Mac-like** (Command for common actions):
   - `Command` → `Meta` (your current setup) ✓
   - `Option` → `Super` (your current setup) ✓

2. **Traditional Emacs** (Option as Meta):
   - `Command` → `Super`
   - `Option` → `Meta`

**macOS Built-in Emacs Keybindings:**
macOS includes system-wide Emacs bindings that work in all text fields:

- `Ctrl-A` - Beginning of line
- `Ctrl-E` - End of line
- `Ctrl-K` - Kill to end of line
- `Ctrl-N/P` - Next/Previous line

---

## Current Keybinding Analysis

### Package-Defined Keybindings

#### Consult (Search/Navigation)

| Key | Function | Notes |
|-----|----------|-------|
| `C-s` | `consult-line` | **Override**: Replaces standard `isearch` |
| `C-x b` | `consult-buffer` | Enhanced buffer switching |
| `M-y` | `consult-yank-pop` | Clipboard history |
| `M-g g` | `consult-goto-line` | Visual line jump |

#### Company (Completion) - Active Map Only

| Key | Function | Notes |
|-----|----------|-------|
| `C-n` | `company-select-next` | In completion popup |
| `C-p` | `company-select-previous` | In completion popup |
| `TAB` | `company-complete-selection` | Accept completion |

#### Citar (Citations)

| Key | Function | Notes |
|-----|----------|-------|
| `C-c b` | `citar-insert-citation` | Zotero integration |
| `M-b` | `citar-insert-preset` | In minibuffer only |

#### Magit (Git)

| Key | Function | Notes |
|-----|----------|-------|
| `C-x g` | `magit-status` | Standard Magit binding |

#### Projectile (Projects)

| Key | Function | Notes |
|-----|----------|-------|
| `C-c p` | Projectile command map | Prefix for all projectile commands |

### Custom R Development Keybindings (C-c r prefix)

| Key | Function | Purpose |
|-----|----------|---------|
| `C-c r r` | `insert-roxygen-skeleton` | Documentation |
| `C-c r u` | `usethis-use-r` | Create R file |
| `C-c r t` | `usethis-use-test` | Create test file |
| `C-c r p` | `usethis-use-package-doc` | Package docs |
| `C-c r s c` | `s7-insert-class` | S7 class skeleton |
| `C-c r s m` | `s7-insert-method` | S7 method skeleton |
| `C-c r s g` | `s7-insert-generic` | S7 generic skeleton |
| `C-c r S` | `toggle-styler` | Toggle auto-format |
| `C-c r P` | `export-gui-path` | Fix macOS PATH |

### Obsidian Integration (C-c o prefix)

| Key | Function | Purpose |
|-----|----------|---------|
| `C-c o l` | `obs-r-link-project` | Link to Obsidian |
| `C-c o f` | `obs-log-file` | Log to Research Lab |
| `C-c o t` | `obs-fetch-theory` | Fetch theory note |
| `C-c o d` | `obs-sync-draft` | Sync draft |

---

## Issues Identified

### 🔴 Critical Issue: Modifier Key Documentation Mismatch

**Your `init.el` says:**

```elisp
(setq mac-command-modifier 'meta      ; Command = Meta
      mac-option-modifier 'super)     ; Option = Super
```

**But `keybindings.md` says:**

```
| M- | Option (⌥) | Meta/Option key ← Important! |
```

**This is contradictory!** If `Command` = `Meta`, then:

- `M-x` should be `Command-x`, not `Option-x`
- All your documentation is **incorrect**

### ⚠️ Overridden Standard Bindings

1. **`C-s` → `consult-line`**
   - Replaces standard incremental search (`isearch-forward`)
   - Users coming from vanilla Emacs will be surprised
   - Consider: Keep `C-s` for `isearch`, use `M-s l` for `consult-line`

---

## Revised Enhancement Strategy: Spacemacs Transition

### 1. **Switch to Traditional Modifier Mapping** (Critical First Step)

**New Recommendation:** Switch to **Option B (Traditional Emacs)**

```elisp
(setq mac-command-modifier 'super
      mac-option-modifier 'meta
      mac-right-option-modifier nil)  ; Allow special characters
```

**Why this change?**

- ✅ Aligns with **Spacemacs defaults** and community standards
- ✅ Works with **all Emacs tutorials** without translation
- ✅ `Option` (Meta) is easier to reach than Command
- ✅ Leaves `Command` (Super) free for Mac-like shortcuts
- ✅ Prepares you for Spacemacs transition

**Before Spacemacs migration:**

- Update `init.el` with new modifier mapping
- Update all documentation to reflect: `M-x` = `Option-x`
- Practice with vanilla Emacs for 2-3 days to adjust muscle memory

### 2. **Add Mac-like Shortcuts via Super** (Medium Priority)

Since `Command` is `Meta`, you could add familiar shortcuts via `Option` (which is `Super`):

```elisp
;; Mac-like shortcuts using Option (Super)
(global-set-key (kbd \"s-s\") 'save-buffer)         ; Option-s to save
(global-set-key (kbd \"s-w\") 'kill-this-buffer)    ; Option-w to close
(global-set-key (kbd \"s-z\") 'undo)                ; Option-z to undo
(global-set-key (kbd \"s-c\") 'kill-ring-save)      ; Option-c to copy
(global-set-key (kbd \"s-v\") 'yank)                ; Option-v to paste
(global-set-key (kbd \"s-x\") 'kill-region)         ; Option-x to cut
(global-set-key (kbd \"s-a\") 'mark-whole-buffer)   ; Option-a select all
(global-set-key (kbd \"s-f\") 'isearch-forward)     ; Option-f to find
```

### 3. **Improve R Development Workflow** (Medium Priority)

Add more convenience bindings:

```elisp
;; ESS shortcuts
(global-set-key (kbd \"C-c r i\") 'ess-interrupt)           ; Interrupt R
(global-set-key (kbd \"C-c r e\") 'ess-eval-region-or-line) ; Eval smartly
(global-set-key (kbd \"C-c r d\") 'ess-rdired)              ; R object browser

;; Quick package dev
(global-set-key (kbd \"C-c r c\") 'ess-r-devtools-check-package)
(global-set-key (kbd \"C-c r b\") 'ess-r-devtools-build-package)
(global-set-key (kbd \"C-c r l\") 'ess-r-devtools-load-package)
(global-set-key (kbd \"C-c r x\") 'ess-r-devtools-test-package)
```

### 4. **Add Which-Key Prefix Descriptions** (Low Priority)

Make `C-c r` and `C-c o` discovery easier:

```elisp
(which-key-add-key-based-replacements
  \"C-c r\" \"r-devkit\"
  \"C-c r s\" \"s7\"
  \"C-c o\" \"obsidian\")
```

### 5. **Consider Hydra for Complex Workflows** (Low Priority)

Create a \"R Development\" hydra for related commands:

```elisp
(defhydra hydra-r-dev (:color blue)
  \"R Package Development\"
  (\"c\" ess-r-devtools-check-package \"check\")
  (\"b\" ess-r-devtools-build-package \"build\")
  (\"t\" ess-r-devtools-test-package \"test\")
  (\"l\" ess-r-devtools-load-package \"load\")
  (\"d\" ess-r-devtools-document \"document\")
  (\"q\" nil \"quit\"))

(global-set-key (kbd \"C-c r h\") 'hydra-r-dev/body)
```

---

## Spacemacs Transition Roadmap

### Pre-Migration (Week 0): Preparation

**Goal:** Prepare your current setup for smooth Spacemacs transition

1. **✅ Update Modifier Keys in init.el**

   ```elisp
   (setq mac-command-modifier 'super
         mac-option-modifier 'meta
         mac-right-option-modifier nil)
   ```

2. **✅ Update All Documentation**
   - Fix `docs_mkdocs/keybindings.md`
   - Fix `guides/TUTORIAL.md`
   - Fix `guides/CHEAT-SHEET.md`
   - Change all: `M-x` = `Option-x` (not Command-x)

3. **✅ Backup Current Config**

   ```bash
   # Backup your working config
   cp -r ~/.emacs.d ~/.emacs.d.backup
   cp init.el init.el.backup
   ```

4. **✅ Practice New Modifiers (2-3 days)**
   - Use vanilla Emacs with new modifier mapping
   - Build muscle memory for `Option` as Meta
   - Get comfortable before Spacemacs

---

### Migration Phase 1 (Week 1): Install & Basics

**Goal:** Get Spacemacs running with your essential R workflow

**Day 1-2: Installation**

```bash
# Backup and remove current config
mv ~/.emacs.d ~/.emacs.d.vanilla-backup

# Install Spacemacs (develop branch)
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d -b develop

# First launch
emacs
# Choose: vim editing style
# Choose layers: ess, osx, git, markdown
```

**Day 3-4: Port Essential Functions**

Create `~/.spacemacs` custom config:

```elisp
(defun dotspacemacs/user-config ()
  ;; Your emacs-r-devkit functions
  (load "~/path/to/emacs-r-devkit-functions.el")
  
  ;; Map to Spacemacs style
  (spacemacs/set-leader-keys-for-major-mode 'ess-r-mode
    "rr" 'emacs-r-devkit/insert-roxygen-skeleton
    "ur" 'emacs-r-devkit/usethis-use-r
    "ut" 'emacs-r-devkit/usethis-use-test
    "up" 'emacs-r-devkit/usethis-use-package-doc
    "sc" 'emacs-r-devkit/s7-insert-class
    "sm" 'emacs-r-devkit/s7-insert-method
    "sg" 'emacs-r-devkit/s7-insert-generic
    "ts" 'emacs-r-devkit/toggle-styler
    "ep" 'emacs-r-devkit/export-gui-path))
```

**Day 5-7: Learn Vim Basics**

- Follow `/guides/spacemacs-learning/02-LEARNING-CURRICULUM.md`
- Focus on Week 1 lessons (modal editing)
- Print cheat sheets from `/guides/spacemacs-learning/03-CHEAT-SHEETS.md`

---

### Migration Phase 2 (Week 2-3): Spacemacs Fluency

**Week 2:** Follow Spacemacs curriculum Week 2

- Master `SPC` leader key system
- Learn file/buffer/window management
- Integrate with your R projects

**Week 3:** Follow Spacemacs curriculum Week 3

- R development workflow with ESS layer
- Your custom keybindings (`SPC m r r`, etc.)
- Full R package development cycle

---

### Migration Phase 3 (Week 4): Optimization

**Week 4:** Follow Spacemacs curriculum Week 4

- Advanced features (macros, text objects)
- Magit integration
- Customize layers and appearance

---

### Post-Migration: Maintenance

**Create Spacemacs Layer for emacs-r-devkit**

Consider creating a custom layer:

```bash
mkdir -p ~/.spacemacs.d/layers/emacs-r-devkit
```

Structure:

```
emacs-r-devkit/
├── packages.el    # Dependencies
├── funcs.el       # Your functions
└── keybindings.el # Spacemacs-style bindings
```

This makes your config:

- ✅ Portable
- ✅ Shareable
- ✅ Maintainable

---

## Alternative: Gradual Migration

**Not ready for full Spacemacs?** Try General.el:

```elisp
;; Add to current init.el
(use-package general
  :config
  (general-create-definer space-leader
    :states '(normal visual insert emacs)
    :prefix "SPC"
    :non-normal-prefix "M-SPC"))

;; Add Evil mode
(use-package evil
  :init (setq evil-want-keybinding nil)
  :config (evil-mode 1))

;; Map your commands
(space-leader
  "ff" 'find-file
  "fs" 'save-buffer
  "bb" 'switch-to-buffer
  "mrr" 'emacs-r-devkit/insert-roxygen-skeleton
  ;; etc.
)
```

This gives you:

- Space leader key
- Modal editing (Evil)
- Your existing config
- Lighter than Spacemacs

---

## Decision Tree

```
Are you ready to commit to 4 weeks of learning?
│
├─ YES → Full Spacemacs Migration
│         Follow curriculum from Day 1
│         Expected productivity dip Week 1-2
│         Breakthrough in Week 3
│         Mastery in Week 4
│
└─ NO → Add Evil + General.el to current setup
          Keep familiar keybindings as fallback
          Gradually adopt SPC leader
          Less dramatic change
```

---

## Success Metrics

**Week 1:**

- [ ] Can navigate without arrow keys
- [ ] Entering/exiting insert mode is automatic
- [ ] Basic file operations work

**Week 2:**

- [ ] Using `SPC` commands naturally
- [ ] File/buffer navigation is fast
- [ ] No longer reaching for mouse

**Week 3:**

- [ ] R development workflow restored
- [ ] Roxygen documentation easy
- [ ] Productivity at 80% of before

**Week 4:**

- [ ] Faster than vanilla Emacs
- [ ] Creating custom bindings confidently
- [ ] Never going back!

---

## Resources for Migration

1. **Your Learning Materials:**
   - `/guides/spacemacs-learning/01-SPACEMACS-GUIDE.md`
   - `/guides/spacemacs-learning/02-LEARNING-CURRICULUM.md`
   - `/guides/spacemacs-learning/03-CHEAT-SHEETS.md`

2. **Official Spacemacs:**
   - [spacemacs.org](https://www.spacemacs.org)
   - [GitHub Issues](https://github.com/syl20bnr/spacemacs/issues)
   - [Gitter Chat](https://gitter.im/syl20bnr/spacemacs)

3. **Community:**
   - Reddit: r/spacemacs
   - Stack Overflow: [spacemacs] tag

---

## Final Recommendation

**Recommended Path:**

1. ✅ Switch modifiers NOW (Week 0)
2. ✅ Practice with vanilla Emacs 2-3 days
3. ✅ Install Spacemacs (Week 1, Day 1)
4. ✅ Follow 28-day curriculum strictly
5. ✅ No shortcuts - embrace the struggle
6. ✅ Week 3 will feel like victory

**You've chosen to learn. The hard way is the right way. Let's do this! 🚀**
