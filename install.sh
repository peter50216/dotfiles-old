#!/bin/bash -v
sudo apt-get -y install stow

# Backup default config
mv ~/.bashrc ~/.bashrc_default
mv ~/.profile ~/.profile_default

stow bash
stow vim
stow git
stow screen

# Some useful packages
sudo apt-get -y install python-setuptools
sudo apt-get -y install keychain
sudo apt-get -y install screen
