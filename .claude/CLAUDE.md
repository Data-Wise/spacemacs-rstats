# emacs-r-devkit - Project Knowledge

**Professional Emacs environment for R package development on macOS**

This file provides context for Claude Code when working on the emacs-r-devkit project.

---

## ⚡ Claude Code StatusLine

**Status:** ✅ Configured and working
**Location:** `~/.claude/statusline-p10k.sh`
**Update Interval:** 300ms (built into Claude Code)

### Configuration
- **Global:** `~/.claude/settings.json` (all projects)
- **Project:** `.claude/settings.local.json` (this project)
- **Helper:** `add-statusline-to-project` (add to any project)

### Display
```
╭─ ░▒▓ ⚙️ emacs-r-devkit  main ▓▒░
╰─ Sonnet 4.5 │ 11:10 │ ⏱ 2m │ +156/-23 │ ⚡84% W:11%
```

**Features:**
- Project type icons (📦 R, 📓 Quarto, ⚙️ Emacs, 🟢 Node, 🐍 Python, 🔌 MCP)
- Git status (branch, dirty indicator, ahead/behind)
- Session duration and current time
- Lines changed (+green/-red) - removed cost display per user preference
- Quota tracking (session & weekly with color coding)

### Test Suite
- **Location:** `~/.claude/tests/` (57 comprehensive tests)
- **Quick test:** `~/.claude/tests/quick-test.sh`
- **Visual test:** `~/.claude/tests/test-visual-statusline.sh`
- **Diagnostic:** `~/.claude/tests/diagnose-statusline.sh`

### Documentation
- **Session summary:** `STATUSLINE-WORK-SUMMARY.md`
- **Troubleshooting:** `~/.claude/tests/STATUSLINE-DISPLAY-GUIDE.md`
- **Bypass mode fix:** `~/.claude/tests/BYPASS-MODE-FIX.md`

---

## 🎯 Project Overview

**Purpose:** Complete Emacs configuration optimized for R package development on macOS

**Key Features:**
- ESS (Emacs Speaks Statistics) integration
- Flycheck with lintr and styler
- LSP mode with R languageserver
- Company completion
- Roxygen2 automation with parameter detection
- S7 OOP system support
- Auto-formatting with styler on save

**Target Users:** R package developers using macOS who prefer Emacs

---

## 📂 Project Structure

### Organized Folders (as of 2025-12-07)

```
emacs-r-devkit/
├── standards/          # Documentation standards for Data-Wise projects
├── guides/             # User guides (TUTORIAL, CHEAT-SHEET, TROUBLESHOOTING)
├── tests/              # Test files (test-features.R, test-roxygen.R)
├── assets/             # Screenshots and media
├── bin/                # Helper scripts (r-styler-check.R, export-gui-path.sh)
├── docs_mkdocs/        # MkDocs website content
├── snippets/           # Emacs snippets (ess-mode/)
├── init.el             # Main Emacs configuration
├── install-init.sh     # Installation script
└── check-dependencies.sh # Dependency verification
```

**See:** [PROJECT_STRUCTURE.md](../PROJECT_STRUCTURE.md) for complete structure

### Key Files

**Configuration:**
- `init.el` - Main Emacs configuration (22KB, ~600 lines)
- `install-init.sh` - Installs init.el to ~/.emacs.d/
- `.lintr` - Lintr configuration for R code checking

**Scripts:**
- `bin/r-styler-check.R` - External Flycheck checker for styler
- `bin/export-gui-path.sh` - PATH exporter for macOS GUI Emacs

**Documentation:**
- `guides/TUTORIAL.md` - Complete user guide
- `guides/CHEAT-SHEET.md` - Quick keybinding reference
- `guides/TROUBLESHOOTING.md` - Problem solving guide
- `PROJECT_STRUCTURE.md` - Project organization

**Testing:**
- `tests/test-features.R` - Interactive feature testing
- `tests/test-roxygen.R` - Roxygen generation testing
- `tests/TEST-CHECKLIST.md` - Verification checklist

**Website:**
- `docs_mkdocs/` - MkDocs Material site content
- `mkdocs.yml` - MkDocs configuration
- Deployed to: https://data-wise.github.io/emacs-r-devkit/

**Standards (separate purpose):**
- `standards/` - Documentation standards for Data-Wise projects
- Used across multiple repositories (not specific to emacs-r-devkit)

---

## 🔧 Key Technologies

### Emacs Packages (installed via MELPA)

