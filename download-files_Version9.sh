#!/usr/bin/env bash
# download-files.sh
# Download repository files from the public GitHub repo Data-Wise/emacs-r-devkit
# into the current directory (root of your local project). Backups are made for
# any existing files before they are overwritten.
#
# Usage:
#   Save this file in the root of your local project, then:
#     chmod +x download-files.sh
#     ./download-files.sh
#
# The script is idempotent and will skip files that cannot be downloaded.
set -euo pipefail

REPO_OWNER="Data-Wise"
REPO_NAME="emacs-r-devkit"
BRANCH="main"
RAW_BASE="https://raw.githubusercontent.com/${REPO_OWNER}/${REPO_NAME}/${BRANCH}"

# Files to fetch (paths relative to repo root)
FILES=(
  "init.el"
  "install-init.sh"
  "bin/r-styler-check.R"
  "bin/export-gui-path.sh"
  ".lintr"
  ".github/workflows/ci.yml"
  "snippets/ess-mode/roxygen.skel"
  "docs/USAGE.md"
  "README.md"
  "LICENSE"
  "emacs-r-devkit.code-workspace"
)

TIMESTAMP="$(date +%Y%m%d%H%M%S)"
BACKUP_DIR=".download_backups/${TIMESTAMP}"

echo "Downloading files from ${REPO_OWNER}/${REPO_NAME}@${BRANCH}"
echo "Backup dir for overwritten files: ${BACKUP_DIR}"
mkdir -p "${BACKUP_DIR}"

download_file() {
  local path="$1"
  local url="${RAW_BASE}/${path}"
  local dest="${path}"
  local dest_dir
  dest_dir="$(dirname "${dest}")"

  # Ensure destination directory exists
  if [[ "${dest_dir}" != "." ]]; then
    mkdir -p "${dest_dir}"
  fi

  # If file exists, back it up
  if [[ -f "${dest}" ]]; then
    mkdir -p "${BACKUP_DIR}/$(dirname "${dest}")"
    cp -a "${dest}" "${BACKUP_DIR}/${dest}.bak"
    echo "Backed up existing ${dest} -> ${BACKUP_DIR}/${dest}.bak"
  fi

  # Download to a temp file, then move into place
  tmp="$(mktemp)"
  if curl -fsSL "${url}" -o "${tmp}"; then
    mv "${tmp}" "${dest}"
    echo "Downloaded: ${path}"
  else
    echo "Warning: Failed to download ${url} (skipping)" >&2
    rm -f "${tmp}"
    return 1
  fi

  return 0
}

failed=0
for f in "${FILES[@]}"; do
  download_file "${f}" || failed=$((failed+1))
done

# Make scripts executable where appropriate
chmod +x "install-init.sh" || true
chmod +x "bin/r-styler-check.R" || true
chmod +x "bin/export-gui-path.sh" || true

echo
if [[ $failed -eq 0 ]]; then
  echo "All files downloaded successfully."
else
  echo "Completed with ${failed} failed downloads. See messages above."
fi

echo "You can inspect backups in: ${BACKUP_DIR}"
echo "To install the Emacs config on this machine, run:"
echo "  ./install-init.sh"