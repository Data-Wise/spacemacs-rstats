#!/usr/bin/env bash
# ~/.emacs.d/bin/export-gui-path.sh
# Export the login shell PATH to launchctl so GUI apps launched later inherit it.
set -euo pipefail
SHELL_CMD="${SHELL:-/bin/zsh}"
PATH_VAL="$($SHELL_CMD -lc 'printf "%s" "$PATH"')"
if [ -z "$PATH_VAL" ]; then
  echo "Could not determine PATH from login shell ($SHELL_CMD)." >&2
  exit 1
fi
echo "Setting launchctl PATH..."
/bin/launchctl setenv PATH "$PATH_VAL"
# Export QUARTO_BIN if quarto exists
QUARTO_BIN="$(command -v quarto || true)"
if [ -n "$QUARTO_BIN" ]; then
  /bin/launchctl setenv QUARTO_BIN "$QUARTO_BIN"
  echo "Set QUARTO_BIN to $QUARTO_BIN"
fi
echo "Done. You may need to restart GUI apps or log out/login for changes to take effect."
