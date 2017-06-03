# http://tmuxp.git-pull.com/
export DISABLE_AUTO_TITLE='true'

compdef _tmuxp_completion tmuxp;

eval "$(_TMUXP_COMPLETE=source tmuxp)"
compctl -g '~/.tmuxp/*(:t:r)' tmuxp

