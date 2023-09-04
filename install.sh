#!/bin/sh

# Get absolute path of current script.
DOTFILES_DIR=$(pwd)

# Ensure directories exist.
mkdir -p "$HOME/.config/htop"

# Create symlinks.
ln -s "$DOTFILES_DIR/.config/htop/htoprc" "$HOME/.config/htop/htoprc"
ln -s "$DOTFILES_DIR/.config/nvim" "$HOME/.config/nvim"
ln -s "$DOTFILES_DIR/.oh-my-zsh" "$HOME/.oh-my-zsh"
ln -s "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"
ln -s "$DOTFILES_DIR/.p10k.zsh" "$HOME/.p10k.zsh"
ln -s "$DOTFILES_DIR/.zprofile" "$HOME/.zprofile"
ln -s "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"

# Install Homebrew.
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Update Homebrew
brew update && brew upgrade

# Install packages.
brew install zsh
