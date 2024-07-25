if [[ -e "$(which nvim)" ]]; then
    alias vim="nvim -p"
else
    alias vim="vim -p"
fi
