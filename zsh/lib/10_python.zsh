# Python
export PYTHONSTARTUP=$HOME/src/dotfiles/dotfiles/pythonstartup.py

export PYENV_ROOT="$HOME/.repos/pyenv"
export PATH="$PATH:$PYENV_ROOT/bin"

if which pyenv > /dev/null; then
    eval "$(pyenv init -)"
fi

export PYENV_VIRTUALENV_DISABLE_PROMPT=1
eval "$(pyenv virtualenv-init -)"