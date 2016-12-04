integer t0=$(date '+%s')  # move this around

# echo "zshrc - top"

[[ $TERM == "dumb" ]] && unstetopt zle && PS1='$ ' && return

# save cdpath as loading oh-my-zsh will reset it
cdpath_backup=($cdpath)

# autoload modules
autoload -Uz add-zsh-hook
autoload -Uz history-search-end
autoload -Uz is-at-least
autoload -Uz zargs
autoload -Uz zmv

zplug "lib/clipboard", from:oh-my-zsh
zplug "lib/compfix", from:oh-my-zsh
zplug "lib/completion", from:oh-my-zsh
zplug "lib/correction", from:oh-my-zsh
zplug "lib/diagnostics", from:oh-my-zsh
zplug "lib/directories", from:oh-my-zsh
zplug "lib/termsupport", from:oh-my-zsh
zplug "lib/history", from:oh-my-zsh

zplug "plugins/colored-man-page",   from:oh-my-zsh
zplug "plugins/colorize",   from:oh-my-zsh
zplug "plugins/git",   from:oh-my-zsh
zplug "plugins/history", from:oh-my-zsh
zplug "plugins/mercurial", from:oh-my-zsh
zplug "plugins/ssh-agent", from:oh-my-zsh
zplug "plugins/compfix", from:oh-my-zsh
zplug "plugins/common-aliases", from:oh-my-zsh
zplug "plguins/history", from:oh-my-zsh

zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", nice:10

zplug "benjaminwhite/vim-mode-for-oh-my-zsh", from:github
zplug "b4b4r07/zsh-vimode-visual", from:github
zplug "zsh-users/zsh-autosuggestions", from:github

# MacOS only plugins
# Disable unused plugins.
#zplug "junegunn/fzf-bin", \
#      from:gh-r, \
#      as:command, \
#      rename-to:fzf, \
#      use:"*darwin*amd64*", if:$OS_IS_MAC_OS_X
# zplug "lib/clipboard", from:oh-my-zsh, if:$OS_IS_MAC_OS_X
# zplug "plugins/autotojump",   from:oh-my-zsh
# zplug "plugins/git-flow",   from:oh-my-zsh
# zplug "plugins/z", from:oh-my-zsh
# zplug "plugins/zsh_reload", from:oh-my-zsh

# load local plugins
# don't forbot to run zsh_concat.py
source_if_exists "$DOTSPATH/zsh_plugins.zsh"

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
zplug load #--verbose

# restore cdpath
cdpath+=($cdpath_backup)

# echo "zshrc - btm"

# End of zshrc
function {
    local -i t1 startup
    t1=$(date '+%s')
    startup=$(( t1 - t0 ))
    [[ $startup -gt 2 ]] && print "Hmm, poor shell startup time: $startup"
}
unset t0
