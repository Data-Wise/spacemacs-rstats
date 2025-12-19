# spacemacs-rstats

**Context for Gemini Agent**

## Project Overview

`spacemacs-rstats` is a professional **Spacemacs** configuration for R package development on macOS. It provides a batteries-included, Vim-style modal editing environment that integrates ESS (Emacs Speaks Statistics), LSP (Language Server Protocol), and modern development tools to rival commercial IDEs.

**Key Goals:**

- Provide a robust R package development workflow (devtools, testthat, roxygen2).
- Leverage Spacemacs' discoverable, mnemonic keybindings for efficient navigation.
- Automate tedious tasks like formatting (styler), documentation (roxygen2 skeletons), and dependency checking.
- Seamless integration with macOS (PATH synchronization, keybindings).
- Support for modern R features like the S7 object-oriented system.
- ADHD-friendly documentation with TL;DR boxes and visual progress indicators.

## Technical Stack

- **Core:** GNU Emacs 27.1+ (30.0+ recommended), Spacemacs (develop branch), R 4.0+, Shell (Bash/Zsh).
- **Spacemacs Layers:** auto-completion, helm, emacs-lisp, git, markdown, org, syntax-checking, version-control, ess, lsp.
- **Emacs Packages:** ESS, LSP Mode, Flycheck, Company, Magit, Which-Key, Helm, Yasnippet.
- **R Tooling:** `lintr`, `styler`, `roxygen2`, `languageserver`, `s7`, `devtools`, `usethis`, `testthat`.
- **Documentation:** MkDocs (Material theme).
- **CI/CD:** GitHub Actions (for documentation deployment).

## Architecture & Directory Structure

- **`config/dotspacemacs.el`**: Main Spacemacs configuration file (installed to `~/.spacemacs`).
- **`config/init.el`**: Legacy vanilla Emacs config (archived, not actively used).
- **`config/snippets/`**: Yasnippet templates for R development.
- **`bin/`**: Helper scripts (deprecated, moved to `scripts/`).
- **`scripts/`**: Installation, health check, repair, and utility scripts.
- **`guides/`**: User-facing documentation (Tutorials, Cheat Sheets, Troubleshooting).
- **`docs/mkdocs/`**: Source files for the MkDocs static documentation site.
- **`tests/`**: Verification scripts (`test-features.R`), test fixtures, and checklists.
- **`project-docs/`**: Internal project documentation (GEMINI.md, KNOWLEDGE_INDEX.md, etc.).

## Building and Running

### Installation

The project uses automated installation scripts:

```bash
# Clone and install
git clone https://github.com/Data-Wise/spacemacs-rstats.git
cd spacemacs-rstats
./scripts/install.sh
```

The installer:

1. Checks system requirements (macOS 12+, disk space, network)
2. Installs Homebrew (if needed)
3. Installs Emacs with native compilation
4. Installs Spacemacs (develop branch)
5. Copies `config/dotspacemacs.el` to `~/.spacemacs`
6. Installs required R packages
7. Runs health checks

### Verification

Always verify the environment after installation or changes:

```bash
# Comprehensive health check
./scripts/health-check.sh

# Pre-flight checks only
./scripts/health-check.sh --pre-flight

# Check dependencies
./scripts/check-dependencies.sh
```

### Running

- **Terminal:** `emacs` or `emacs -nw` (no window)
- **GUI:** `open -a Emacs` (or launch via Spotlight)
- **First launch:** Takes 10-15 minutes (Spacemacs installs packages automatically)

### Documentation

The documentation site is built with MkDocs:

```bash
# Preview locally
mkdocs serve

# Build static site
mkdocs build

# Deploy to GitHub Pages (via CI/CD)
git push origin main
```

## Development Conventions

### Branching Strategy

- **`main`**: Stable, production-ready code.
- **`dev`**: Active development branch. All feature branches should target `dev`.
- **`feature/*`**: Feature branches for new features.
- **`fix/*`**: Bug fix branches.

### Commit Messages

