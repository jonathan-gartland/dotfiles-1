if (( $+commands[rbenv] )) ; then
  eval "$(rbenv init -)"
fi

zplug "/usr/share/chruby/chruby.sh", from:local
