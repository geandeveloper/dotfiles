#!/usr/bin/env bash
set -e

echo ">>> Applying dotfiles with stow..."

cd "$(dirname "$0")"

# Stow dotfiles para o home
stow git
# stow nvim
stow tmux

# Stow SSH separadamente para ~/.ssh
stow -t ~/.ssh ssh

echo ">>> Dotfiles linked successfully!"
