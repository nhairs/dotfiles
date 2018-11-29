bindkey -e

zstyle :compinstall filename "$HOME/.zsh/02-zsh-main.zsh"

autoload -U compinit
compinit
# End of lines added by compinstall

setopt autocd

autoload -U colors
colors

export PATH="$HOME/.local/bin:$PATH"

export EDITOR=vim

autoload -U autocd
setopt autocd
setopt extendedglob
setopt autopushd
setopt pushdignoredups


COMPLETION_WATING_DOTS="true"
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z} l:|=* r:|=*'
zstyle ':completion:*' menu select
