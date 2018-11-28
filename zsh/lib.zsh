
# -------------------------------------------------------------------------------
# filename: /Users/steven.knight/.zsh/local/ouroboros.zsh
# -------------------------------------------------------------------------------
# add /usr/texbin to PATH, if available
[[ -d "/usr/texbin" ]] && path=(/usr/texbin $path)

alias dircolors=gdircolors

alias show_dot_files='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hide_dot_files='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# zplug "plugins/brew",   from:oh-my-zsh
# zplug "plugins/osx",   from:oh-my-zsh
# zplug "/usr/local/share/zsh/site-functions/_aws", from:local
source $HOME/Projects/cashbot/scripts/cashbot_defs.sh

export PATH="/usr/local/mysql/bin:/usr/local/bin:/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# set to avoid message "Warning: The default Caskroom location has moved to /usr/local/Caskroom"
# export HOMEBREW_CASK_OPTS="--caskroom=/opt/homebrew-cask/Caskroom"

export EVENT_NOKQUEUE=1

fpath=(/usr/local/share/zsh/site-functions $fpath)

export PATH=$PATH:/usr/local/opt/go/libexec/bin:/Library/TeX/texbin/

type ls > /dev/null && unset -f ls 2> /dev/null
type ll > /dev/null && unset -f ll 2> /dev/null
type lR > /dev/null && unset -f lR 2> /dev/null
type lr > /dev/null && unset -f lr 2> /dev/null

alias ls='exa'
alias ll='exa --long --classify --time-style long-iso'
alias lR='exa --recurse'
alias lt='exa --tree --long'
alias lr='exa --long --reverse --sort modified'
alias lg='exa --git --long'
alias hg='/usr/local/bin/hg'

# https://github.com/dvorka/hstr

# add this configuration to ~/.zshrc
export HISTFILE=~/.zsh_history  # ensure history file visibility
export HH_CONFIG=hicolor        # get more colors
# bind hh to Ctrl-r (for Vi mode check doc)
bindkey -s '^R' '^Ahh ^M'   

export GOPATH=$HOME/.go
export PATH=$PATH:/usr/local/opt/go@1.8/libexec/bin

if [ -f ~/.config/exercism/exercism_completion.zsh ]; then
  . ~/.config/exercism/exercism_completion.zsh
fi

export RUST_SRC_PATH=${HOME}/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src
export DYLD_LIBRARY_PATH=${HOME}/.rustup/toolchains/stable-x86_64-apple-darwin/lib
export RLS_ROOT=${HOME}/src/rls

# . /Applications/Docker.app/Contents/Resources/etc/docker.zsh-completion
# . /Applications/Docker.app/Contents/Resources/etc/docker-compose.zsh-completion
# . /Applications/Docker.app/Contents/Resources/etc/docker-machine.zsh-completion 

export PATH="$PATH:/Users/steven.knight/Projects/git_hooks/commands"


export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# Add to .bashrc, too
export CASHSTAR_HOOKS=$HOME/Projects/git_hooks/


alias chunkwm_stop='brew services stop chunkwm'
alias chunkwm_start='brew services start chunkwm'
alias chunkwm_restart='chunkwm_stop && chunkwm_start'

alias skhd_stop='brew services stop skhd'
alias skhd_start='brew services start skhd'
alias skhd_restart='skhd_stop && skhd_start'

alias cat='bat'

# -------------------------------------------------------------------------------
# END
# -------------------------------------------------------------------------------

# -------------------------------------------------------------------------------
# filename: /Users/steven.knight/.zsh/lib/62_misc.zsh
# -------------------------------------------------------------------------------
# set default umask
umask 002

# From https://github.com/dracula/dracula-theme/issues/218
DRACULA_DIRCOLORS=$HOME/src/dotfiles/dotfiles/Dracula.dircolors
[[ -s ${DRACULA_DIRCOLORS} ]] && eval $(dircolors -b ${DRACULA_DIRCOLORS})

# -------------------------------------------------------------------------------
# END
# -------------------------------------------------------------------------------

# -------------------------------------------------------------------------------
# filename: /Users/steven.knight/.zsh/lib/30_linux.zsh
# -------------------------------------------------------------------------------
if [[ "$OS_IS_LINUX" = true ]]; then

  # use local pacman
  if [[ -x $(which etckeeper) && -x $(which ~/bin/pacman-etckeeper) ]]; then
      alias pacman=pacman-etckeeper
  fi

  # nvidia fixcoloredlogs
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

  # open alias for xdg-open
  # it ignores stdout and stderr

  function open() {
      emulate -LR zsh

      # linux
      if (( $+commands[xdg-open] )); then
          xdg-open $* > /dev/null 2>&1
      fi
  }
