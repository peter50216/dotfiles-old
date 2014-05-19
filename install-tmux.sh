#!/bin/bash -v
# tmux-mem-cpu-load, shik's version.

cd ~
git clone https://peter50216@bitbucket.org/shik/tmux-mem-cpu-load.git
cd tmux-mem-cpu-load
cmake .
make
sudo make install
