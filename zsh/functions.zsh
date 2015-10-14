
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

# function killit() {
#     # Kills any process that matches a regexp passed to it
#     ps aux | grep -v "grep" | grep "$@" | awk '{print $2}' | xargs sudo kill
# }

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