fi

# -------------------------------------------------------------------------------
# END
# -------------------------------------------------------------------------------

# -------------------------------------------------------------------------------
# filename: /Users/steven.knight/.zsh/lib/51_vcsinfo.zsh
# -------------------------------------------------------------------------------
# vcsinfo: thanks to github.com/sunaku/home/
autoload -Uz vcs_info

VCS_PROMPT=" %F{cyan}→ %F{green}%b%F{magenta}%u%f%c%m"
AVCS_PROMPT="$VCS_PROMPT %F{cyan}∷%f %F{magenta}%a%f"

zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr "+"
zstyle ':vcs_info:*' unstagedstr "#"
zstyle ':vcs_info:*' formats $VCS_PROMPT
zstyle ':vcs_info:*' actionformats $AVCS_PROMPT
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*+set-message:*' hooks git-aheadbehind git-untracked git-message

### git: Show +N/-N when your local branch is ahead-of or behind remote HEAD.
# Make sure you have added misc to your 'formats':  %m
function +vi-git-aheadbehind() {
  local ahead behind
  local -a gitstatus

  behind=$(git rev-list HEAD..${hook_com[branch]}@{upstream} 2>/dev/null | wc -l)
  (( $behind )) && gitstatus+=( " -%F{red}${behind}%f" )

  ahead=$(git rev-list ${hook_com[branch]}@{upstream}..HEAD 2>/dev/null | wc -l)
  (( $ahead )) && gitstatus+=( " +%F{blue}${ahead}%f" )

  hook_com[misc]+=${(j::)gitstatus}

  if [[ -n ${hook_com[misc]} ]]; then
    hook_com[misc]=" %F{cyan}∷%f${hook_com[misc]}"
  fi
}

### git: Show marker (T) if there are untracked files in repository
# Make sure you have added staged to your 'formats':  %c
function +vi-git-untracked(){
  if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
    git status --porcelain | grep '??' &> /dev/null ; then
    # This will show the marker if there are any untracked files in repo.
    hook_com[branch]="%F{magenta}.%F{green}${hook_com[branch]}%f"
  fi
}

# proper spacing
function +vi-git-message(){
  if [[ -n ${hook_com[unstaged]} ]]; then
    if [[ -n ${hook_com[staged]} ]]; then
      hook_com[unstaged]="${hook_com[unstaged]} "
    else
      hook_com[unstaged]="${hook_com[unstaged]}"
    fi
  else
    if [[ -n ${hook_com[staged]} ]]; then
      hook_com[staged]=" ${hook_com[staged]}"
    fi
  fi
}


# -------------------------------------------------------------------------------
# END
# -------------------------------------------------------------------------------

# -------------------------------------------------------------------------------
# filename: /Users/steven.knight/.zsh/lib/01_alias.zsh
# -------------------------------------------------------------------------------
alias svim='sudoedit'

# prompt if deleting more than 3 files
# alias rm='rm -I'

# update vundle
alias vimup='vim +PluginInstall! +qall'

## mime

alias df='df -h'
alias du='du -h'
alias grep='grep --color=auto --ignore-case'
alias vgrep='grep --with-filename --line-number --color=auto --ignore-case'
alias ll='ls -l'
alias lm='ls -al |less'     # pipe through 'less'
alias lR='ls -l'            # recursive ls
alias lr='ls -ltr'          # sort by date DSC
alias mkdir='mkdir -p'
alias pl='tail -f -n 30 $HOME/.procmail/log/procmail'
alias today='date +%F'
alias todayISO1806='date -u +"%FT%TZ"'
alias tree='tree -Csuh'         # nice alternative to 'ls'
alias watch='watch -n 1'
alias ln='ln -v'

# # From http://justinlilly.com/dotfiles/zsh.html
alias svim="sudo vim" # Run vim as super user

# From http://www.thegeekstuff.com/2008/10/6-awesome-linux-cd-command-hacks-productivity-tip3-for-geeks/
alias ..="cd .."
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
alias ..5="cd ../../../../.."

alias -g G='| grep'
alias -g M='| less'
alias -g L='| wc -l'
alias -g ONE="| awk '{ print \$1}'"

# grep: warning: GREP_OPTIONS is deprecated; please use an alias or script
# Waiting for oh-my-zsh
alias grep="grep $GREP_OPTIONS"
unset GREP_OPTIONS

alias rm='rm -i'

alias clean_pyc="find . -name '.pyc' -delete"


# -------------------------------------------------------------------------------
# END
# -------------------------------------------------------------------------------

# -------------------------------------------------------------------------------
# filename: /Users/steven.knight/.zsh/lib/21_tmux.zsh
# -------------------------------------------------------------------------------
# http://tmuxp.git-pull.com/
export DISABLE_AUTO_TITLE='true'

