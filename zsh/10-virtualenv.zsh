### CONSTANTS
VENV_HOME="$HOME/virtual_envs"
export VIRTUAL_ENV_DISABLE_PROMPT=1


### SETUP
which virtualenv >/dev/null
if [[ $? == 1 ]]; then
    python3 -m pip install --user virtualenv
fi

if [[ ! -e "$VENV_HOME" ]]; then
    mkdir -p $VENV_HOME
fi


### MAIN FUNCITON

function venv {
    if [[ "$2" == "--verbose" ]]; then
        local VERBOSE=1
        set -x
    else
        local VERBOSE=0
    fi

    local PY_VERSION=${1:-3}

    if [[ -z $PROJECT_NAME ]]; then
        local GIT_DIR=`git rev-parse --git-dir 2> /dev/null`
        if [[ -n "$GIT_DIR" ]]; then
            # We are in a git directory
            local GIT_DIR=`cd $GIT_DIR; pwd`
            local PROJECT_NAME=`dirname $GIT_DIR | sed "s|^$HOME/||" | tr / _`
        else
            (>&2 echo "Could not find a .git, using scrap")
            local PROJECT_NAME="scrap_$PY_VERSION"
        fi
    fi

    local VENV_PATH="${VENV_HOME}/${PROJECT_NAME}"

    if [[ ! -d $VENV_PATH ]]; then
        # No virtual env, lets create it
        virtualenv -p "python$PY_VERSION" $VENV_PATH
    fi

    echo $VENV_PATH

    source "${VENV_PATH}/bin/activate"

    if [[ $VERBOSE == 1 ]]; then
        set +x
    fi
}

# References:
# https://hmarr.com/2010/jan/19/making-virtualenv-play-nice-with-git/
#
