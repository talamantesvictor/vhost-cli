#!/usr/bin/env bash

set -e

REPO_URL="https://raw.githubusercontent.com/talamantesvictor/vhost-cli/main/vhost"
INSTALL_DIR="/usr/local/bin"
BIN_NAME="vhost"

echo -e "\e[1m🚀 Installing vhost-cli...\e[0m"

# Download the script to a temp folder
curl -sL "$REPO_URL" -o "/tmp/$BIN_NAME"

# Execution permissions
chmod +x "/tmp/$BIN_NAME"

# Move it to /usr/local/bin (requires sudo)
echo "Requesting sudo privileges to move the script to $INSTALL_DIR..."
sudo mv "/tmp/$BIN_NAME" "$INSTALL_DIR/$BIN_NAME"

echo -e "\e[1m[OK] vhost installed successfully!\e[0m"
echo "You can now run '\e[1msudo vhost --help\e[0m' from anywhere."
