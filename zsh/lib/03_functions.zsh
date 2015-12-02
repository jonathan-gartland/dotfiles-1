
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
