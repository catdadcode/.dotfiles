#!/bin/sh

# Get absolute path of current script.
DOTFILES_DIR=$(pwd)

# Upload 
GITHUB_USERNAME=CatDadCode
SSH_KEY=$HOME/.ssh/id_rsa

if [ ! -f $SSH_KEY ] || [ ! -f $SSH_KEY.pub ]; then
  echo 'Generate your ssh key first!'
  exit
fi

github_result=0
echo 'How do you want to name the key?'
read -e KEY_NAME
until [ $github_result -eq 1 ]; do
  curl --silent -u "$GITHUB_USERNAME" --data "{\"title\":\"$KEY_NAME\",\"key\":\"$(cat $SSH_KEY.pub)\"}" https://api.github.com/user/keys > gh-result
  if grep -q 'key is already in use' gh-result; then
    github_result=1
    echo 'Key is already in use.'
  elif grep -q '"verified": true' gh-result; then
    github_result=1
    echo "Key ($KEY_NAME) has been added successfully."
  elif grep -q 'Bad credentials' gh-result; then
    echo 'Error during login: invalid username or password!'
    echo 'Try again!'
  else
    echo 'A problem occured during the upload!'
    cat gh-result
    echo 'Try again!'
  fi
  rm gh-result
done

# Install prerequisites.
# TODO: Adjust this to not run on OSX.
sudo apt install build-essential -y

# Ensure directories exist.
mkdir -p "$HOME/.config/htop"
mkdir -p "$HOME/.nvm"

# Remove any existing files.
rm -f "$HOME/.config/htop/htoprc"
rm -rf "$HOME/.config/nvim"
rm -rf "$HOME/.oh-my-zsh"
rm -f "$HOME/.gitconfig"
rm -f "$HOME/.p10k.zsh"
rm -f "$HOME/.zprofile"
rm -f "$HOME/.zshrc"

# Create symlinks.
ln -s "$DOTFILES_DIR/.config/htop/htoprc" "$HOME/.config/htop/htoprc"
ln -s "$DOTFILES_DIR/.config/nvim" "$HOME/.config/nvim"
ln -s "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"
ln -s "$DOTFILES_DIR/.p10k.zsh" "$HOME/.p10k.zsh"
ln -s "$DOTFILES_DIR/.zprofile" "$HOME/.zprofile"
ln -s "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"

# Install Homebrew.
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Update Homebrew
brew update && brew upgrade

# Install ZSH.
brew install zsh

# Install remaining packages.
brew install gcc fd neovim nvm ripgrep zsh 

# Install Oh My ZSH!
RUNZSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
mkdir -p "$HOME/.oh-my-zsh/custom/plugins"
mkdir "$HOME/.oh-my-zsh/custom/themes"

# Install improved VI Mode ZSH plugin.
git clone https://github.com/jeffreytse/zsh-vi-mode ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-vi-mode

# Install powerlevel10k ZSH theme.
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Source NVM.
. "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh"

# Install Node
nvm install node
nvm alias default node
npm install -g pnpm