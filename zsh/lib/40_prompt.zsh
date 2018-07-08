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