# autoload bashcompinit
# bashcompinit
# compdef _tmuxp_completion tmuxp;

# eval "$(_TMUXP_COMPLETE=source tmuxp)"
# compctl -g '~/.tmuxp/*(:t:r)' tmuxp


# -------------------------------------------------------------------------------
# END
# -------------------------------------------------------------------------------

# -------------------------------------------------------------------------------
# filename: /Users/steven.knight/.zsh/lib/60_zle.zsh
# -------------------------------------------------------------------------------
# key bindings

# function zle-keymap-select {
#   zle reset-prompt

#   if [[ $KEYMAP = "vicmd" ]]; then
#     echo -ne "\033]12;5\007"
#   else
#     echo -ne "\033]12;6\007"
#   fi
# }

# function zle-line-finish {
#   zle reset-prompt

#   echo -ne "\033]12;6\007"
# }

# autoload -U edit-command-line
# zle -N zle-keymap-select
# zle -N zle-line-finish
# zle -N edit-command-line

# bindkey -v
# bindkey -M vicmd v edit-command-line # ESC-v to edit in an external editor.

# bindkey ' ' magic-space
# bindkey -M vicmd "gg" beginning-of-history
# bindkey -M vicmd "G" end-of-history
# bindkey -M vicmd "k" up-line-or-history # history-search-backward
# bindkey -M vicmd "j" down-line-or-history # history-search-forward
# bindkey -M vicmd "/" history-incremental-search-backward
# bindkey -M vicmd "?" history-incremental-search-forward
# bindkey -M vicmd "u" undo
# bindkey -M vicmd "_" beginning-of-line
# bindkey -M vicmd "g_" end-of-line
# bindkey -M vicmd ":" undefined-key # annoying default bind

# zle -A .backward-kill-word vi-backward-kill-word
# zle -A .backward-delete-char vi-backward-delete-char

# bindkey -M viins 'jj' vi-cmd-mode
# bindkey -M viins "^I" expand-or-complete-prefix
# bindkey -M viins "^L" clear-screen
# bindkey -M viins "^P" up-line-or-history
# bindkey -M viins "^N" down-line-or-history
# bindkey -M viins "^R" history-incremental-search-backward
# bindkey -M viins "^W" backward-kill-word
# bindkey -M viins "^A" beginning-of-line
# bindkey -M viins "^E" end-of-line
# bindkey -M viins "^H" backward-delete-char  # vi-backward-delete-char
# bindkey -M viins "^U" backward-kill-line             # vi-kill-line
# bindkey -M viins "^?" backward-delete-char  # vi-backward-delete-char

# # allow interactive incr search, ^G or ^C to exit
# bindkey -M isearch "^P" history-incremental-search-backward
# bindkey -M isearch "^N" history-incremental-search-forward

# bindkey -M menuselect "^M" .accept-line # enter command by default
# bindkey -M menuselect "^G" accept-line # accept completion, don't enter
# bindkey -M menuselect "+" accept-and-menu-complete # accept completion, stay in menu
# bindkey -M menuselect "^[[Z" reverse-menu-complete

# bindkey -M menuselect "^P" reverse-menu-complete
# bindkey -M menuselect "^N" menu-complete


# -------------------------------------------------------------------------------
# END
# -------------------------------------------------------------------------------

# -------------------------------------------------------------------------------
# filename: /Users/steven.knight/.zsh/lib/03_functions.zsh
# -------------------------------------------------------------------------------

function _zsh_run_command # "Local zsh function to run a command"
{
    if [[ $1 != '' ]]; then
        command=$1
        echo "Command: $command"
        eval $command
    fi
}

function _print_helper
{
    a2ps_options="--tabsize=4 --highlight-level=heavy --line-numbers=5"
    command="/usr/bin/env a2ps $a2ps_options $*"
    _zsh_run_command "$command"
}

function text1p
{
    a2ps_options="--portrait --columns=1"
    if [[ $2 == '' ]]; then
        _print_helper $a2ps_options $1
    else
        _print_helper $a2ps_options $1 --output $2
    fi
}

function text1r
{
    a2ps_options="--landscape --columns=1"
    if [[ $2 == '' ]]; then
        _print_helper $a2ps_options $1
    else
        _print_helper $a2ps_options $1 --output $2
    fi
}

function text2p
{
    a2ps_options="--landscape --columns=2"
    if [[ $2 == '' ]]; then
        _print_helper $a2ps_options $1
    else
        _print_helper $a2ps_options $1 --output $2
    fi
}

