# guard to prevent damaging sock when ssh-agent forwarding.
# ref: https://stackoverflow.com/a/11686307
if ! env | grep -q '^SSH_AUTH_SOCK='
then
    export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"
fi

