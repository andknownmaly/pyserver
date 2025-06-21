#!/bin/bash

set -e

INSTALL_DIR="/opt/pyserver"
PY_FILE="pyser.py"
SYMLINK="/usr/bin/pyser"
REPO_URL="https://raw.githubusercontent.com/andknownmaly/pyserver/refs/heads/main/pyser.py"

echo "Installing pyser..."

if command -v wget &> /dev/null; then
    DOWNLOADER="wget -q $REPO_URL -O $INSTALL_DIR/$PY_FILE"
elif command -v curl &> /dev/null; then
    DOWNLOADER="curl -sSL $REPO_URL -o $INSTALL_DIR/$PY_FILE"
else
    echo "curl atau wget tidak ditemukan."
    exit 1
fi

sudo mkdir -p "$INSTALL_DIR"
eval sudo $DOWNLOADER
sudo chmod +x "$INSTALL_DIR/$PY_FILE"
sudo ln -sf "$INSTALL_DIR/$PY_FILE" "$SYMLINK"

echo "pyser berhasil diinstal. Gunakan: pyser"
