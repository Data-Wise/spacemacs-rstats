#!/usr/bin/env bash
# install-init.sh
# Back up existing ~/.emacs.d/init.el, install new init.el and helper scripts to ~/.emacs.d/bin
set -euo pipefail
EMACS_D="$HOME/.emacs.d"
BIN_DIR="$EMACS_D/bin"
BACKUP_DIR="$EMACS_D/backups"
TIMESTAMP="$(date +%Y%m%d%H%M%S)"
mkdir -p "$EMACS_D" "$BIN_DIR" "$BACKUP_DIR"
if [ -f "$EMACS_D/init.el" ]; then
  cp -a "$EMACS_D/init.el" "$BACKUP_DIR/init.el.bak.$TIMESTAMP"
fi
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
INIT_SOURCE="$PROJECT_ROOT/config/init.el"

if [ -f "$INIT_SOURCE" ]; then
  install -m 644 "$INIT_SOURCE" "$EMACS_D/init.el"
else
  echo "ERROR: init.el not found at $INIT_SOURCE" >&2
  exit 2
fi
for f in r-styler-check.R export-gui-path.sh; do
  if [ -f "$SCRIPT_DIR/bin/$f" ]; then
    install -m 755 "$SCRIPT_DIR/bin/$f" "$BIN_DIR/$f"
  else
    echo "Warning: helper script $f not found in $SCRIPT_DIR/bin; skipping."
  fi
done
echo "Installation complete."
