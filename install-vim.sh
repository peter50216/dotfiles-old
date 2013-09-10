#!/bin/bash -v
# Build vim
sudo apt-get -y install libncurses5-dev libgnome2-dev libgnomeui-dev \
  libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
  libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev ruby-dev mercurial
sudo apt-get -y remove vim vim-runtime gvim vim-tiny vim-common vim-gui-common

function num_cores {
  if command_exists nproc; then
   num_cpus=$(nproc)
  else
    num_cpus=1
    if [[ `uname -s` == "Linux" ]]; then
      num_cpus=$(grep -c ^processor /proc/cpuinfo)
    else
      # Works on Mac and FreeBSD
      num_cpus=$(sysctl -n hw.ncpu)
    fi
  fi
  echo $num_cpus
}

cd ~
hg clone https://code.google.com/p/vim/
cd vim
hg pull
hg update
./configure --with-features=huge \
  --enable-rubyinterp \
  --enable-pythoninterp \
  --with-python-config-dir=/usr/lib/python2.7-config \
  --enable-perlinterp \
  --enable-gui=gtk2 --enable-cscope --prefix=/usr \
  --with-compiledby="Darkpi (peter50216@gmail.com)"
make VIMRUNTIMEDIR=/usr/share/vim/vim74 -j $(num_cores)
sudo make install

# Vundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim -c "BundleInstall" -c "qa"

# Build YCM
cd ~/.vim/bundle/YouCompleteMe
sudo apt-get install cmake
./install.sh --clang-completer

# Get gjslint
# https://developers.google.com/closure/utilities/docs/linter_howto
sudo easy_install http://closure-linter.googlecode.com/files/closure_linter-latest.tar.gz

