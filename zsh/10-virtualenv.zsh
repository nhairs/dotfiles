export VIRTUALENVWRAPPER_PYTHON=`which python2 || which python`
export WORKON_HOME=$HOME/virtual_envs

if [[ ! -e "$WORKON_HOME" ]]; then
    $VIRTUALENVWRAPPER_PYTHON -m pip install --user virtualenvwrapper
    mkdir -p $WORKON_HOME
fi

source `which virtualenvwrapper.sh`

export VIRTUAL_ENV_DISABLE_PROMPT=1

function venv {
    if [[ "$2" == "--verbose" ]]; then
        local VERBOSE=1
        set -x
    else
        local VERBOSE=0
    fi

    local PY_VERSION=${1:-3}

    local GIT_DIR=`git rev-parse --git-dir 2> /dev/null`
    if [[ -n "$GIT_DIR" ]]; then
        # We are in a git directory
        local GIT_DIR=`cd $GIT_DIR; pwd`
        local PROJECT_NAME=`dirname $GIT_DIR | sed "s|^$HOME/||" | tr / _`
    else
        (>&2 echo "Could not find a .git, using scrap")
        local PROJECT_NAME="scrap_$PY_VERSION"
    fi

    lsvirtualenv -b | grep $PROJECT_NAME > /dev/null
    if [[ $? == 1 ]]; then
        # No virtual env, lets create it
        mkvirtualenv -p "python$PY_VERSION" $PROJECT_NAME
    fi

    echo $PROJECT_NAME

    workon $PROJECT_NAME

    if [[ $VERBOSE == 1 ]]; then
        set +x
    fi
}

# References:
# https://hmarr.com/2010/jan/19/making-virtualenv-play-nice-with-git/
#
