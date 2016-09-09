# echo "zshrc - top"

[[ $TERM == "dumb" ]] && unstetopt zle && PS1='$ ' && return

# save cdpath as loading oh-my-zsh will reset it
cdpath_backup=($cdpath)

source "$HOME/.zsh/lib/00_base.zsh"

zplug "plugins/auestojump",   from:oh-my-zsh
zplug "plugins/colored-man-page",   from:oh-my-zsh
zplug "plugins/colorize",   from:oh-my-zsh
zplug "plugins/git",   from:oh-my-zsh
zplug "plugins/git-flow",   from:oh-my-zsh
zplug "plugins/mercurial", from:oh-my-zsh
zplug "plugins/mix", from:oh-my-zsh
zplug "plugins/ssh-agent", from:oh-my-zsh
zplug "plugins/sudo", from:oh-my-zsh
zplug "plugins/systemd", from:oh-my-zsh
zplug "plugins/vundle", from:oh-my-zsh
zplug "plugins/vagrant", from:oh-my-zsh
zplug "plugins/z", from:oh-my-zsh
zplug "plugins/compfix", from:oh-my-zsh
zplug "zsh-users/zsh-autosuggestions", from:github
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting", nice:10
zplug "plugins/zsh_reload", from:oh-my-zsh
zplug "zsh-users/zsh-completions"

# MAC OS X only plugins
zplug "junegunn/fzf-bin", \
      from:gh-r, \
      as:command, \
      rename-to:fzf, \
      use:"*darwin*amd64*", if:$OS_IS_MAC_OS_X
zplug "lib/clipboard", from:oh-my-zsh, if:$OS_IS_MAC_OS_X

# load local plugins
zplug "$DOTSPATH/lib", from:local

# files which need to be source'd, not loaded via zplug
source_if_exists "$DOTSPATH/lib/05_inputrc.zsh"
source_if_exists "$DOTSPATH/local/$HOSTNAME.zsh"

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
zplug load # --verbose

# restore cdpath
cdpath+=($cdpath_backup)

# echo "zshrc - btm"
