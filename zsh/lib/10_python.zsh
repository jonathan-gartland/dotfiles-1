# Python
export PYTHONSTARTUP=$HOME/dot-files-forest/dotfiles/pythonstartup.py

# See http://www.doughellmann.com/docs/virtualenvwrapper/
export WORKON_HOME=$HOME/.virtualenvs
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_REQUIRE_VIRTUALENV=true
export PIP_RESPECT_VIRTUALENV=true
export VIRTUALENV_USE_DISTRIBUTE=True
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS=--no-site-packages

if [[ "$OS_IS_POSIX" = true ]]; then

    antigen bundle virtualenvwrapper

    # create virtualenv py if necessary
    lsvirtualenv -b |grep py > /dev/null 2>&1

    if [ $? -eq 1 ]; then
        mkvirtualenv py
    fi
fi

