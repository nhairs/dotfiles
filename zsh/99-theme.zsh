autoload -U promptinit
promptinit

prompt_argotha_setup () {
    function venv_info {
        [ $VIRTUAL_ENV ] && echo -n '%B%F{yellow}V]%b%f'
    }

    local prompt_color='blue'
    local user_color='green'
    local root_color='red'

    local newline=$'\n'

    if [ "$USER" = 'root' ]; then
        local base_prompt="%B%F{$root_color}%m%k "
    else
        local base_prompt="%B%F{$user_color}%n@%m%k "
    fi

    local post_prompt="%b%f%k"

    #setopt noxtrace localoptions

    setopt promptsubst

    local path_prompt="%B%F{$prompt_color}%2~"

    # Set promts
    # For information about what PS[1-4] are see:
    # https://www.thegeekstuff.com/2008/09/bash-shell-take-control-of-ps1-ps2-ps3-ps4-and-prompt_command/
    PS1="\$(venv_info)$base_prompt$path_prompt %(1j.(%j).)%# $post_prompt"
    PS2="%F{$prompt_color}%_> $post_prompt"
    PS3="%F{$prompt_color}?# $post_prompt"

    RPS1=$'$(git_super_status)'
}

prompt_argotha_setup "$@"

# vim:ft=zsh
#
