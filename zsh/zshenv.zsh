#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

# load antigen
source ~/src/antigen/antigen.zsh

source "$HOME/.zsh/lib/00_base.zsh"

# strict control over source order
sources=(
    # '03_functions'
    # '04_path'
    '10_python'
    '11_ruby'
    # '20_mysql'
    # '30_linux'
    # '31_osx'
    # '40_prompt'
    # '50_hub'
    # '51_vcsinfo'
    # '60_zle'
    # '61_highlight'
    # '62_misc'
    # '63_smartcd'
)

for src in $sources; do
    source_if_exists "$HOME/.zsh/lib/$src.zsh"
done
