#!/bin/bash -v
# tmux-mem-cpu-load, shik's version.

cd ~
git clone git@bitbucket.org:shik/tmux-mem-cpu-load.git
cd tmux-mem-cpu-load
cmake .
make
sudo make install
