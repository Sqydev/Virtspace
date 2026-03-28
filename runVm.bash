#!/bin/bash

set -e

source "$(dirname "$(realpath "$0")")/config.sh"

qemu-system-x86_64 \
    -name "$VM_NAME" \
    -m $RAM \
    -smp $CPU \
    -drive file="$DISK_PATH",format=qcow2 \
    -boot order=c \
    -netdev user,id=net0 -device e1000,netdev=net0 \
    -enable-kvm \
    -nographic \
    -serial mon:stdio \
    -virtfs local,path="$SHARED_DIR_PATH",mount_tag=shared0,security_model=mapped,id=shared0
