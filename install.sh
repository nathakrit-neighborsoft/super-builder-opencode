#!/bin/sh
set -eu

REPO_OWNER="nathakrit-neighborsoft"
REPO_NAME="super-builder-opencode"
REF="${SUPER_BUILDER_REF:-main}"
BASE_URL="${SUPER_BUILDER_BASE_URL:-https://raw.githubusercontent.com/$REPO_OWNER/$REPO_NAME}"
BASE_URL="${BASE_URL%/}"

if [ -n "${OPENCODE_CONFIG_DIR:-}" ]; then
  CONFIG_DIR="$OPENCODE_CONFIG_DIR"
else
  CONFIG_DIR="$HOME/.config/opencode"
fi

download_file() {
  src="$1"
  dest="$2"
  url="$BASE_URL/$REF/$src"

  mkdir -p "$(dirname "$dest")"

  if command -v curl >/dev/null 2>&1; then
    curl -fsSL "$url" -o "$dest"
  elif command -v wget >/dev/null 2>&1; then
    wget -qO "$dest" "$url"
  else
    echo "Error: curl or wget is required." >&2
    exit 1
  fi
}

download_file "agent.md" "$CONFIG_DIR/agents/super-builder.md"

echo "Installed super-builder agent into: $CONFIG_DIR"
echo "- agents/super-builder.md"
