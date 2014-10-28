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
# stow screen
stow tmux

# Some useful packages
sudo apt-get -y install python-setuptools
sudo apt-get -y install keychain
# sudo apt-get -y install screen
sudo apt-get -y install zsh
sudo apt-get -y install tmux
sudo apt-get -y install htop
sudo apt-get -y install cmake
sudo apt-get -y install git
sudo apt-get -y install mercurial
sudo apt-get -y install libssl-dev

# rbenv
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
if [ ! -f ~/.ruby-version ]; then
  echo 2.1.3 > ~/.ruby-version
fi

# pyenv
git clone git://github.com/yyuu/pyenv.git .pyenv
if [ ! -f ~/.ruby-version ]; then
  echo 2.7.8 > ~/.python-version
fi

./install-tmux.sh
./install-zsh.sh
./install-vim.sh
