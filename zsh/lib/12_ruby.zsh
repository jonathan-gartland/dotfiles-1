# rbenv

if (( $+commands[rbenv] )) ; then
  eval "$(rbenv init -)"
fi


srouce_if_exists "/usr/share/chruby/chruby.sh"
