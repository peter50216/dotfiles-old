#!/bin/bash -v
sudo apt-get update
sudo apt-get -y install stow

# Backup default config
mv ~/.bashrc ~/.bashrc_default
mv ~/.profile ~/.profile_default

stow bash
stow zsh
stow vim
stow git
stow screen
stow tmux

# Some useful packages
sudo apt-get -y install python-setuptools
sudo apt-get -y install keychain
sudo apt-get -y install screen
sudo apt-get -y install tmux
sudo apt-get -y install htop
sudo apt-get -y install cmake

# rbenv
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

./install-vim.sh
./install-tmux.sh
