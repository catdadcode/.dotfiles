#!/bin/bash

# Get absolute path of current script.
DOTFILES_DIR=$(pwd)

# Install sudo if it doesn't already exist.
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install build-essential procps curl file git zsh -y

# Ensure directories exist.
mkdir -p "$HOME/.config/htop"
mkdir -p "$HOME/.nvm"

# Remove any existing files.
rm -f "$HOME/.config/htop/htoprc"
rm -rf "$HOME/.config/nvim"
rm -rf "$HOME/.oh-my-zsh"
rm -f "$HOME/.gitconfig"
rm -f "$HOME/.p10k.zsh"
rm -f "$HOME/.profile"
rm -f "$HOME/.zprofile"
rm -f "$HOME/.zshrc"

# Create symlinks.
ln -s "$DOTFILES_DIR/.config/htop/htoprc" "$HOME/.config/htop/htoprc"
ln -s "$DOTFILES_DIR/.config/nvim" "$HOME/.config/nvim"
ln -s "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"
ln -s "$DOTFILES_DIR/.p10k.zsh" "$HOME/.p10k.zsh"
ln -s "$DOTFILES_DIR/.profile" "$HOME/.profile"
ln -s "$DOTFILES_DIR/.profile" "$HOME/.bash_profile"
ln -s "$DOTFILES_DIR/.profile" "$HOME/.bashrc"
ln -s "$DOTFILES_DIR/.zprofile" "$HOME/.zprofile"
ln -s "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"

# Install Homebrew.
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Add formulae taps.
brew tap jesseduffield/lazygit
brew tap oven-sh/bun

# Update Homebrew
brew update && brew upgrade

# Install remaining packages.
brew install fd ripgrep lazygit volta neovim bun

# Install node and pnpm.
export VOLTA_FEATURE_PNPM=1
volta install node@latest
volta install pnpm@latest

# Install Oh My ZSH!
CHSH=no RUNZSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install improved VI Mode ZSH plugin.
mkdir -p "$HOME/.oh-my-zsh/custom/plugins"
git clone https://github.com/jeffreytse/zsh-vi-mode ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-vi-mode

# Install powerlevel10k ZSH theme.
mkdir -p "$HOME/.oh-my-zsh/custom/themes"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Add ZSH to list of shells and set as default.
ZSH_PATH=$(which zsh)
if ! grep -q "$ZSH_PATH" /etc/shells; then
	echo "$ZSH_PATH" | sudo tee -a /etc/shells
fi
sudo chsh -s "$ZSH_PATH" $USER

source "$HOME/.zprofile"
source "$HOME/.zshrc"
