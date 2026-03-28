#!/bin/bash

# VM settings
VM_NAME="WorkspaceVm"
DISK_NAME="$VM_NAME.qcow2"
DISK_PATH="$HOME/$DISK_NAME"
DISK_SIZE="200G"

TEMPLATE_PATH="$(realpath ./template/TemplateVM.qcow2)"
ISO_PATH="$(realpath ./template/archlinux.iso)"

SHARED_DIR_PATH="$HOME/projects/Vmdirs"

GITHUB_RELEASE_URL="https://github.com/Sqydev/Vm-spaces/releases/download/v1.0/TemplateVM.qcow2.gz"

TARGET_PATH="$HOME/$DISK_NAME"
GZ_TEMPLATE="$HOME/template/TemplateVM.qcow2.gz"

RAM=2048 # MB
CPU=2 # cores
