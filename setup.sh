#!/bin/bash

set -e

INSTALL_DIR="/opt/pyserver"
PY_FILE="pyser.py"
SYMLINK="/usr/bin/pyser"
REPO_URL="https://raw.githubusercontent.com/andknownmaly/pyserver/refs/heads/main/pyser.py"

function motd() {
    clear
    echo "======================================="
    echo "     PySer Installer & Manager v1.0   "
    echo "======================================="
    echo "  Python HTTP Server + Basic Auth"
    echo "  Created for simplicity and security"
    echo "---------------------------------------"
    echo ""
}

function download_file() {
    local url="$1"
    local output="$2"

    if command -v wget &> /dev/null; then
        wget -q "$url" -O "$output"
    elif command -v curl &> /dev/null; then
        curl -sSL "$url" -o "$output"
    else
        echo "Neither wget nor curl is available. Please install one of them first."
        exit 1
    fi
}

function install_pyser() {
    echo "Installing pyser..."

    sudo mkdir -p "$INSTALL_DIR"
    download_file "$REPO_URL" "$INSTALL_DIR/$PY_FILE"
    sudo chmod +x "$INSTALL_DIR/$PY_FILE"
    sudo ln -sf "$INSTALL_DIR/$PY_FILE" "$SYMLINK"

    echo "pyser installed!"
    echo "    ➤ Jalankan dengan perintah: pyser"
}

function uninstall_pyser() {
    echo "Uninstalling pyser..."
    sudo rm -f "$SYMLINK"
    sudo rm -rf "$INSTALL_DIR"
    echo "pyser uninstalled!"
}

function main_menu() {
    while true; do
        motd
        echo "Pilih tindakan:"
        echo "1. Install pyser"
        echo "2. Uninstall pyser"
        echo "3. Exit"
        echo ""
        read -rp "Masukkan pilihan [1-3]: " pilihan

        case $pilihan in
            1)
                install_pyser
                read -rp "Tekan Enter untuk kembali ke menu..."
                ;;
            2)
                uninstall_pyser
                read -rp "Tekan Enter untuk kembali ke menu..."
                ;;
            3)
                echo "Bye :)"
                exit 0
                ;;
            *)
                echo "[!] Pilihan tidak valid!"
                sleep 1
                ;;
        esac
    done
}

main_menu
