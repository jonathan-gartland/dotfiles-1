if [[ "$OS_IS_LINUX" = true ]]; then

  antigen bundle debian

  # use local pacman
  if [[ -x $(which etckeeper) && -x $(which ~/bin/pacman-etckeeper) ]]; then
      alias pacman=pacman-etckeeper
  fi

  # nvidia fix
  # export __GL_SYNC_TO_VBLANK=1
  # export __GL_SYNC_DISPLAY_DEVICE=DFP-0
  # export __VDPAU_NVIDIA_SYNC_DISPLAY_DEVICE=DFP-0

  # systemctl --user env imports
  if exists systemctl; then
  	systemctl --user import-environment PATH SSH_AUTH_SOCK GTAGSCONF GTAGSLABEL VM
  fi
  
  # for man --html etc.
  export BROWSER=chrome

  # command not found; install pkgfile
  [[ -e /usr/share/doc/pkgfile/command-not-found.zsh ]] &&\
    source /usr/share/doc/pkgfile/command-not-found.zsh

  [[ -e /etc/zsh_command_not_found ]] &&\
    source /etc/zsh_command_not_found

  if [[ "$TERM" == xterm ]]; then
    export TERM=xterm-256color
  fi

  alias ls='ls -hF --color'   # add colors for filetype recognition
fi
