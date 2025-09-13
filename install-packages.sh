#!/usr/bin/env bash
set -e

echo ">>> Updating APT and installing basic packages..."

# Update package list
sudo apt update

# Install basic packages
sudo apt install -y \
  build-essential \
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
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor >microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm microsoft.gpg
sudo apt update
sudo apt install -y code

echo ">>> Installing LazyVim..."

# Setup LazyVim for Neovim
NVIM_CONFIG_DIR="$HOME/.config/nvim"
if [ -d "$NVIM_CONFIG_DIR" ]; then
  echo ">>> LazyVim config already exists, skipping clone."
else
  mkdir -p "$NVIM_CONFIG_DIR"
  git clone https://github.com/LazyVim/starter.git "$NVIM_CONFIG_DIR" --depth 1
  echo ">>> LazyVim installed successfully!"
fi

echo ">>> Installing Tmux Plugin Manager (TPM)..."

TPM_DIR="$HOME/.tmux/plugins/tpm"
if [ -d "$TPM_DIR" ]; then
  echo ">>> TPM already installed, skipping clone."
else
  git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
  echo ">>> TPM installed successfully!"
fi

echo ">>> Updating Tmux plugins..."
# Install or update Tmux plugins via TPM
"$TPM_DIR"/bin/install_plugins || echo ">>> Plugins already installed or TPM not active."
"$TPM_DIR"/bin/update_plugins all || echo ">>> Plugins already up-to-date or TPM not active."

echo ">>> Setup completed!"
