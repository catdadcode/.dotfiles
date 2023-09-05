#!/bin/sh

# Get absolute path of current script.
DOTFILES_DIR=$(pwd)

# Ensure directories exist.
mkdir -p "$HOME/.config/htop"
mkdir -p "$HOME/.nvm"

# Remove any existing files.
rm "$HOME/.config/htop/htoprc"
rm -r "$HOME/.config/nvim"
rm -r "$HOME/.oh-my-zsh"
rm "$HOME/.gitconfig"
rm "$HOME/.p10k.zsh"
rm "$HOME/.zprofile"
rm "$HOME/.zshrc"

# Create symlinks.
ln -s "$DOTFILES_DIR/.config/htop/htoprc" "$HOME/.config/htop/htoprc"
ln -s "$DOTFILES_DIR/.config/nvim" "$HOME/.config/nvim"
ln -s "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"
ln -s "$DOTFILES_DIR/.p10k.zsh" "$HOME/.p10k.zsh"
ln -s "$DOTFILES_DIR/.zprofile" "$HOME/.zprofile"
ln -s "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"

# Install Homebrew.
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Update Homebrew
brew update && brew upgrade

# Install ZSH.
brew install zsh

# Install remaining packages.
brew install build-essential gcc fd neovim nvm ripgrep zsh 

# Install Oh My ZSH!
RUNZSH=no
KEEP_ZSHRC=yes
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
mkdir "$HOME/.oh-my-zsh/custom/plugins"
mkdir "$HOME/.oh-my-zsh/custom/themes"

# Install improved VI Mode ZSH plugin.
git clone https://github.com/jeffreytse/zsh-vi-mode \
  $ZSH_CUSTOM/plugins/zsh-vi-mode

# Install powerlevel10k ZSH theme.
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Source NVM.
. "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh"

# Install Node
nvm install node
nvm alias default node
npm install -g pnpm