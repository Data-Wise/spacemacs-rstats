# emacs-r-devkit

A curated Emacs configuration and helper scripts for R package development (including S7), Quarto/LaTeX writing, teaching statistics, Zotero/Obsidian integration, and a robust toolchain.

What this repo provides
- Emacs configuration (init.el) that:
  - Flycheck + lintr + external styler checker
  - Styler-on-save with a guard (save only if styler succeeds)
  - Smart roxygen insertion that parses function signatures and can use a selected region as `@examples`
  - Interactive usethis scaffolding (use_r, use_test, use_package_doc) that waits for created files and opens them
  - S7 class/method skeleton helpers
  - Launchctl PATH exporter and `exec-path-from-shell` integration so GUI Emacs finds R/Quarto
  - lsp-mode, company, vertico, consult, quarto/polymode, AUCTeX, pdf-tools, org enhancements, citar + obsidian
- Helper scripts in `~/.emacs.d/bin/`:
  - `r-styler-check.R` — external R helper used by Flycheck to detect styler diffs
  - `export-gui-path.sh` — exports login shell PATH to `launchctl` so GUI apps (Emacs.app) see same PATH
- Installer script `install-init.sh` which backs up existing init.el and installs the configuration and helper scripts
- GitHub Actions CI workflow that runs lintr and a styler check
- Yasnippet skeleton for roxygen & S7 templates
- Example `.lintr` for project-level lintr settings

Quick install (local)
1. Ensure prerequisites:
   - Emacs 27+ (emacs-plus via Homebrew recommended on macOS)
   - R and Rscript available on your PATH
   - Recommended R packages (run once in R):
     ```r
     install.packages(c("languageserver","lintr","styler","devtools","usethis","roxygen2","testthat","remotes","s7"))
     remotes::install_github("r-lib/s7") # optional
     ```
   - On macOS, Better BibTeX for Zotero (if using citar)

2. Save repo files locally (structure shown in repo) and run:
   ```bash
   # backup existing Emacs init
   cp ~/.emacs.d/init.el ~/.emacs.d/init.el.bak.$(date +%Y%m%d%H%M%S)
   # from your repo directory where install-init.sh and init.el are present
   ./install-init.sh