**Core:**
- `ess` - Emacs Speaks Statistics
- `flycheck` - Syntax checking framework
- `lsp-mode` - Language Server Protocol
- `company` - Completion framework
- `magit` - Git interface

**UI/Navigation:**
- `vertico` - Vertical completion UI
- `consult` - Consulting completing-read
- `which-key` - Keybinding help
- `projectile` - Project management

**R-specific:**
- `yasnippet` - Snippets (S7 support)
- Custom flycheck checker for styler
- Roxygen2 skeleton insertion with parameter detection

### R Packages (required)

**Development:**
- `devtools`, `usethis`, `roxygen2`, `testthat`

**Quality:**
- `lintr`, `styler`, `languageserver`

**Optional:**
- `s7`, `pkgdown`, `covr`

### System Requirements

- macOS 12.0+ (Monterey or later)
- Emacs 27.1+ (30.0+ recommended, emacs-plus preferred)
- R 4.0+
- Git 2.0+
- Homebrew (recommended)

---

## 💻 Development Workflow

### For emacs-r-devkit itself

```bash
# Edit configuration
emacs init.el

# Test changes
emacs -Q -l init.el  # Test in clean environment

# Update documentation
mkdocs serve         # Preview docs locally

# Run dependency check
./check-dependencies.sh

# Commit changes
git add .
git commit -m "Description"
git push
```

### For users of emacs-r-devkit

```bash
# Install
./install-init.sh

# Verify
./check-dependencies.sh
emacs tests/test-features.R

# Use
cd ~/R-packages/active/mypackage
emacs .
# C-c r r  - Insert Roxygen
# C-RET    - Send to R
# M-.      - Go to definition
```

---

## 🎨 Code Style

### Emacs Lisp (init.el)

**Conventions:**
- Sections marked with `;;; SECTION NAME`
- Comments use `;;` for section headers, `;` for inline
- Package configuration grouped logically
- Custom functions prefixed with `dt-` or `emacs-r-devkit-`

**Key Sections:**
1. Package Management (MELPA setup)
2. UI Configuration (theme, fonts)
3. Editing Enhancements (company, yasnippet)
4. Navigation (vertico, consult)
5. R Development (ESS, flycheck, LSP)
6. Version Control (magit)
7. Document Editing (quarto, latex, org)

### R Code (test files, examples)

**Follow:**
- tidyverse style guide
- styler formatting (auto-applied on save)
- lintr rules (defined in .lintr)

---

## 🔑 Important Keybindings

**macOS-specific:**
- Option (⌥) = Meta in Emacs
- Control (⌃) = Control
- Command (⌘) = Super (limited use)

**Essential:**
- `C-g` - Cancel (most important!)
- `C-x C-f` - Find file
- `C-x C-s` - Save
- `M-x` - Execute command
- `C-c r r` - Insert Roxygen skeleton
- `C-RET` - Send to R console
- `M-.` - Go to definition
- `C-c ! l` - List flycheck errors

**See:** [guides/CHEAT-SHEET.md](../guides/CHEAT-SHEET.md) for complete list

---

## 🐛 Known Issues & Solutions

### Common Problems

**Issue:** First launch takes 10-15 minutes
**Solution:** Normal - downloading and compiling MELPA packages

**Issue:** Flycheck not finding lintr
**Solution:** Install R packages: `install.packages(c("lintr", "styler"))`

**Issue:** LSP mode not working
**Solution:** Install languageserver: `install.packages("languageserver")`

**Issue:** PATH not set in GUI Emacs
**Solution:** Run `~/.emacs.d/bin/export-gui-path.sh` once

**See:** [guides/TROUBLESHOOTING.md](../guides/TROUBLESHOOTING.md) for comprehensive guide

---

## 📦 Integration with Other Projects

### Data-Wise Ecosystem

**emacs-r-devkit** is part of the Data-Wise development toolchain:

1. **emacs-r-devkit** - This project (Emacs IDE)
2. **claude-r-dev** - AI-powered R development framework
3. **zsh-environment** - Shell configuration
4. **r-package-development.md** - R workflow skill
5. **MediationVerse packages** - R packages using this environment

### Workflow Integration

Users typically combine:
- emacs-r-devkit (editing, interactive development)
- Terminal aliases (rtest, rdoc, rcheck, rdev)
- Claude Code (AI assistance)
- Git/GitHub (version control)

---

## 📚 Documentation Standards

### This Project (emacs-r-devkit)

Uses **MkDocs** for documentation:
- Material theme
- Deployed to GitHub Pages
- Source in `docs_mkdocs/`
- Built with `mkdocs build`

