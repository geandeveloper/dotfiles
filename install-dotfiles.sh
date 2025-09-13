#!/usr/bin/env bash
set -e

echo ">>> Applying dotfiles with stow..."

cd "$(dirname "$0")"

# -----------------------------
# Stow dotfiles
# -----------------------------
echo ">>> Stowing dotfiles..."

stow git
stow nvim
stow tmux

# Stow SSH separately to ~/.ssh
stow -t ~/.ssh ssh

echo ">>> Dotfiles linked successfully!"

# -----------------------------
# Install / Update Neovim plugins
# -----------------------------
echo ">>> Installing/Updating Neovim plugins..."

# Headless Neovim command: installs missing plugins and updates existing ones
nvim --headless -c "Lazy sync" -c "qa"

echo ">>> Neovim plugins installed/updated!"
