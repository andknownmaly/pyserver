#!/bin/bash

set -e

INSTALL_DIR="/opt/pyserver"
SYMLINK="/usr/bin/pyser"

echo "Menghapus pyser..."

sudo rm -f "$SYMLINK"
sudo rm -rf "$INSTALL_DIR"

echo "pyser berhasil dihapus dari sistem."
