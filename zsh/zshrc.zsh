# echo "zshrc - top"

[[ $TERM == "dumb" ]] && unstetopt zle && PS1='$ ' && return

# load zplug
source ~/.zplug/init.zsh

# save cdpath as loading oh-my-zsh will reset it
cdpath_backup=($cdpath)

source "$HOME/.zsh/lib/00_base.zsh"

zplug "robbyrussell/oh-my-zsh", from:github

# zplug "zsh-users/zsh-history-substring-search"
# zplug "zsh-users/zsh-syntax-highlighting"

# Supports oh-my-zsh plugins and the like
zplug "plugins/git",   from:oh-my-zsh

# zplug "lib/clipboard", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"


# antigenfrom: use oh-my-zsh
# antigen bundles <<EOBUNDLES
# autojump
# colored-man-pages
# colorize
# common-aliases
# git
# git-flow
# mercurial
# mix
# ssh-agent
# sudo
# systemd
# vundle
# vagrant
# z
# zsh-users/zsh-syntax-highlighting
# zsh-users/zsh-autosuggestions
# EOBUNDLES
# antigen apply

# ruby
# rbenv
# gem
# rails

# # strict control over source order
# sources=(
#     '01_alias'
#     '02_completions'
#     '03_functions'
#     '04_path'
#     '05_inputrc'
#     '10_python'
#     # '11_ruby'
#     '20_mysql'
#     '30_linux'
#     '31_osx'
#     '40_prompt'
#     '50_hub'
#     '51_vcsinfo'
#     # '60_zle'
#     # '61_highlight'
#     '62_misc'
#     '63_smartcd'
# )

# for src in $sources; do
#     source_if_exists "$HOME/.zsh/lib/$src.zsh"
# done

# # Can manage local plugins
zplug "~/.zsh/lib", from:local

# Install packages that have not been installed yet
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    else
        echo
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose

# restore cdpath
cdpath+=($cdpath_backup)

# echo "zshrc - btm"
