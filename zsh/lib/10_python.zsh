# Python
export PYTHONSTARTUP=$HOME/dot-files-forest/dotfiles/pythonstartup.py

if which pyenv > /dev/null; then
    eval "$(pyenv init -)"
fi

export PYENV_VIRTUALENV_DISABLE_PROMPT=1
if which pyenv-virtualenv-init > /dev/null; then
    eval "$(pyenv virtualenv-init -)"
    pyenv virtualenvwrapper_lazy
fi
