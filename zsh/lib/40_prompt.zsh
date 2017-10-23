
# https://github.com/nojhan/liquidprompt
# source ~/src/dotfiles/.liquidprompt/liquidprompt


PURS=$HOME/src/purs/target/release/purs

function zle-line-init zle-keymap-select {
  PROMPT=`$PURS prompt -k "$KEYMAP" -r "$?"`
  zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

autoload -Uz add-zsh-hook

function _prompt_purs_precmd() {
  $PURS precmd
}
add-zsh-hook precmd _prompt_purs_precmd
