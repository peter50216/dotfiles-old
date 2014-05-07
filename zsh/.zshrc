# zshrc by shik

export TERM=screen-256color

# PROMPT {{{

autoload -Uz colors && colors

PROMPT="%{$fg_bold[green]%}%n@%m%{$reset_color%}"
PROMPT+=":%{$fg_bold[blue]%}%~%{$reset_color%}"
# PROMPT="%{%F{140}%}%n@%m%{%f%}"
# PROMPT+=":%{%F{110}%}%~%{%f%}"
PROMPT+="%(!.#.$) "

# }}}

# KEY {{{

zle-line-init () {
  (( ${+terminfo[smkx]} )) && echoti smkx
}

zle-line-finish () {
  (( ${+terminfo[rmkx]} )) && echoti rmkx
}

zle -N zle-line-init
zle -N zle-line-finish

bindkey -e

typeset -A key

key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

[[ -n "${key[Home]}"     ]] && bindkey "${key[Home]}"     beginning-of-line
[[ -n "${key[End]}"      ]] && bindkey "${key[End]}"      end-of-line
[[ -n "${key[Delete]}"   ]] && bindkey "${key[Delete]}"   delete-char
[[ -n "${key[Up]}"       ]] && bindkey "${key[Up]}"       up-line-or-search
[[ -n "${key[Down]}"     ]] && bindkey "${key[Down]}"     down-line-or-search
[[ -n "${key[Left]}"     ]] && bindkey "${key[Left]}"     backward-char
[[ -n "${key[Right]}"    ]] && bindkey "${key[Right]}"    forward-char
[[ -n "${key[PageUp]}"   ]] && bindkey "${key[PageUp]}"   backward-word
[[ -n "${key[PageDown]}" ]] && bindkey "${key[PageDown]}" forward-word

# }}}

# OPT {{{

HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt append_history
setopt inc_append_history
setopt extended_history
setopt extended_glob

setopt auto_pushd
setopt auto_name_dirs
setopt pushd_minus
setopt pushd_ignore_dups

setopt correct
setopt multios

setopt complete_in_word

autoload -Uz compinit
compinit

autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

# }}}

# ALIAS {{{

if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  #alias dir='dir --color=auto'
  #alias vdir='vdir --color=auto'
fi

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ..;cd ..;'
alias ~='cd ~'
alias tmux='tmux -2'

# }}}

# EXPORT {{{

export EDITOR=vim
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export GREP_OPTIONS='--color=auto'
export PAGER='less'
export LESS='-R'
export CLICOLOR=1
export WECHALLUSER="peter50216"
export WECHALLTOKEN="C03C8-2EC56-699E9-B4004-8AB5F-D50AB"

# }}}

# keychain
eval `keychain --eval ~/.ssh/id_rsa`
umask 022

# OTHER {{{

if [[ -d "$HOME/.cabal" ]]; then
  export PATH=$HOME/.cabal/bin:$PATH
fi

if [[ -d "$HOME/.rbenv" ]]; then
  export PATH=$HOME/.rbenv/bin:$PATH
  eval "$(rbenv init -)"
fi

if [[ -d "$HOME/.nvm" ]]; then
  source ~/.nvm/nvm.sh
fi

if [ -f "$HOME/.profile_local" ]; then
  . "$HOME/.profile_local"
fi

# }}}
