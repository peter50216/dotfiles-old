# zgen
# XXX(Darkpi): Assume that we'll always clone dotfiles in home folder.
ZGEN_RESET_ON_CHANGE=(${HOME}/.zshrc)
source ~/dotfiles/zgen/zgen.zsh

# Do stupid fix
# We'll never use non-256-color terminal!
if [[ $TERM == "xterm" ]]; then
  export TERM=xterm-256color
fi

# Fix pageup/pagedown to correct key
# key[PageUp]=${terminfo[kpp]}
# key[PageDown]=${terminfo[knp]}

if [[ -n "${key[PageUp]}" ]]; then
  bindkey "${key[PageUp]}" backward-word
fi
if [[ -n "${key[PageDown]}" ]]; then
  bindkey "${key[PageDown]}" forward-word
fi

# No Ctrl+S freezing.
stty -ixon

# Oh-my-zsh settings
DISABLE_AUTO_TITLE="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
ZSH_TMUX_AUTOCONNECT="false"
DISABLE_UNTRACKED_FILES_DIRTY="true"
BUNDLED_COMMANDS=(passenger padrino)

if ! zgen saved; then
  echo "Creating a zgen save"
  # zgen prezto
  # Oh-my-zsh!
  zgen oh-my-zsh  # 0.1 seconds
  zgen oh-my-zsh plugins/sudo
  zgen oh-my-zsh plugins/ssh-agent

  zgen oh-my-zsh plugins/tmux

  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/gitignore

  zgen oh-my-zsh plugins/bundler
  zgen oh-my-zsh plugins/rbenv
  zgen oh-my-zsh plugins/ruby
  zgen oh-my-zsh plugins/gem

  zgen oh-my-zsh plugins/node
  # zgen oh-my-zsh plugins/nvm  # 0.2 seconds...
  zgen oh-my-zsh plugins/golang

  zgen oh-my-zsh plugins/pip
  zgen oh-my-zsh plugins/pyenv  # 0.2 seconds...
  zgen oh-my-zsh plugins/python

  zgen oh-my-zsh plugins/vagrant

  zgen oh-my-zsh plugins/vundle

  # Other plugins
  zgen load zsh-users/zsh-syntax-highlighting
  zgen load Lokaltog/powerline powerline/bindings/zsh  # 0.3 seconds
  zgen load rust-lang/zsh-config
  zgen save
fi

unsetopt share_history

powerline-daemon -q

alias ll='ls -lFh'
alias la='ls -lAFh'
alias ta='tmux at -t'
alias tl='tmux ls'
alias cpv="rsync -pogh -e /dev/null --progress --"

export WECHALLUSER="peter50216"
export WECHALLTOKEN="C03C8-2EC56-699E9-B4004-8AB5F-D50AB"

if [[ -d "$HOME/.cabal" ]]; then
  export PATH=$HOME/.cabal/bin:$PATH
fi

if [[ -d "$HOME/.nvm" ]]; then
  source ~/.nvm/nvm.sh
fi

if [ -f "$HOME/.profile_local" ]; then
  source "$HOME/.profile_local"
fi

