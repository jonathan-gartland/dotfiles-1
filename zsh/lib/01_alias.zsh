# dots zsh

# tmux
alias tmux="tmux -2"
alias t="tmux"
alias tn="tmux new -s"
alias ta="tmux a -t"
alias taro="tmux a -rt"

# emacs
alias e="emacsclient -nc"
alias em="emacs"

# ag
alias agq="ag -Q"

# ;)
alias ":q"="exit"
alias ":qa"='[[ -n $TMUX ]] && tmux confirm-before kill-session'

alias tsup="sudo ntpd -qg"

# fixes weird problem in tmux and ssh with zsh-syntax-highlighting
alias sudo='sudo '

alias svim='sudoedit'

# don't interpret brackets in arguments as glob patterns
alias rake='noglob rake'

# prompt if deleting more than 3 files
# alias rm='rm -I'

# update vundle
alias vimup='vim +PluginInstall! +qall'

if (( $+commands[tlmgr] )); then
    alias tlmgr-search-file='tlmgr search --global --file'
fi

if (( $+commands[xsel] )); then
  alias cbc='xsel -i -b'
  alias cbp='xsel -o -b'
elif (( $+commands[pbcopy] )); then
  alias cbc='pbcopy'
  alias cbp='pbpaste'
fi

if (( $+commands[multirust] )); then
  alias mr='multirust'
  alias mrup="multirust update"
fi

if (( $+commands[gist] )); then
  alias gist='gist -c -o'
fi

if (( $+commands[systemctl] )); then
  alias sc="systemctl"
  alias scu="systemctl --user"
  alias jc="journalctl"
  alias jcu="journalctl --user-unit"
fi

if (( $+commands[pacman] )); then
  alias pacup="sudo pacman -Syu"
  alias pacin="sudo pacman -S"
  alias packg="sudo pacman -U"
  alias pacun="sudo pacman -Rs"

  # search remote/local for package
  alias pacss="pacman -Ss"
  alias pacqs="pacman -Qs"

  # information about a package
  alias pacqi="pacman -Qi"
  alias pacsi="pacman -Si"

  # list files owned by package
  alias pacql="pacman -Ql"

  # who owns this file
  alias pacqo="pacman -Qo"

  # all foreign packages
  alias pacqm="pacman -Qm"
fi

if (( $+commands[aura] )); then
  alias aura="aura -x"

  alias aurin="sudo aura -A"

  # update packages, show pkgbuild diffs, remove orphan make deps
  alias aurup="sudo aura -Akua"

  # same as above but also update repo-sourced packages
  alias aurud="sudo aura -Akua --devel"

  # edit pkgbuild before install
  alias aured="sudo aura -A --hotedit"

  alias aurai="aura -Ai"

  # only show first 10 results
  alias auras="aura -As --head=5"

  # check pkgbuild. useful when piped to vim -
  alias aurpb="aura -Ap"

  # download tarball only
  alias aurdl="aura -Aw"

  # downgrade specific packages
  alias aurdg="sudo aura -C"

  # save n package versions, remove the rest from cache
  alias aurcc="sudo aura -Cc"

  # show pacman log
  alias aurlg="aura -L"

  # show pacman log for certain package
  alias aurli="aura -Li"
fi


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
alias tmux='tmux -f ~/.tmux.conf'
alias ln='ln -v'
alias dff='cd ~/dot-files-forest'

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

# Bundler
# alias b="bundle"

# Rails
# alias migrate="rake db:migrate db:rollback && rake db:migrate"
# alias m="migrate"
# alias rk="rake"
# alias s="rspec"

# grep: warning: GREP_OPTIONS is deprecated; please use an alias or script
# Waiting for oh-my-zsh
alias grep="grep $GREP_OPTIONS"
unset GREP_OPTIONS

alias rm='rm -i'

alias clean_pyc="find . -name '.pyc' -delete"

