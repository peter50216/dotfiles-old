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
if [[ ! -d "$HOME/.config/powerline" ]]; then
  mkdir -p $HOME/.config
  ln -s `dirname "$(readlink -f "$0")"`/powerline $HOME/.config/powerline
fi

# Some useful packages
sudo apt-get -y install python-setuptools
sudo apt-get -y install build-essential
sudo apt-get -y install keychain
# sudo apt-get -y install screen
sudo apt-get -y install zsh
sudo apt-get -y install tmux
sudo apt-get -y install htop
sudo apt-get -y install cmake
sudo apt-get -y install git
sudo apt-get -y install mercurial
sudo apt-get -y install libssl-dev libreadline-dev libbz2-dev libsqlite3-dev libffi-dev

# rbenv
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

# pyenv
git clone git://github.com/yyuu/pyenv.git ~/.pyenv
git clone https://github.com/yyuu/pyenv-which-ext.git ~/.pyenv/plugins/pyenv-which-ext

./install-tmux.sh
./install-zsh.sh
./install-vim.sh
