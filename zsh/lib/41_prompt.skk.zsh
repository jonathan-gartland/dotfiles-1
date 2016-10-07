
# rvm_prompt_info() {
#     if [[ -s ~/.rvm/scripts/rvm ]] ; then
#         rvm_prompt="$(~/.rvm/bin/rvm-prompt)"
#     fi
#     if [[ -n "$rvm_prompt" ]]; then
#         echo "[$rvm_prompt]"
#     else
#         echo ""
#     fi
# }

# node_prompt_info() {
#     if which node > /dev/null; then
#         node_prompt="node $(node -v)"
#     fi
#     if [[ -n "$node_prompt" ]]; then
#         echo "[$node_prompt]"
#     else
#         echo ""
#     fi
# }

# #function prompt_pwd {
# #    echo $PWD | sed -e "s|^$HOME|~|"
# #}

# function prompt_char {
#     if [ $UID -eq 0 ]; then echo "%{$fg[red]%}#%{$reset_color%}"; else echo $; fi
# }

# # get_pwd() {

# #     local basedir_name=$(basename $(prompt_pwd))

# #     # pwd
# #     # The pwd segment format is X:P(C) where:
# #     #   X is either home or /
# #     #   P is the current working path basename (name of the current directory)
# #     #   C is the depth of the path starting from X
# #     # If the pwd is home or / then the prompt format is simplified to 'home' or
# #     # '/' without the current directory and depth.
# #     local ps_pwd=""
# #     if [[ -z "$ps_git" ]]; then
# #         local depth=$(echo $(pwd) | cut -d "/" --output-delimiter=" " -f 1- | wc -w)
# #         local in_home=$(echo $(pwd) | grep ~)
# #         if [[ -n "$in_home" ]]; then
# #           ps_pwd="home"
# #         else
# #           ps_pwd="/"
# #         fi
# #         if [ "$(echo $(pwd))" != "~" -a "$(echo $(pwd))" != "/" ]; then
# #           ps_pwd="$ps_pwd:$basedir_name"
# #           if [[ -n "$in_home" ]]; then
# #             ((depth-=2))
# #           fi
# #           ps_pwd="$ps_pwd($depth)"
# #         fi
# #     fi
# #     #echo "$ps_pwd"

# #     echo '%{$fg[red]%}%30<...<%~%<<%{$reset_color%}'

# #     #echo "${PWD/$HOME/~}"

# #     # Prints out the current working directory in fishy-style.
# #     #echo $(pwd | perl -pe "s|^$HOME|~|g; s|/([^/])[^/]*(?=/)|/\$1|g")
# # }

# # For example, '~/projects/dotfiles' becomes '~/p/dotfiles'

# source ~/dot-files-forest/zsh-vcs-prompt/zshrc.sh

# ZSH_VCS_PROMPT_ENABLE_CACHING='true'

# ZSH_VCS_PROMPT_AHEAD_SIGIL='↑'
# ZSH_VCS_PROMPT_BEHIND_SIGIL='↓'
# ZSH_VCS_PROMPT_STAGED_SIGIL='●'
# ZSH_VCS_PROMPT_CONFLICTS_SIGIL='✖'
# ZSH_VCS_PROMPT_UNSTAGED_SIGIL='✚'
# ZSH_VCS_PROMPT_UNTRACKED_SIGIL='…'
# ZSH_VCS_PROMPT_STASHED_SIGIL='⚑'
# ZSH_VCS_PROMPT_CLEAN_SIGIL='✔'

# # VCS name
# ZSH_VCS_PROMPT_GIT_FORMATS='' #'(%{%B%F{yellow}%}#s%{%f%b%})'
# # Branch name
# ZSH_VCS_PROMPT_GIT_FORMATS+='[%{%B%F{red}%}#b%{%f%b%}'
# # Ahead and Behind
# ZSH_VCS_PROMPT_GIT_FORMATS+='#c#d|'
# # Staged
# ZSH_VCS_PROMPT_GIT_FORMATS+='%{%F{blue}%}#e%{%f%b%}'
# # Conflicts
# ZSH_VCS_PROMPT_GIT_FORMATS+='%{%F{red}%}#f%{%f%b%}'
# # Unstaged
# ZSH_VCS_PROMPT_GIT_FORMATS+='%{%F{yellow}%}#g%{%f%b%}'
# # Untracked
# ZSH_VCS_PROMPT_GIT_FORMATS+='#h'
# # Stashed
# ZSH_VCS_PROMPT_GIT_FORMATS+='%{%F{cyan}%}#i%{%f%b%}'
# # Clean
# ZSH_VCS_PROMPT_GIT_FORMATS+='%{%F{green}%}#j%{%f%b%}]'


# RPROMPT='$(vcs_super_info) %{$fg[white]%}$(rvm_prompt_info)$(node_prompt_info)%{$reset_color%} $EPS1'

# PROMPT='
# %{$fg[cyan]%}[%d]
# %{$fg[magenta]%}%n%{$reset_color%}@%{$fg[yellow]%}%m%{$reset_color%} %B$(prompt_char)%b '

