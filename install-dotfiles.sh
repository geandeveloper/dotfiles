#!/usr/bin/env bash
set -e

echo ">>> Applying dotfiles with stow..."

cd "$(dirname "$0")"

# -----------------------------
# Stow dotfiles
# -----------------------------
echo ">>> Stowing dotfiles..."

# Always overwrite existing files
stow -R --adopt git
stow -R --adopt nvim
stow -R --adopt tmux
stow -R --adopt zsh

# Stow SSH separately to ~/.ssh
stow -R --adopt -t ~/.ssh ssh

# Stow Tmux separately to ~/.tmux
stow -R --adopt -t ~/.tmux tmux 

echo ">>> Dotfiles linked successfully!"

# -----------------------------
# Install / Update Neovim plugins
# -----------------------------
echo ">>> Installing/Updating Neovim plugins..."

# Headless Neovim command: installs missing plugins and updates existing ones
nvim --headless -c "Lazy sync" -c "qa"

echo ">>> Neovim plugins installed/updated!"
