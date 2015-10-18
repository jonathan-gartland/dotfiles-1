[[ $TERM == "dumb" ]] && unsetopt zle && PS1='$ ' && return

# load antigen
source ~/dot-files-forest/antigen/antigen.zsh

# save cdpath as loading oh-my-zsh will reset it
cdpath_backup=($cdpath)

antigen use oh-my-zsh

# grep: warning: GREP_OPTIONS is deprecated; please use an alias or script
# Waiting for oh-my-zsh
alias grep="grep $GREP_OPTIONS"
unset GREP_OPTIONS

export HOMEBREW_GITHUB_API_TOKEN=f4f09dc15dce213977f8def81db6c03a1d6b5569

# restore cdpath
cdpath=($cdpath_backup)

antigen bundles <<EOBUNDLES
    brew
    brew-cask
    debian

    autojump
    colored-man
    colorize
    common-aliases
    git
    git-flow
    mercurial

    gem
    rails
    ruby

    mix

    ssh-agent
    sudo
    systemd
    vundle
    virtualenvwrapper
    z

    zsh-users/zsh-syntax-highlighting
EOBUNDLES

# antigen theme https://github.com/caiogondim/bullet-train-oh-my-zsh-theme bullet-train

# LP_ENABLE_SVN=false
# LP_ENABLE_BZR=false
# LP_ENABLE_POSSIL=false
# LP_ENABLE_TIME=false

#gpg-agent
#rvm

# BULLETTRAIN_TIME_SHOW=false
# BULLETTRAIN_CONTEXT_SHOW=true
# BULLETTRAIN_EXIT_SHOW=true
# BULLETTRAIN_RVM_SHOW=true
# BULLETTRAIN_VIRTUALENV_SHOW=true
# BULLETTRAIN_PROMPT_CHAR="❯"
# ZSH_THEME_GIT_PROMPT_UNTRACKED=" %F{magenta}✭%F{black}"
# BULLETTRAIN_RVM_FG=black
# BULLETTRAIN_VIRTUALENV_FG=black
# BULLETTRAIN_VIRTUALENV_SHOW=show

# enable_rvm() {
#     [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
#     antigen bundle rvm
# }

# enable_virtualenv() {
#   antigen bundle virtualenvwrapper
# }

# build_prompt() {
#   RETVAL=$?
#   prompt_status
#   prompt_time
#   prompt_virtualenv
#   prompt_context
#   prompt_dir
#   prompt_git
#   prompt_virtualenv
#   prompt_end
# }
# prompt_rvm

antigen apply

# if [[ -f /usr/share/zsh/site-contrib/powerline.zsh ]]; then
#     . /usr/share/zsh/site-contrib/powerline.zsh
# fi

# use local pacman
if [[ -x $(which etckeeper) && -x $(which ~/bin/pacman-etckeeper) ]]; then
    alias pacman=pacman-etckeeper
fi

# load functions
source ~/.zsh/functions.zsh

## aliases

platform=$(uname -s)

if [ $platform = 'Darwin' ]; then
    alias ls='gls -hF --color'   # add colors for filetype recognition
else
    alias ls='ls -hF --color'   # add colors for filetype recognition
fi

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
alias b="bundle"

# Rails
alias migrate="rake db:migrate db:rollback && rake db:migrate"
alias m="migrate"
alias rk="rake"
alias s="rspec"

## completions

## misc

# set default umask
umask 002

# load (optional) percol
function exists { which $1 &> /dev/null }

if exists percol; then
    function percol_select_history() {
        local tac
        exists gtac && tac="gtac" || { exists tac && tac="tac" || { tac="tail -r" } }
        BUFFER=$(fc -l -n 1 | eval $tac | percol --query "$LBUFFER")
        CURSOR=$#BUFFER         # move cursor
        zle -R -c               # refresh
    }

    zle -N percol_select_history
    bindkey '^R' percol_select_history
fi

# load fasd
[[ -s $(which fasd) ]] && eval "$(fasd --init auto)"

# load LS colors
[[ -s $HOME/dot-files-forest/LS_COLORS/LS_COLORS ]] && eval $(dircolors -b $HOME/dot-files-forest/LS_COLORS/LS_COLORS)


# # http://superuser.com/questions/521657/zsh-automatically-set-environment-variables-for-a-directory
# function chpwd_profiles() {
#     local profile context
#     local -i reexecute

#     context=":chpwd:profiles:$PWD"
#     zstyle -s "$context" profile profile || profile='default'
#     zstyle -T "$context" re-execute && reexecute=1 || reexecute=0

#     if (( ${+parameters[CHPWD_PROFILE]} == 0 )); then
#         typeset -g CHPWD_PROFILE
#         local CHPWD_PROFILES_INIT=1
#         (( ${+functions[chpwd_profiles_init]} )) && chpwd_profiles_init
#     elif [[ $profile != $CHPWD_PROFILE ]]; then
#         (( ${+functions[chpwd_leave_profile_$CHPWD_PROFILE]} )) \
#             && chpwd_leave_profile_${CHPWD_PROFILE}
#     fi
#     if (( reexecute )) || [[ $profile != $CHPWD_PROFILE ]]; then
#         (( ${+functions[chpwd_profile_$profile]} )) && chpwd_profile_${profile}
#     fi

#     CHPWD_PROFILE="${profile}"
#     return 0
# }
# chpwd_functions=( ${chpwd_functions} chpwd_profiles )

# zstyle ':chpwd:profiles:/home/skk/Projects/simple_virtual_machine(|/|/*)' SVM
# zstyle ':chpwd:profiles:~/Projects/simple_virtual_machine(|/|/*)' SVM


# chpwd_profile_SVM() {
#     print "profile ${profile}"
#     [[ ${profile} == ${CHPWD_PROFILE} ]] && return 1
#     print "chpwd(): Switching to profile: $profile"
#     # antigen bundle virtualenvwrapper
# }

# Python
export PYTHONSTARTUP=$HOME/dot-files-forest/dotfiles/pythonstartup.py

if [ -f "/usr/local/bin/virtualenvwrapper.sh" ]; then
    source /usr/local/bin/virtualenvwrapper.sh
fi

# See http://www.doughellmann.com/docs/virtualenvwrapper/
export WORKON_HOME=$HOME/.virtualenvs
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_REQUIRE_VIRTUALENV=true
export PIP_RESPECT_VIRTUALENV=true
export VIRTUALENV_USE_DISTRIBUTE=True
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS=--no-site-packages
export MYSQL_PS1="\u@\h [\d]> "


# strict control over source order
sources=(
#  'hub'
#  'path'
#  'rbenv'
#  'chruby'
  'vcsinfo'
  'prompt'
#  'completions'
#  'zle'
#  'highlight'
#  'functions'
#  'alias'
#  'linux'
#  'osx'
#  'gtags'
#  'gnome-keyring'
)

for src in $sources; do
    filename=~/.zsh/lib/$src.zsh
    source $filename
done

# if [ -f  ]/usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
#   source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# fi