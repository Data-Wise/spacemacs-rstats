# Testing Integration

This document describes how to test keybindings and verify they work correctly.

## Automated Tests

The emacs-r-devkit includes **25 Emacs Lisp tests** that verify keybindings:

```bash
cd tests
./run_elisp_tests.sh
```

### Keybinding Tests

**`test-major-mode-leader-bindings`**

- Verifies R mode keybindings exist
- Tests `C-c r r` (roxygen)
- Tests `C-c r S` (styler toggle)

**`test-ess-eval-bindings`**

- Verifies `C-<return>` (send line to R)

## Manual Verification

### Test Roxygen Keybinding

1. Open R file: `emacs test.R`
2. Type a function:

   ```r
   my_func <- function(x, y) {
     x + y
   }
   ```

3. Move cursor before function
4. Press `C-c r r`
5. **Expected:** Roxygen skeleton inserted

### Test Styler Toggle

1. Press `C-c r S`
2. **Expected:** Message "Styler on save: disabled"
3. Press `C-c r S` again
4. **Expected:** Message "Styler on save: enabled"

### Test S7 Keybindings

1. Press `C-c r s c` (S7 class)
2. **Expected:** S7 class template inserted

## Edge Cases Tested

The test suite includes edge case tests for keybindings:

- **Non-R buffers:** Keybindings don't crash in wrong mode
- **Empty buffers:** Functions work in empty R buffers
- **No file:** Styler guard handles buffers without files

## See Also

- [Full Testing Guide](../TESTING-QUICK-REF.md)
- [Keybinding Summary](KEYBINDING-SUMMARY.md)