function mount_sshfs
{
    if [[ $1 != '' ]]; then
         echo "mount_sshfs: host"
         exit 1
    fi
    hostname=$1
    mkdir -p /sshfs/$hostname
    sshfs skk@$hostname:/ /sshfs/$hostname
}

# From http://justinlilly.com/dotfiles/zsh.html
function dls () {
 # directory LS
 echo `ls -l | grep "^d" | awk '{ print $9 }' | tr -d "/"`
}

function dgrep() {
    # A recursive, case-insensitive grep that excludes binary files
    grep -iR "$@" * | grep -v "Binary"
}

function dfgrep() {
    # A recursive, case-insensitive grep that excludes binary files
    # and returns only unique filenames
    grep -iR "$@" * | grep -v "Binary" | sed 's/:/ /g' | awk '{ print $1 }' | sort | uniq
}

function psgrep() {
    if [ ! -z $1 ] ; then
        echo "Grepping for processes matching $1..."
        ps aux | grep $1 | grep -v grep
    else
        echo "!! Need name to grep for"
    fi
}

function killit() {
    # Kills any process that matches a regexp passed to it
    ps aux | grep -v "grep" | grep "$@" | awk '{print $2}' | xargs sudo kill
}

exip () {
    # gather external ip address
    echo -n "Current External IP: "
    curl -s -m 5 http://myip.dk | grep "ha4" | sed -e 's/.*ha4">//g' -e 's/<\/span>.*//g'
}

ips () {
    # determine local IP address
    ifconfig | grep "inet " | awk '{ print $2 }'
}

# color support in diff
if [ -x /usr/bin/colordiff ]; then
    case "$TERM" in
    xterm-color|xterm-256color) alias diff=colordiff ;;
    esac
fi

# Create and than change into it
mkcd() {
    mkdir $1 && cd $1
}

function _zsh_run_command # "Local zsh function to run a command"
{
    if [[ $1 != '' ]]; then
        command=$1
        echo "Command: $command"
        eval $command
    fi
}

function _print_helper
{
    a2ps_options="--tabsize=4 --highlight-level=heavy --line-numbers=5"
    command="/usr/bin/env a2ps $a2ps_options $*"
    _zsh_run_command "$command"
}

function text1p
{
    a2ps_options="--portrait --columns=1"
    if [[ $2 == '' ]]; then
        _print_helper $a2ps_options $1
    else
        _print_helper $a2ps_options $1 --output $2
    fi
}

function text1r
{
    a2ps_options="--landscape --columns=1"
    if [[ $2 == '' ]]; then
        _print_helper $a2ps_options $1
    else
        _print_helper $a2ps_options $1 --output $2
    fi
}

function text2p
{
    a2ps_options="--landscape --columns=2"
    if [[ $2 == '' ]]; then
        _print_helper $a2ps_options $1
    else
        _print_helper $a2ps_options $1 --output $2
    fi
}

function mount_sshfs
{
    if [[ $1 != '' ]]; then
         echo "mount_sshfs: host"
         exit 1
    fi
    hostname=$1
    mkdir -p /sshfs/$hostname
    sshfs skk@$hostname:/ /sshfs/$hostname
}

# color support in diff
if [ -x /usr/bin/colordiff ]; then
    case "$TERM" in
    xterm-color|xterm-256color) alias diff=colordiff ;;
    esac
fi

# open man page and jump to examples section
function eg(){
  man -P "less -p \"^EXAMPLES?\"" $1
}

# html man pages
function manh() {
  file=$(mktemp)
  man --html=cat $1 > $file 2>/dev/null

  if [[ -s $file ]]; then
    $BROWSER $file 2>/dev/null
  else
    echo "no man page for '$1'"
  fi
}

# find the zsh file that backs a command
# $ funcpath ls
# /usr/share/zsh/functions/Completion/Unix/_ls
function funcpath() {
  echo ${^fpath}/_${1}(N)
}

# label the current window/tab
function label() {
  print -Pn "\e]2;$1\a"
}

# serve an application with vnc
function streamapp() {
  x11vnc -id pick -display :0 -passwd $1 -viewonly -shared -forever
}

