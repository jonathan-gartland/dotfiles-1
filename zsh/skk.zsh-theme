
rvm_prompt_info() {
    if [[ -s ~/.rvm/scripts/rvm ]] ; then
        rvm_prompt="$(~/.rvm/bin/rvm-prompt)"
    fi
    echo "[$rvm_prompt]"
}

node_prompt_info() {
    if which node > /dev/null; then
        node_prompt="node $(node -v)"
    fi
    echo "[$node_prompt]"
}

get_pwd() {
  echo "${PWD/$HOME/~}"
}

source ~/dot-files-forest/zsh-vcs-prompt/zshrc.sh

ZSH_VCS_PROMPT_ENABLE_CACHING='true'

ZSH_VCS_PROMPT_AHEAD_SIGIL='↑'
ZSH_VCS_PROMPT_BEHIND_SIGIL='↓'
ZSH_VCS_PROMPT_STAGED_SIGIL='●'
ZSH_VCS_PROMPT_CONFLICTS_SIGIL='✖'
ZSH_VCS_PROMPT_UNSTAGED_SIGIL='✚'
ZSH_VCS_PROMPT_UNTRACKED_SIGIL='…'
ZSH_VCS_PROMPT_STASHED_SIGIL='⚑'
ZSH_VCS_PROMPT_CLEAN_SIGIL='✔ '

# VCS name
ZSH_VCS_PROMPT_GIT_FORMATS='' #'(%{%B%F{yellow}%}#s%{%f%b%})'
# Branch name
ZSH_VCS_PROMPT_GIT_FORMATS+='[%{%B%F{red}%}#b%{%f%b%}'
# Ahead and Behind
ZSH_VCS_PROMPT_GIT_FORMATS+='#c#d|'
# Staged
ZSH_VCS_PROMPT_GIT_FORMATS+='%{%F{blue}%}#e%{%f%b%}'
# Conflicts
ZSH_VCS_PROMPT_GIT_FORMATS+='%{%F{red}%}#f%{%f%b%}'
# Unstaged
ZSH_VCS_PROMPT_GIT_FORMATS+='%{%F{yellow}%}#g%{%f%b%}'
# Untracked
ZSH_VCS_PROMPT_GIT_FORMATS+='#h'
# Stashed
ZSH_VCS_PROMPT_GIT_FORMATS+='%{%F{cyan}%}#i%{%f%b%}'
# Clean
ZSH_VCS_PROMPT_GIT_FORMATS+='%{%F{green}%}#j%{%f%b%}]'


RPROMPT='$(vcs_super_info) %{$fg[white]%}$(rvm_prompt_info)$(node_prompt_info)%{$reset_color%} $EPS1'

PROMPT='
%{$fg[cyan]%}[%~% ]
%{$fg[magenta]%}%n%{$reset_color%} at %{$fg[yellow]%}%m%{$reset_color%} %B$%b '