**Navigation:**
- Home → Getting Started → Features → Keybindings → Configuration → Troubleshooting → Testing

### Standards in standards/

**Separate purpose:** Documentation standards for OTHER Data-Wise projects

**Two standards:**
1. `DOCUMENTATION_STANDARDS.md` - MkDocs standards (tools/frameworks)
2. `MEDIATIONVERSE_STANDARDS.md` - pkgdown standards (R packages)

**Use claude-r-dev pattern:**
- Specialized tutorials dropdown
- Usage → What it does → When to use → Example format
- Minimal admonitions, clean appearance

**Integration:**
- Skill: `data-wise-documentation`
- Referenced in: `~/.claude/skills/data-wise-documentation.md`

---

## 🧪 Testing

### Automated Tests

```bash
# Dependency check
./check-dependencies.sh
```

### Manual Testing

```bash
# Interactive feature test
emacs tests/test-features.R
# Follow prompts, execute code with C-RET

# Roxygen test
emacs tests/test-roxygen.R
# Test C-c r r on different function signatures

# Systematic verification
# Follow tests/TEST-CHECKLIST.md
```

### Verification Checklist

1. ESS integration (R console starts, code executes)
2. Flycheck (shows lintr/styler errors)
3. LSP (go to definition works)
4. Company (completion popup appears)
5. Roxygen (inserts skeleton with parameters)
6. Auto-format (styler on save)
7. Magit (git status works)

---

## 🚀 Deployment

### Documentation Site

```bash
# Local preview
mkdocs serve

# Deploy (automatic via GitHub Actions)
git push  # Triggers .github/workflows/mkdocs.yml
```

### Installation for Users

```bash
# User runs:
git clone https://github.com/Data-Wise/emacs-r-devkit.git
cd emacs-r-devkit
./install-init.sh
./check-dependencies.sh
```

---

## 🤝 Contributing

**Guidelines:** [CONTRIBUTING.md](../CONTRIBUTING.md)

**Common contributions:**
- Bug fixes to init.el
- Documentation improvements
- New snippets for ess-mode/
- Test cases
- Keybinding enhancements

**Testing changes:**
1. Edit init.el
2. Test in clean environment: `emacs -Q -l init.el`
3. Run dependency check
4. Update docs if needed
5. Create PR

---

## 📝 File Patterns

### When editing:

**init.el:**
- Add new packages to `use-package` declarations
- Group related configurations together
- Test in clean environment before committing

**docs_mkdocs/*.md:**
- Use Material for MkDocs syntax
- Include code examples with language tags
- Reference keybindings with macOS notation (⌃, ⌥, ⌘)

**guides/*.md:**
- Keep TUTORIAL comprehensive but scannable
- Keep CHEAT-SHEET concise (1-2 pages)
- TROUBLESHOOTING: Symptom → Cause → Solution format

**tests/*.R:**
- Include comments explaining what to test
- Provide expected outcomes
- Test edge cases (complex function signatures for Roxygen)

---

## 🔗 External References

**Documentation:**
- [ESS Manual](https://ess.r-project.org/)
- [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/)
- [R Packages Book](https://r-pkgs.org/)
- [GNU Emacs Manual](https://www.gnu.org/software/emacs/manual/)

**Related Projects:**
- [claude-r-dev](https://data-wise.github.io/claude-r-dev/)
- [Data-Wise GitHub](https://github.com/Data-Wise)

---

## ⚡ Quick Tips for Claude Code

### When asked to:

**"Fix a bug in init.el"**
→ Read init.el, understand context, test change in clean environment

**"Update documentation"**
→ Edit appropriate file in docs_mkdocs/ or guides/
→ Preview with `mkdocs serve` if changing docs_mkdocs/

**"Add a new feature"**
→ Add use-package declaration in appropriate section of init.el
→ Update docs_mkdocs/features.md
→ Add test case if applicable

**"Improve Roxygen detection"**
→ Edit the roxygen insertion function in init.el
→ Test with tests/test-roxygen.R
→ Handle edge cases (S7 classes, methods, complex signatures)

**"Document for other projects"**
→ Refer to standards/ directory
→ Use appropriate standard (DOCUMENTATION_STANDARDS.md or MEDIATIONVERSE_STANDARDS.md)
→ Invoke skill: data-wise-documentation

---

**Last Updated:** 2025-12-07
**Version:** 2.0 (Reorganized structure)
**Primary Contact:** Data-Wise GitHub Issues
