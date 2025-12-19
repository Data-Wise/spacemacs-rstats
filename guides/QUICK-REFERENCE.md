# Spacemacs-rstats Quick Reference Card

**Print this page for your desk!**

## Modal Editing

| Mode | Indicator | Enter | Exit |
|------|-----------|-------|------|
| Normal | `<N>` | `ESC` or `fd` | Default mode |
| Insert | `<I>` | `i`, `a`, `o` | `ESC` or `fd` |
| Visual | `<V>` | `v`, `V`, `C-v` | `ESC` or `fd` |

## Emergency Keys

| Key | Action |
|-----|--------|
| `ESC` or `fd` | Exit to Normal mode |
| `SPC q q` | Quit Spacemacs |
| `u` (Normal) | Undo |
| `C-g` | Cancel command |

## Files & Buffers

| Key | Action |
|-----|--------|
| `SPC f f` | Find file |
| `SPC f s` | Save file |
| `SPC f r` | Recent files |
| `SPC b b` | Switch buffer |
| `SPC b d` | Delete buffer |
| `SPC TAB` | Last buffer |

## Movement (Normal Mode)

| Key | Action |
|-----|--------|
| `h j k l` | ← ↓ ↑ → |
| `w` / `b` | Word forward/back |
| `0` / `$` | Line start/end |
| `gg` / `G` | Buffer start/end |
| `C-f` / `C-b` | Page down/up |

## Editing (Normal Mode)

| Key | Action |
|-----|--------|
| `i` | Insert before cursor |
| `a` | Insert after cursor |
| `o` | New line below |
| `O` | New line above |
| `d d` | Delete line |
| `y y` | Copy line |
| `p` | Paste after |
| `c w` | Change word |

## Windows & Projects

| Key | Action |
|-----|--------|
| `SPC w /` | Split right |
| `SPC w -` | Split below |
| `SPC w d` | Delete window |
| `SPC w h/j/k/l` | Navigate windows |
| `SPC p f` | Find file in project |
| `SPC p p` | Switch project |

## R Development

### R Console

| Key | Action |
|-----|--------|
| `SPC SPC R` | Start R |
| `, s l` | Send line to R |
| `, s r` | Send region to R |
| `, s b` | Send buffer to R |
| `, s s` | Switch to R console |

### R Package Development

| Key | Action |
|-----|--------|
| `, s b` | Build & load package |
| `, t p` | Run all tests |
| `, t f` | Test current file |
| `, r d` | Generate docs |

### Documentation

| Key | Action |
|-----|--------|
| `, h i` | Insert roxygen skeleton |
| `, h h` | Help at point |

### Code Navigation (LSP)

| Key | Action |
|-----|--------|
| `, g g` | Go to definition |
| `, g r` | Find references |
| `, g b` | Go back |
| `, r s` | Rename symbol |

## Error Checking

| Key | Action |
|-----|--------|
| `SPC e l` | List all errors |
| `SPC e n` | Next error |
| `SPC e p` | Previous error |

## Git (Magit)

| Key | Action |
|-----|--------|
| `SPC g s` | Git status |
| `s` (in Magit) | Stage |
| `u` (in Magit) | Unstage |
| `c c` (in Magit) | Commit |
| `P p` (in Magit) | Push |
| `F p` (in Magit) | Pull |

## Search

| Key | Action |
|-----|--------|
| `SPC s s` | Search buffer |
| `SPC s p` | Search project |
| `/` (Normal) | Search forward |
| `n` / `N` | Next/previous match |

## Help System

| Key | Action |
|-----|--------|
| `SPC ?` | Show all keybindings |
| `SPC h d k` | Describe key |
| `SPC h d f` | Describe function |
| `, ?` (R file) | Show R commands |

## Custom R Commands

| Key | Action |
|-----|--------|
| `, u r` | Create R file (use_r) |
| `, u t` | Create test file (use_test) |
| `, S c` | Insert S7 class |
| `, S m` | Insert S7 method |
| `, S g` | Insert S7 generic |

## Completion (Company)

| Key | Action |
|-----|--------|
| (automatic) | Shows after typing |
| `C-n` / `C-p` | Navigate suggestions |
| `TAB` or `RET` | Accept |
| `C-g` | Cancel |

## Pro Tips

1. **Discovery**: Press `SPC` and wait - which-key shows all commands!
2. **R Commands**: Press `, ?` in any R file to see R-specific commands
3. **Stuck?**: Press `ESC` or type `fd` quickly to return to Normal mode
4. **Learn Gradually**: Start with Survival Keys, add more each week
5. **Practice**: Muscle memory takes time - be patient!

## Common Workflows

### Document a Function

```
1. Place cursor on function
2. , h i          # Insert roxygen
3. Fill in @param, @return
4. , s b          # Build package
```

### Test Code Interactively

```
1. SPC SPC R      # Start R
2. Write code
3. , s l          # Send line to R
4. Check output
```

### Fix Errors

```
1. SPC e l        # List errors
2. SPC e n        # Jump to error
3. i              # Enter Insert mode
4. Fix code
5. ESC            # Back to Normal
6. SPC f s        # Save
```

---

**Version:** 1.0.0 | **Updated:** December 2024
**Website:** <https://data-wise.github.io/spacemacs-rstats/>
