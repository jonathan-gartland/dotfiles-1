# load oh-my-fish config
source ~/.config/fish/oh-my-fish.fish

## init

set -x HOSTNAME (/usr/bin/env hostname -f)
set -x DNS_DOMAIN_NAME (/usr/bin/env dnsdomainname)

## set env. variables
set -x PAGER less
set -x LESS '-FSRX'
set -x CDPATH . ~ ~/src ~/work ~/Projects/
set -x PATH $PATH $HOME/local/bin $HOME/bin
set -x ORACLE_COMMAND "$HOME/bin/pysql.sh"
set -x GIT_EDITOR vim
set -x EDITOR vim
set -x VISUAL vim

# add ~/.cabal/bin if available
if test -d "$HOME/.cabal/bin"
    set -x PATH $PATH "$HOME/.cabal/bin"
end

if test -d "/usr/bin/core_perl"
    set -x PATH $PATH "/usr/bin/core_perl"
end

# colorize output from man
# http://www.tuxarena.com/2012/04/tutorial-colored-man-pages-how-it-works/
set -x LESS_TERMCAP_mb (printf '\e[01;31m') # enter blinking mode
set -x LESS_TERMCAP_md (printf '\e[01;38;5;75m') # enter double-bright mode
set -x LESS_TERMCAP_me (printf '\e[0m') # turn off all appearance modes (mb, md, so, us)
set -x LESS_TERMCAP_se (printf '\e[0m') # leave standout mode
set -x LESS_TERMCAP_so (printf '\e[01;33m') # enter standout mode
set -x LESS_TERMCAP_ue (printf '\e[0m') # leave underline mode
set -x LESS_TERMCAP_us (printf '\e[04;38;5;200m') # enter underline mode

if test $HOSTNAME = "falcon.skk"
    set -x PRINTER HP_LaserJet_1020
    alias reset_home_printer="sudo sed -i -e ‘/StateMessage .*lpd failed/d’ -e ‘s/State Stopped/State Idle/’ /etc/cups/printers.conf"
end

## aliases

alias cp='cp -i'
alias df='df -h'
alias du='du -h'
alias grep='grep --color=auto --ignore-case'
alias vgrep='grep --with-filename --line-number --color=auto --ignore-case'
alias la='ls -al'    # show hidden files
alias lc='ls -lcr'  # sort by change time
alias lk='ls -lSr'  # sort by size
alias ll='ls -l'
alias lm='ls -al |less'     # pipe through 'more'
alias lR='ls -lR'    # recursive ls
alias lr='ls -ltr'  # sort by date DSC
alias ls='ls -hF --color'            # add colors for filetype recognition
alias lC='ls -hF --color=never'          # add colors for filetype recognition
alias lt='ls -lt'   # sort by date ASC
alias lu='ls -lur'  # sort by access time
alias lx='ls -lXB'  # sort by extension
alias mkdir='mkdir -p'
alias more='less'
alias mv='mv -i'
alias pl='tail -f -n 30 $HOME/.procmail/log/procmail'
alias putty='set TERM=putty'
alias rm='rm -i'
alias today='date +%F'
alias todayISO1806='date -u +"%FT%TZ"'
alias tree='tree -Csuh'     # nice alternative to 'ls'
alias watch='watch -n 1'
alias ssh='ssh -C -Y'
alias scp='scp -C'
alias tmux='tmux -f ~/.tmux.conf'

# From http://justinlilly.com/dotfiles/zsh.html
alias svim="sudo vim" # Run vim as super user

# From http://www.thegeekstuff.com/2008/10/6-awesome-linux-cd-command-hacks-productivity-tip3-for-geeks/
alias ..="cd .."
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
alias ..5="cd ../../../../.."


## completions

if test -f ~/dot-files-forest/git-flow-completion/git.fish
    source ~/dot-files-forest/git-flow-completion/git.fish
end

if test -d ~/dot-files-forest/fish-nuggets/completions
    source ~/dot-files-forest/fish-nuggets/completions/*
end

## misc

# set default umask
umask 002

## gpg-agent

if test $EUID -ne 0
    set -l envfile "$HOME/.gnupg/gpg-agent.env"
    set -l envfile_fish "$HOME/.gnupg/gpg-agent.env.fish"
    if test -e "$envfile" -a kill -0 (grep GPG_AGENT_INFO "$envfile" | cut -d: -f 2) 2>/dev/null
        source $envfile_fish
    else
        gpg-agent --daemon --enable-ssh-support --write-env-file "$envfile"
        ~/bin/convert_bash_setup_file.py < $envfile > $envfile_fish
        source $envfile_fish
    end
end
