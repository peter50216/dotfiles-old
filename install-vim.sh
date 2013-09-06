#!/bin/bash
# Build vim
sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev \
  libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
  libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev ruby-dev mercurial
sudo apt-get remove vim vim-runtime gvim vim-tiny vim-common vim-gui-common

cd ~
hg clone https://code.google.com/p/vim/
cd vim
./configure --with-features=huge \
  --enable-rubyinterp \
  --enable-pythoninterp \
  --with-python-config-dir=/usr/lib/python2.7-config \
  --enable-perlinterp \
  --enable-gui=gtk2 --enable-cscope --prefix=/usr \
  --with-compiledby="Darkpi(peter50216@gmail.com)"
make VIMRUNTIMEDIR=/usr/share/vim/vim74
sudo make install

# Vundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim -c "BundleInstall" -c "qa"

# Build YCM
cd ~/.vim/bundle/YouCompleteMe
./install.sh --clang-completer

# Get gjslint
# https://developers.google.com/closure/utilities/docs/linter_howto
sudo easy_install http://closure-linter.googlecode.com/files/closure_linter-latest.tar.gz