Follow [Conventional Commits](https://www.conventionalcommits.org/):

- `feat:` New features.
- `fix:` Bug fixes.
- `docs:` Documentation changes.
- `chore:` Maintenance, dependency updates.
- `test:` Test additions or modifications.

### Code Style

- **R:** Tidyverse style guide. Enforced by `lintr` and `styler`.
- **Emacs Lisp:** Standard conventions. Custom functions must be prefixed with `spacemacs-rstats/`.
- **Spacemacs Configuration:** Follow Spacemacs conventions for layer configuration.

### Testing

- **Automated Checks:** `scripts/health-check.sh` and `scripts/check-dependencies.sh` ensure the environment is correct.
- **Interactive Testing:** Use `tests/test-features.R` inside Emacs to verify IDE features (completion, linting, etc.).
- **Manual Verification:** Follow `tests/TEST-CHECKLIST.md` before merging PRs.
- **Unit Tests:** 4-tier test suite (Documentation, Elisp, R, Integration) with 59 total tests.

## Key Configuration Details (`config/dotspacemacs.el`)

- **Distribution:** Spacemacs (full distribution, not spacemacs-base).
- **Editing Style:** Vim (modal editing with Evil mode).
- **Layers:** auto-completion, helm, git, syntax-checking, lsp, ess, org, markdown.
- **Leader Key:** `SPC` (Space) - primary entry point for all commands.
- **Major Mode Leader:** `,` (comma) - mode-specific commands (equivalent to `SPC m`).
- **Which-Key:** Enabled with 0.4s delay for discoverable keybindings.
- **Custom Functions:** Defined in `dotspacemacs/user-config`:
  - `spacemacs-rstats/insert-roxygen-skeleton`: Smart roxygen2 documentation insertion.
  - `spacemacs-rstats/style-buffer-with-guard`: Safe auto-formatting with styler.
  - `spacemacs-rstats/s7-*`: Snippets for S7 OOP (class, method, generic).
  - `spacemacs-rstats/export-path-macos`: Export PATH for macOS GUI Emacs.

## Recent Improvements (Phase 5 - December 2024)

- **ADHD-Friendly Documentation:** Added TL;DR boxes to key pages.
- **Visual Progress Indicators:** Installer shows progress bars and checkmarks.
- **Simplified README:** Quick Start section with copy-paste installation.
- **Installation Checkpoint Script:** `scripts/checkpoint.sh` for resuming interrupted installs.
- **Spacemacs Customization Guide:** `project-docs/STATUSLINE-QUICKSTART.md`.
- **Removed Projectile Layer:** Built-in to Spacemacs, no longer needed as explicit layer.

## Common Workflows

### Starting R Development

```bash
cd ~/R-packages/active/mypackage
emacs .  # Opens in Spacemacs
```

In Spacemacs:

1. `SPC SPC R` - Start R console
2. Edit R files with modal editing
3. `, s l` - Send line to R
4. `, h i` - Insert roxygen skeleton
5. `, g g` - Jump to definition
6. `SPC e l` - List syntax errors

### Package Development Cycle

```bash
# In Spacemacs
, s b     # Build and load package
, t p     # Run all tests
, r d     # Generate documentation

# In terminal (for final checks)
rtest     # Run tests
rdoc      # Build documentation
rcheck    # R CMD check
```

### Troubleshooting

```bash
# Health check
./scripts/health-check.sh

# Repair installation
./scripts/repair.sh

# Reinstall from scratch
./scripts/install.sh --force
```

## Integration with Data-Wise Ecosystem

- **zsh-claude-workflow:** Terminal workflow automation.
- **r-package-development:** R package development aliases and functions.
- **docs-standards:** Shared documentation standards across projects.
- **medfit, mediationverse:** R packages developed with this environment.
- **homebrew-tap:** Homebrew distribution via `brew tap data-wise/tap`.

## Phase 6: Homebrew Distribution (In Progress)

**Goal:** Enable installation via `brew install spacemacs-rstats`

**Tap Location:** `~/projects/dev-tools/homebrew-tap`

**Status:** Formula designed, awaiting:

1. Fresh tarball creation with latest docs
2. GitHub release v1.0.0
3. Formula deployment to tap

**Installation (After Release):**

```bash
brew tap data-wise/tap
brew install spacemacs-rstats
spacemacs-rstats-install
```
