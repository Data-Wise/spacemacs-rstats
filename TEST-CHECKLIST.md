# emacs-r-devkit Test Checklist

Use this checklist to verify your installation is working correctly.

## Pre-Test Setup

- [ ] Launch Emacs: `open -a Emacs` (or just `emacs`)
- [ ] Wait for package installation to complete (5-10 min on first launch)
- [ ] See startup message: `emacs-r-devkit loaded! [macOS GUI | 30.2] Key prefix: C-c r`
- [ ] Open test file: `C-x C-f test-features.R`

## Core Features

### ESS (Emacs Speaks Statistics)
- [ ] R mode activates automatically (see `ESS[R]` in mode line)
- [ ] Syntax highlighting works
- [ ] Code indentation works (press TAB on a line)

### Flycheck (Syntax Checking)
- [ ] See `FlyC` in mode line
- [ ] Red/yellow underlines appear on problematic code
- [ ] `C-c ! l` lists all errors
- [ ] `C-c ! n` navigates to next error

### Company Mode (Completion)
- [ ] Type `libr` and wait - completion popup appears
- [ ] `C-n/C-p` navigates suggestions
- [ ] `TAB` completes selection

### Which-Key
- [ ] Press `C-c r` and wait
- [ ] Popup shows available commands

## Custom Features

### Smart Roxygen Insertion
- [ ] `C-c r r` inserts roxygen skeleton above function
- [ ] Correctly parses function parameters
- [ ] Includes selected region as @examples

### Styler Integration
- [ ] Save file (`C-x C-s`) auto-formats code
- [ ] `C-c r S` toggles styler on/off
- [ ] Styler errors prevent save and show message

### S7 Helpers
- [ ] `C-c r s c` inserts S7 class skeleton
- [ ] `C-c r s m` inserts S7 method skeleton
- [ ] `C-c r s g` inserts S7 generic skeleton

### Usethis Integration (requires R package project)
- [ ] `C-c r u` creates R file with usethis::use_r()
- [ ] `C-c r t` creates test file with usethis::use_test()
- [ ] `C-c r p` creates package doc with usethis::use_package_doc()

### LSP Mode (requires R languageserver package)
- [ ] See `LSP` in mode line
- [ ] Hover shows documentation
- [ ] `M-.` goes to definition
- [ ] `C-c l` shows LSP commands

## Helper Scripts

### R Styler Checker
```bash
# Should exit 0 on well-styled file
Rscript ~/.emacs.d/bin/r-styler-check.R test-features.R
```
- [ ] Exits with code 0 for styled code
- [ ] Exits with code 1 and shows line number for unstyled code
- [ ] Exits with code 2 for errors

### GUI PATH Export (macOS only)
```bash
~/.emacs.d/bin/export-gui-path.sh
```
- [ ] Runs without errors
- [ ] Shows "Setting launchctl PATH..."
- [ ] Shows QUARTO_BIN if quarto is installed

## UI/UX

- [ ] Line numbers shown in programming modes
- [ ] Current line highlighted
- [ ] Matching parentheses highlighted
- [ ] Recent files accessible with `C-x C-r` (if recentf works)

## Optional Integrations

### Magit (Git)
- [ ] `C-x g` opens Magit status (if in git repo)

### Projectile
- [ ] `C-c p` shows projectile commands

### Quarto (if .qmd files present)
- [ ] Quarto mode loads for .qmd files
- [ ] Polymode active in .qmd files

### Markdown
- [ ] .md files use markdown-mode
- [ ] README.md uses gfm-mode

## Performance

- [ ] Startup time < 10 seconds (after initial package install)
- [ ] Flycheck doesn't lag when typing
- [ ] Company completion appears quickly (< 0.5s)
- [ ] No errors in *Messages* buffer (`C-h e`)

## Troubleshooting

If any tests fail, check:
1. *Messages* buffer: `C-h e`
2. *Warnings* buffer: `C-h w` (if exists)
3. R packages installed: lintr, styler, languageserver, usethis, devtools
4. Helper scripts executable: `ls -l ~/.emacs.d/bin/`
5. Flycheck configuration: `M-x flycheck-verify-setup`

## Report Results

After testing, note:
- Emacs version: _______________
- Platform: macOS _____________
- R version: _______________
- Issues encountered: _______________

---

**All tests passing?** Congratulations! Your emacs-r-devkit is ready for R package development!