# print colors
# $ clist 16
function clist(){
  x=`tput op`
  y=`printf %76s`
  for i in {0..$1}
  do
    o=00$i
    echo -e ${o:${#o}-3:3} `tput setaf $i;tput setab $i`${y// /=}$x
  done
}

# print numerical permissions before each item in ls
function lsp() {
  command ls -lh --time-style '+%m/%d/%y %I:%M %p' --color=always $@ |\
    awk '{k=0;for(i=0;i<=8;i++)k+=((substr($1,i+2,1)~/[rwx]/)\
         *2^(8-i));if(k)printf("%0o ",k);print}'
}

# move back arbitrary number of directories
# $ cd b...
# $ cd ../../../
function cd() {
  emulate -LR zsh

  if [[ $1 == 'b.'* ]]; then
    builtin cd ${${1/"b"}//"."/"../"}
  else
    builtin cd $*
  fi
}

# list pacman packages not required by another package
# also print their package description
function pacorphans() {
  expac "%n:%N:%d" -Q $(expac "%n %G" | grep -v ' base') |\
    awk -F: '$2 == "" {printf "%s: %s\n", $1, $3}'
}

# print the package's version
function pacqv() {
  echo $(pacman -Qi $1 | grep Version | tr -s ' ' | cut -d ' ' -f 3)
}

# what is my ip? useful for syncplay and mumble
# $ ip get
#   copied <ip> to clipboard
function ip() {
  emulate -LR zsh

  if [[ $1 == 'get' ]]; then
    res=$(curl -s ipinfo.io/ip)
    echo -n $res | xsel --clipboard
    echo "copied $res to clipboard"
  # only run ip if it exists
  elif (( $+commands[ip] )); then
    command ip $*
  fi
}

# go to the dotfiles directory

function go_dots() {
  emulate -LR zsh
  cd $DOTSPATH
}

# edit the dotfiles

function edit_dots() {
  emulate -LR zsh

  # this might need customization
  # but I don't want to use $EDITOR cause I prefer gvim
  gvim --cmd "cd $DOTSPATH"
}

# update the dotfiles
function get_dots() {
  emulate -LR zsh

  pushd $DOTSPATH > /dev/null

  pre=$(git log -1 HEAD --pretty=format:%h)

  msg_info "checking for updates since $pre"

  if git pull > /dev/null 2>&1; then
    post=$(git log -1 HEAD --pretty=format:%h)

    if [[ "$pre" == "$post" ]]; then
      msg_info "no updates available"
    else
      msg_info "updated to $post\n"
      git log --oneline --format='  %C(green)+%Creset %C(bold)%h%Creset %s' $pre..HEAD
    fi
  else
    msg_fail "there was an error with updating"
  fi

  # msg_info "updating vim plugins"
  # vim +PluginInstall +qall

  popd > /dev/null

  msg_info "reloading zsh"
  exec zsh
}

# deploy the dotfiles
function put_dots() {
  emulate -LR zsh

  msg_info "deploying dots from $DOTSPATH"
  msg_info "help: "\
"$(tput bold)b$(tput sgr0)ackup, "\
"$(tput bold)o$(tput sgr0)verwrite, "\
"$(tput bold)r$(tput sgr0)emove, "\
"$(tput bold)s$(tput sgr0)kip\n"\
"          capitalize to apply to all remaining\n"

  overwrite_all=false
  backup_all=false
  skip_all=false
  remove_all=false

  for src in `find "$DOTSPATH" -mindepth 2 -maxdepth 2  -name .\* ! -path "$DOTSPATH/.git*"`; do
    dest="$HOME/`basename \"$src\"`"

    if [[ -e $dest ]] || [[ -L $dest ]]; then
      overwrite=false
      backup=false
      skip=false
      remove=false
      fname="$(tput bold)`basename $dest`$(tput sgr0)"

      if [[ "$overwrite_all" == "false" ]] &&\
         [[ "$backup_all" == "false" ]] &&\
         [[ "$remove_all" == "false" ]] &&\
         [[ "$skip_all" == "false" ]]; then
        if [[ ! -L $dest ]]; then
          msg_user "$fname exists non-linked:"
        else
          link=`readlink -mn "$dest"`
          msg_user "$fname is already linked to $link:"
        fi

        read -k 1 action

        case "$action" in
          o )
            overwrite=true;;
          O )
            overwrite_all=true;;
          b )
            backup=true;;
          B )
            backup_all=true;;
          s )
            skip=true;;
          S )
            skip_all=true;;
          r )
            remove=true;;
          R )
            remove_all=true;;
          * )
            ;;
        esac
      fi

      if [[ "$skip" == "false" ]] && [[ "$skip_all" == "false" ]]; then
        if [[ "$overwrite" == "true" ]] || [[ "$overwrite_all" == "true" ]] ||\
           [[ "$remove" == "true" ]] || [[ "$remove_all" == "true" ]]; then
          rm -rf $dest
          msg_fail "removed $fname"
        fi

        if [[ "$backup" == "true" ]] || [[ "$backup_all" == "true" ]]; then
          mv $dest{,.bak}
          msg_success "moved $fname to $fname.bak"
        fi

        if [[ "$overwrite" == "true" ]] || [[ "$overwrite_all" == "true" ]] ||\
           [[ "$backup" == "true" ]] || [[ "$backup_all" == "true" ]]; then
          link_files $src $dest
        fi
      else
        msg_info "skipped $fname"
      fi

    else
      link_files $src $dest
    fi
  done
}

