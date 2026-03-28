#!/bin/bash

set -e

SCRIPT_DIR="$(dirname "$(realpath "$0")")"
source "$SCRIPT_DIR/../config.sh"

TEMP_DIR="$SCRIPT_DIR"
mkdir -p "$TEMP_DIR"

GZ_TEMPLATE="$TEMP_DIR/TemplateVM.qcow2.gz"
TEMPLATE_PATH="$TEMP_DIR/TemplateVM.qcow2"

if [ ! -f "$GZ_TEMPLATE" ]; then
    echo "Downloading template from GitHub Releases..."
    wget -O "$GZ_TEMPLATE" "$GITHUB_RELEASE_URL"
fi

if [ ! -f "$TEMPLATE_PATH" ]; then
    echo "Unpacking template..."
    gzip -dc "$GZ_TEMPLATE" > "$TEMPLATE_PATH"
fi

qemu-system-x86_64 \
    -name TemplateVM \
    -m 2048 -smp 2 \
    -drive file="$TEMPLATE_PATH",format=qcow2 \
    -boot c \
    -netdev user,id=net0 -device e1000,netdev=net0 \
    -enable-kvm \
    -nographic \
    -serial mon:stdio \
    -virtfs local,path="$SHARED_DIR_PATH",mount_tag=shared0,security_model=mapped,id=shared0
