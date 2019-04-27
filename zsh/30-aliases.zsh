alias -r rm='rm -i'

alias -r ls="ls --color"
alias -r lh='ls -lh'
alias -r ll='ls -l'
alias -r lah='ls -lha'

alias -r g='git status'
alias -r gu='git pull'
alias -r gp='git push'
alias -r ga='git add'
alias -r gd='git diff'
alias -r gb='git branch'
alias -r gba='git branch -a'
alias -r gc='git commit'
alias -r gca='git commit -a'
alias -r gco='git checkout'
alias -r gl="git log --date-order --graph --pretty=format:'%C(red)%h%C(reset) -%C(yellow)%d%C(reset) %s %C(green)(%cr) %C(bold blue)<%an>%C(reset)' --abbrev-commit --date=relative"
alias -r gla="gl --all"

alias -r vim="vim -p"

alias -r nose="nosetests --with-yanc --with-watcher"

alias -r t='tree -I "venv|__pycache__"'


# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias -r alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