# message functions
function tput_msg() {
  printf "\r$(tput el)  $(tput setaf $1)$2$(tput sgr0) $3\n"
}

function msg_info() {
  printf "\r$(tput el)  $(tput setaf 4)·$(tput sgr0) $1\n"
  # tput_msg "4" "·" $1
}

function msg_success() {
  printf "\r$(tput el)  $(tput setaf 2)+$(tput sgr0) $1\n"
  # tput_msg "2" "+" $1
}

function msg_fail() {
  printf "\r$(tput el)  $(tput setaf 1)-$(tput sgr0) $1\n"
  # tput_msg "1" "-" $1
}

function msg_user() {
  printf "\r  $(tput setaf 5)?$(tput sgr0) $1 "
}

function link_files() {
  ln -s $1 $2
  msg_success "linked $1 $(tput setaf 2)→$(tput sgr0) $2"
}

# update and deploy dots
function dots() {
  emulate -LR zsh

  echo ''

  case "$1" in
    get )
      get_dots;;
    put )
      put_dots;;
    edit )
      edit_dots;;
    go )
      go_dots;;
    * )
      msg_user "use the 'get' or 'put' commands"
      echo ''
      ;;
  esac
}

function texi-to-epub() {
    name=${1%.*}
    makeinfo --docbook $1 -o "${name}.docbook"
    xsltproc /usr/share/xml/docbook/xsl-stylesheets-1.78.1/epub/docbook.xsl "${name}.docbook"
    echo "application/epub+zip" > mimetype
    zip -0Xq "${name}.epub" mimetype
    zip -Xr9D "${name}.epub" META-INF OEBPS
}

function update_zshrc_cache() {
    /usr/local/bin/python3 "$DOTSPATH/zsh_concat.py"
    antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh
}

# -------------------------------------------------------------------------------
# END
# -------------------------------------------------------------------------------

# -------------------------------------------------------------------------------
# filename: /Users/steven.knight/.zsh/lib/22_git.zsh
# -------------------------------------------------------------------------------
if [ -f ~/src/dotfiles/.git-flow-completetion/git-flow-completion.zsh ]; then
    source ~/src/dotfiles/.git-flow-completetion/git-flow-completion.zsh
fi

export _GIT_AUTHOR_NAME="Steven Knight"
export _GIT_AUTHOR_EMAIL="steven@knight.cx"

function switch_to_personal_git_config() {
    git config --local user.name $_GIT_AUTHOR_NAME
    git config --local user.email $_GIT_AUTHOR_EMAIL
}

function update_git_commits_to_personal_config() {
    git filter-branch --commit-filter 'GIT_AUTHOR_NAME=$_GIT_AUTHOR_NAME; GIT_AUTHOR_EMAIL=$_GIT_AUTHOR_EMAIL; git commit-tree "$@";'
}

# -------------------------------------------------------------------------------
# END
# -------------------------------------------------------------------------------

# -------------------------------------------------------------------------------
# filename: /Users/steven.knight/.zsh/lib/06_setopt.zsh
# -------------------------------------------------------------------------------
# Appends every command to the history file once it is executed
# setopt inc_append_history
# Reloads the history whenever you use it
setopt share_history

# -------------------------------------------------------------------------------
# END
# -------------------------------------------------------------------------------

# -------------------------------------------------------------------------------
# filename: /Users/steven.knight/.zsh/lib/10_python.zsh
# -------------------------------------------------------------------------------
# Python
export PYTHONSTARTUP=$HOME/src/dotfiles/dotfiles/pythonstartup.py

export PYENV_ROOT="$HOME/.repos/pyenv"
export PATH="$PATH:$PYENV_ROOT/bin"

if which pyenv > /dev/null; then
    eval "$(pyenv init -)"
fi

export PYENV_VIRTUALENV_DISABLE_PROMPT=1
eval "$(pyenv virtualenv-init -)"
# -------------------------------------------------------------------------------
# END
# -------------------------------------------------------------------------------

# -------------------------------------------------------------------------------
# filename: /Users/steven.knight/.zsh/lib/20_mysql.zsh
# -------------------------------------------------------------------------------
export MYSQL_PS1="\u@\h [\d]> "

# -------------------------------------------------------------------------------
# END
# -------------------------------------------------------------------------------

# -------------------------------------------------------------------------------
# filename: /Users/steven.knight/.zsh/lib/11_rust.zsh
# -------------------------------------------------------------------------------
source $HOME/.cargo/env

