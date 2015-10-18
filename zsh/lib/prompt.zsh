
# prompt
setopt prompt_subst

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git hg
precmd() {
    vcs_info
}

CONTEXT_SHOW=true

# derived from https://github.com/blaenk/dots/blob/master/zsh/zsh/prompt.zsh

# mode-aware arrow
function p_arrow {
  if [[ $KEYMAP = "vicmd" ]]; then
    echo "%F{magenta}»%f"
  else
    echo "%F{cyan}»%f"
  fi
}

# colored path
function p_colored_path {
  local slash="%F{cyan}/%f"
  echo "${${PWD/#$HOME/~}//\//$slash}"
}

# hg/git info
function p_vcs {
  vcs_info
  echo $vcs_info_msg_0_
}

# Context: user@hostname (who am I and where am I)
context() {
  local user="$(whoami)"
  [[ "$user" != "$CONTEXT_DEFAULT_USER" || -n "$IS_SSH_CLIENT" ]] && echo -n "${user}@%m"
}
prompt_context() {
  local _context="$(context)"
  [[ -n "$_context" ]] && echo "$_context"
}

# Status:
# - was there an error
# - am I root
# - are there background jobs?
prompt_status() {
  local symbols
  symbols=()
  [[ $RETVAL -ne 0 ]] && symbols+="✘"
  [[ $RETVAL -ne 0 ]] && symbols+="✘ $RETVAL"
  [[ $UID -eq 0 ]] && symbols+="%{%F{yellow}%}⚡%f"
  [[ $(jobs -l | wc -l) -gt 0 ]] && symbols+="⚙"

  if [[ -n "$symbols" && $RETVAL -ne 0 ]]; then
    echo "$symbols"
  elif [[ -n "$symbols" ]]; then
    echo "$symbols"
  fi
}

# environments:
#  - ssh

function p_envs {
  local envs
  [[ -n $SSH_CLIENT ]]  && envs+="R"
  [[ -n $envs ]] && echo "%F{green}[%f$envs%F{green}]%f"
}


function virtualenv_prompt_info {
  [ $VIRTUAL_ENV ] && '('`basename $VIRTUAL_ENV`') '
}

PROMPT='
%F{blue}λ%f $(prompt_context) $(p_colored_path) $(p_envs) $(p_vcs) $(prompt_status)
$(p_arrow) '

RPROMPT='$(virtualenv_prompt_info)'
