# set default umask
umask 002

# From https://github.com/dracula/dracula-theme/issues/218
DRACULA_DIRCOLORS=$HOME/src/dotfiles/dotfiles/Dracula.dircolors
[[ -s ${DRACULA_DIRCOLORS} ]] && eval $(dircolors -b ${DRACULA_DIRCOLORS})
