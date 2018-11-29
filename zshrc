for config in $HOME/.zsh/*.zsh; do
    if [[ ! -f $config ]]; then
        continue
    fi
    source $config
done
