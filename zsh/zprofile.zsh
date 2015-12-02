
#
# Language
#

DOTSPATH="$HOME/.zsh"

source "$HOME/.zsh/lib/00_base.zsh"

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

#
# Paths
#

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the the list of directories that cd searches.
cdpath=(~ ~/src ~/work ~/dot-files-forest ~/Projects $cdpath)

# Set the list of directories that Zsh searches for programs.
path=(~/local/bin ~/bin ~/.cask/bin $path)

#
# Temporary Files
#

if [[ ! -d "$TMPDIR" ]]; then
  export TMPDIR="/tmp/$USER"
  mkdir -p -m 700 "$TMPDIR"
fi

TMPPREFIX="${TMPDIR%/}/zsh"
if [[ ! -d "$TMPPREFIX" ]]; then
  mkdir -p "$TMPPREFIX"
fi

# set env. variables

export HOSTNAME=$(/usr/bin/env hostname)
export PAGER=less
export MANPATH="$MANPATH:~/local/share/man"

#
# Editors
#
export GIT_EDITOR=vim
export EDITOR=vim
export VISUAL=vim

export stow="~/local/stow"

#
# less
#
# colorize output from man
# http://www.tuxarena.com/2012/04/tutorial-colored-man-pages-how-it-works/
export LESS='-FSRX'
export LESS_TERMCAP_mb=$(printf '\e[01;31m') # enter blinking mode
export LESS_TERMCAP_md=$(printf '\e[01;38;5;75m') # enter double-bright mode
export LESS_TERMCAP_me=$(printf '\e[0m') # turn off all appearance modes (mb, md, so, us)
export LESS_TERMCAP_se=$(printf '\e[0m') # leave standout mode
export LESS_TERMCAP_so=$(printf '\e[01;33m') # enter standout mode
export LESS_TERMCAP_ue=$(printf '\e[0m') # leave underline mode
export LESS_TERMCAP_us=$(printf '\e[04;38;5;200m') # enter underline mode

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

#
# Term
#

# switch to 256 color xterm if using "xterm"
if [ -n "$DISPLAY" -a "$TERM" = "rxvt-unicode" ]; then
  export TERM=rxvt-256color
fi

#
# local settings
#
source_if_exists "$DOTSPATH/local/$HOSTNAME.zsh"
