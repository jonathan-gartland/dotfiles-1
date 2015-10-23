if (( $+commands[rbenv] )) ; then
  eval "$(rbenv init -)"
fi

source_if_exists "/usr/share/chruby/chruby.sh"