# -------------------------------------------------------------------------------
# END
# -------------------------------------------------------------------------------

# -------------------------------------------------------------------------------
# filename: /Users/steven.knight/.zsh/lib/40_prompt.zsh
# -------------------------------------------------------------------------------
#PURS=$HOME/src/purs/target/release/purs
#VCPROMPT=$HOME/.cargo/bin/vcprompt
#
#function zle-line-init zle-keymap-select {
#  # PROMPT=$'$($VCPROMPT) \n $ '
#  PROMPT=`$PURS prompt -k "$KEYMAP" -r "$?"`
#  zle reset-prompt
#}
#zle -N zle-line-init
#zle -N zle-keymap-select
#
#autoload -Uz add-zsh-hook
#
#function _prompt_purs_precmd() {
#  $PURS precmd
#}
#add-zsh-hook precmd _prompt_purs_precmd
#
# export VCP_PREFIX=""
# PROMPT="%~ $(vcprompt) λ "

export SPACESHIP_CHAR_SUFFIX=' '
export SPACESHIP_CHAR_SYMBOL='λ'

export SPACESHIP_PROMPT_ORDER=(
  # time          # Time stampts section
  user            # Username section
  dir             # Current directory section
  host            # Hostname section
  git             # Git section (git_branch + git_status)
  # hg            # Mercurial section (hg_branch  + hg_status)
  # package       # Package version
  # node          # Node.js section
  # ruby          # Ruby section
  # elixir        # Elixir section
  # xcode         # Xcode section
  # swift         # Swift section
  # golang        # Go section
  # php           # PHP section
  # haskell       # Haskell Stack section
  # julia         # Julia section
  # docker        # Docker section
  # aws           # Amazon Web Services section
  # venv          # virtualenv section
  # conda         # conda virtualenv section
  pyenv           # Pyenv section
  # dotnet        # .NET section
  # ember         # Ember.js section
  # kubecontext   # Kubectl context section
  # exec_time     # Execution time
  line_sep        # Line break
  battery         # Battery level and status
  char            # Prompt character
)


export SPACESHIP_RPROMPT_ORDER=(
  pyenv         # Pyenv section
  rust          # Rust section
  jobs          # Background jobs indicator
  vi_mode       # Vi-mode indicator
  exit_code     # Exit code section
)



# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship


# -------------------------------------------------------------------------------
# END
# -------------------------------------------------------------------------------

# -------------------------------------------------------------------------------
# filename: /Users/steven.knight/.zsh/lib/61_highlight.zsh
# -------------------------------------------------------------------------------
# highlighting
# ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern root)
# ZSH_HIGHLIGHT_STYLES[precommand]='fg=magenta'

# to underline
# tput smul; then tput rmul;

export LESS_TERMCAP_mb=$(tput setaf 2) # green
export LESS_TERMCAP_md=$(tput bold; tput setaf 6) # cyan
export LESS_TERMCAP_me=$(tput sgr0)

# search
export LESS_TERMCAP_so=$(tput bold; tput setaf 11; tput setab 7) # black on gray (vim)
export LESS_TERMCAP_se=$(tput rmso; tput sgr0)

# underline start/end
export LESS_TERMCAP_us=$(tput bold; tput setaf 2) # green
export LESS_TERMCAP_ue=$(tput sgr0)

export LESS_TERMCAP_mr=$(tput rev)
export LESS_TERMCAP_mh=$(tput dim)
export LESS_TERMCAP_ZN=$(tput ssubm)
export LESS_TERMCAP_ZV=$(tput rsubm)
export LESS_TERMCAP_ZO=$(tput ssupm)
export LESS_TERMCAP_ZW=$(tput rsupm)

export LESS="--RAW-CONTROL-CHARS"

# -------------------------------------------------------------------------------
# END
# -------------------------------------------------------------------------------

# -------------------------------------------------------------------------------
# filename: /Users/steven.knight/.zsh/lib/31_osx.zsh
# -------------------------------------------------------------------------------
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD
export ITERM_CURSOR="true"

