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
alias -r gdc='git diff --cached'
alias -r gdh='git diff HEAD'
alias -r gb='git branch'
alias -r gba='git branch -a'
alias -r gc='git commit'
alias -r gca='git commit -a'
alias -r gco='git checkout'
alias -r gl="git log --date-order --graph --pretty=format:'%C(red)%h%C(reset) -%C(yellow)%d%C(reset) %s %C(green)(%cr) %C(bold blue)<%an>%C(reset)' --abbrev-commit --date=relative"
alias -r gla="gl --all"

alias -r vim="vim -p"

alias -r newpy="cp ~/git/template.py"

#alias -r nose="nosetests --with-yanc --with-watcher"

alias -r t="tree -I 'venv|venv2|venv3|__pycache__|*.pyc|node_modules'"


# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias -r alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias -r gpg="echo 'Use gpg2!'"


alias new_pass='echo `head /dev/urandom | base64 | tr -d / | tr -d + | head -c 32`'
alias screenshot='gnome-screenshot -a -f ~/Pictures/capture/capture-`date +%Y%m%d-%H%M%S`.jpg'
alias screenhere='gnome-screenshot -a -f ./capture-`date +%Y%m%d-%H%M%S`.jpg'

function make_gif () {
    ffmpeg -y -i $1 -vf palettegen /tmp/make_gif_pallete.png
    ffmpeg -y -i $1 -i /tmp/make_gif_pallete.png -filter_complex paletteuse -r 10 ~/Videos/giffed.`date +%Y-%m-%d`.gif
}

### SHITTY AWS SSH FINGERPRINTS
# https://serverfault.com/questions/603982/why-does-my-openssh-key-fingerprint-not-match-the-aws-ec2-console-keypair-finger
function aws_ssh_fingerprint {
    openssl pkey -in $1 -pubout -outform DER | openssl md5 -c
}

function aws_pem_fingerprint {
    openssl pkcs8 -in $1 -nocrypt -topk8 -outform DER | openssl sha1 -c
}
