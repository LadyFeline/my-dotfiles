#!/bin/sh
set -e

echo "❤️  Starting configuration! But make sure you have downloaded https://iterm2.com/ already ok?"

# Change Mac host name to be more sensible
sudo scutil --set HostName my-world
echo "❤️  I've set my machine name to be {my-world}"

# Install brew
echo "❤️  Installing brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo "❤️  I've installed brew, you can now download whatever you like!"

# Install necessary libaries
echo "❤️  Installing needed libraries..."

# Python related
brew install python ipython pyenv

# Search in shell
brew install ripgrep

# Build tags
brew install ctags

# Search in vim
brew install ack

# Github related
brew install git gh

# Session management
brew install tmux

# Pull oh-my-zsh.
echo "❤️  Installing oh-my-zsh... Lucky that mac shell is default to zsh isn't it?"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo "❤️  Done installing oh-my-zsh, looks a lot better isn't it?"

# Install autosuggestions for zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Pull awesome_vimrc
echo "❤️  Installing vimrc..."
cd ~/
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
echo "❤️  Done installing vimrc"

# Link configs in .dotfiles to entries in ~
ln -sf ~/.dotfiles/my_configs.vim ~/.vim_runtime/my_configs.vim
ln -sf ~/.dotfiles/.zshrc ~/.zshrc
