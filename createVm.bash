#!/bin/bash

set -e

SCRIPT_DIR="$(dirname "$(realpath "$0")")"
source "$SCRIPT_DIR/config.sh"

mkdir -p "$HOME/template"

if [ ! -f "$GZ_TEMPLATE" ]; then
    echo "Downloading template from GitHub Releases..."
    wget -O "$GZ_TEMPLATE" "$GITHUB_RELEASE_URL"
fi

if [ ! -f "$TARGET_PATH" ]; then
    echo "Creating VM from template..."
    gzip -dc "$GZ_TEMPLATE" > "$TARGET_PATH"
    echo "VM created at $TARGET_PATH"
fi

echo "VM ready. Root password is 'root'"
