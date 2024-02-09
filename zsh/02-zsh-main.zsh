bindkey -e

zstyle :compinstall filename "$HOME/.zsh/02-zsh-main.zsh"

autoload -U compinit
compinit
# End of lines added by compinstall

setopt autocd

autoload -U colors
colors


# Should consider adding GOPATH somewhere. default is $HOME/go
export PATH="$HOME/.local/bin:$HOME/go/bin:/usr/local/go/bin:$PATH"

if [ -d "/usr/lib/jvm/jdk-17" ]; then
    export JAVA_HOME=/usr/lib/jvm/jdk-17/
    export PATH=$PATH:$JAVA_HOME/bin
fi


export EDITOR='vim'

autoload -U autocd
setopt autocd
setopt extendedglob
setopt autopushd
setopt pushdignoredups


COMPLETION_WATING_DOTS="true"
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z} l:|=* r:|=*'
zstyle ':completion:*' menu select

# References
# https://superuser.com/a/1092328
