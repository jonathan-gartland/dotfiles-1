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