if [[ "$OSTYPE" == darwin* ]]; then
  alias ls='gls -hF --color'   # add colors for filetype recognition
  alias sed='gsed'

  export HOMEBREW_GITHUB_API_TOKEN=9c624e11371cfedc3e4e68b235200ca46bc7580d

  # antigen bundle brew
  # antigen bundle brew-cask

  # zplug "plugins/brew",   from:oh-my-zsh
  # zplug "plugins/brew-cask",   from:oh-my-zsh

  # new tab in terminal.app stays in same dir
  if [[ "$TERM_PROGRAM" == "Apple_Terminal" ]]; then
    update_terminal_cwd() {
      local URL_PATH=''
      {
        local i ch hexch LANG=C
        for ((i = 1; i <= ${#PWD}; ++i)); do
          ch="$PWD[i]"
          if [[ "$ch" =~ [/._~A-Za-z0-9-] ]]; then
            URL_PATH+="$ch"
          else
            hexch=$(printf "%02X" "'$ch")
            URL_PATH+="%$hexch"
          fi
        done
      }

      local PWD_URL="file://$HOST$URL_PATH"
      printf '\e]7;%s\a' "$PWD_URL"
    }

    autoload add-zsh-hook
    add-zsh-hook chpwd update_terminal_cwd

    update_terminal_cwd
  fi
fi


# -------------------------------------------------------------------------------
# END
# -------------------------------------------------------------------------------

# -------------------------------------------------------------------------------
# filename: /Users/steven.knight/.zsh/lib/02_completions.zsh
# -------------------------------------------------------------------------------
# completions
unsetopt menu_complete
unsetopt flowcontrol

setopt auto_menu
setopt complete_in_word
setopt always_to_end

setopt correct nocorrectall

# # directories
setopt auto_name_dirs
setopt auto_cd

zmodload -i zsh/complist

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

zstyle ':completion:*::::' completer _expand _complete _ignored _approximate
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories

# case-insensitive substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

zstyle ':completion:*:*:*:*:*' menu select=1 _complete _ignored _approximate

# # use a cache
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path $DOTSPATH/zsh/zsh/cache

# # ignore _functions
zstyle ':completion:*:functions' ignored-patterns '_*'

zstyle '*' single-ignored complete

# -------------------------------------------------------------------------------
# END
# -------------------------------------------------------------------------------

# -------------------------------------------------------------------------------
# filename: /Users/steven.knight/.zsh/lib/04_path.zsh
# -------------------------------------------------------------------------------
# typeset -U path

# prepends
path=(~/.local/bin $HOME/bin "$path[@]")
# path=(~/.cabal/bin "$path[@]")

# appends

# prune paths that don't exist
# path=($^path(N))

# -------------------------------------------------------------------------------
# END
# -------------------------------------------------------------------------------

# -------------------------------------------------------------------------------
# filename: /Users/steven.knight/.zsh/lib/05_inputrc.zsh
# -------------------------------------------------------------------------------
# key bindings
bindkey "e[1~" beginning-of-line
bindkey "e[4~" end-of-line
bindkey "e[5~" beginning-of-history
bindkey "e[6~" end-of-history
bindkey "e[3~" delete-char
bindkey "e[2~" quoted-insert
bindkey "e[5C" forward-word
bindkey "eOc" emacs-forward-word
bindkey "e[5D" backward-word
bindkey "eOd" emacs-backward-word
bindkey "ee[C" forward-word
bindkey "ee[D" backward-word
bindkey "^H" backward-delete-word
# for rxvt
bindkey "e[8~" end-of-line
bindkey "e[7~" beginning-of-line
# for non RH/Debian xterm, can't hurt for RH/DEbian xterm
bindkey "eOH" beginning-of-line
bindkey "eOF" end-of-line
# for freebsd console
bindkey "e[H" beginning-of-line
bindkey "e[F" end-of-line
# completion in the middle of a line
bindkey '^i' expand-or-complete-prefix

bindkey '^K' kill-line
bindkey '^B' backward-char


# -------------------------------------------------------------------------------
# END
# -------------------------------------------------------------------------------

# -------------------------------------------------------------------------------
# filename: /Users/steven.knight/.zsh/lib/64_direnv.zsh
# -------------------------------------------------------------------------------
eval "$(direnv hook zsh)"


# -------------------------------------------------------------------------------
# END
# -------------------------------------------------------------------------------

# -------------------------------------------------------------------------------
# filename: /Users/steven.knight/.zsh/lib/00_base.zsh
# -------------------------------------------------------------------------------

export OS_IS_MAC_OS_X=false
export OS_IS_LINUX=false
export OS_IS_WINDOWS=false
export OS_IS_POSIX=false

if [[ "$OSTYPE" == darwin* ]]; then
    export OS_IS_MAC_OS_X=true
    export OS_IS_POSIX=true
fi

if [[ "$OSTYPE" == linux* ]]; then
    export OS_IS_LINUX=true
    export OS_IS_POSIX=true
fi

function exists {
    which $1 &> /dev/null
}

function source_if_exists {
    filename=$1

    if [[ -r "$filename" ]]; then
        # echo "source filename $filename"
        source $filename
    else
        # echo "source failed for filename $filename"
    fi
}

# -------------------------------------------------------------------------------
# END
# -------------------------------------------------------------------------------
