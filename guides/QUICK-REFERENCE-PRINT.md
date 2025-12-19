# Spacemacs-rstats Quick Reference Card

**Professional R Development Environment**

---

## Modal Editing Basics

| Mode | Enter | Exit | Purpose |
|------|-------|------|---------|
| **Normal** `<N>` | `ESC` / `fd` | Default | Navigate & manipulate |
| **Insert** `<I>` | `i` `a` `o` | `ESC` / `fd` | Type text |
| **Visual** `<V>` | `v` `V` `C-v` | `ESC` / `fd` | Select text |

---

## Emergency & Essential

| Key | Action | Key | Action |
|-----|--------|-----|--------|
| `ESC` / `fd` | Exit mode | `SPC f f` | Find file |
| `SPC q q` | Quit | `SPC f s` | Save file |
| `u` | Undo | `SPC b b` | Switch buffer |
| `C-g` | Cancel | `SPC TAB` | Last buffer |

---

## Movement (Normal Mode)

| Key | Action | Key | Action |
|-----|--------|-----|--------|
| `h` `j` `k` `l` | ← ↓ ↑ → | `w` / `b` | Word fwd/back |
| `0` / `$` | Line start/end | `gg` / `G` | Buffer start/end |
| `C-f` / `C-b` | Page down/up | `SPC j l` | Jump to line |

---

## Editing (Normal Mode)

| Key | Action | Key | Action |
|-----|--------|-----|--------|
| `i` | Insert before | `a` | Insert after |
| `o` | Line below | `O` | Line above |
| `d d` | Delete line | `y y` | Copy line |
| `p` | Paste after | `c w` | Change word |

---

## R Console

| Key | Action |
|-----|--------|
| `SPC SPC R` | Start R console |
| `, s l` | Send line to R |
| `, s r` | Send region to R |
| `, s b` | Send buffer to R |
| `, s s` | Switch to R console |

---

## R Package Development

| Key | Action |
|-----|--------|
| `, s b` | Build & load package |
| `, t p` | Run all tests |
| `, t f` | Test current file |
| `, r d` | Generate documentation |
| `, h i` | Insert roxygen skeleton |

---

## Code Navigation (LSP)

| Key | Action |
|-----|--------|
| `, g g` | Go to definition |
| `, g r` | Find references |
| `, g b` | Go back |
| `, r s` | Rename symbol |

---

## Windows & Projects

| Key | Action | Key | Action |
|-----|--------|-----|--------|
| `SPC w /` | Split right | `SPC w -` | Split below |
| `SPC w d` | Delete window | `SPC w h/j/k/l` | Navigate |
| `SPC p f` | Find in project | `SPC p p` | Switch project |

---

## Error Checking

| Key | Action |
|-----|--------|
| `SPC e l` | List all errors |
| `SPC e n` | Next error |
| `SPC e p` | Previous error |

---

## Git (Magit)

| Key | Action |
|-----|--------|
| `SPC g s` | Git status |
| `s` (Magit) | Stage |
| `u` (Magit) | Unstage |
| `c c` (Magit) | Commit |
| `P p` (Magit) | Push |

---

## Search & Help

| Key | Action | Key | Action |
|-----|--------|-----|--------|
| `SPC s s` | Search buffer | `SPC ?` | Show keys |
| `SPC s p` | Search project | `SPC h d k` | Describe key |
| `/` | Search forward | `, ?` | R commands |

---

## Custom R Commands

| Key | Action |
|-----|--------|
| `, u r` | Create R file (use_r) |
| `, u t` | Create test file (use_test) |
| `, S c` | Insert S7 class |
| `, S m` | Insert S7 method |

---

## Common Workflows

### Document a Function

```
1. Cursor on function
2. , h i          # Insert roxygen
3. Fill @param, @return
4. , s b          # Build package
```

### Test Code

```
1. SPC SPC R      # Start R
2. Write code
3. , s l          # Send line
4. Check output
```

### Fix Errors

```
1. SPC e l        # List errors
2. SPC e n        # Jump to error
3. i              # Insert mode
4. Fix code
5. ESC            # Normal mode
6. SPC f s        # Save
```

---

## Pro Tips

✓ **Discovery**: Press `SPC` and wait - which-key shows all commands!  
✓ **R Commands**: Press `, ?` in R files for R-specific commands  
✓ **Stuck?**: Press `ESC` or type `fd` quickly  
✓ **Learn Gradually**: Start with essentials, add more each week  
✓ **Practice**: Muscle memory takes time - be patient!

---

**Version:** 1.0.0 | **Updated:** December 2024  
**Website:** <https://data-wise.github.io/spacemacs-rstats/>  
**Print:** 2-sided, landscape orientation recommended
