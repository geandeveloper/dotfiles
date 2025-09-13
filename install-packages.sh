#!/usr/bin/env bash
set -e

echo ">>> Updating APT and installing basic packages..."

# Update package list
sudo apt update

# Install basic packages
sudo apt install -y \
    git \
    tree \
    tmux \
    neovim \
    stow \
    wget \
    curl \
    ca-certificates \
    gnupg

# Install VS Code via Microsoft repo
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm microsoft.gpg
sudo apt update
sudo apt install -y code

echo ">>> All packages installed successfully!"
