# http://tmuxp.git-pull.com/
export DISABLE_AUTO_TITLE='true'

eval "$(_TMUXP_COMPLETE=source tmuxp)"
compctl -g '~/.tmuxp/*(:t:r)' tmuxp

