# Python
export PYTHONSTARTUP=$HOME/src/dotfiles/dotfiles/pythonstartup.py

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

if which pyenv > /dev/null; then
    eval "$(pyenv init -)"
fi

export PYENV_VIRTUALENV_DISABLE_PROMPT=1
if which pyenv-virtualenv-init > /dev/null; then
    eval "$(pyenv virtualenv-init -)"
    # pyenv virtualenvwrapper_lazy
fi
