# echo "zshrc - top"
integer t0=$(date '+%s')  # move this around

if [[ -z "$HOME/.zprofile" ]]; then
    source "$HOME/.zprofile"
fi

[[ $TERM == "dumb" ]] && unstetopt zle && PS1='$ ' && return

source "$HOME/.zsh/lib/00_base.zsh"

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="simple"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

# add /usr/local/bin to PATH so tmux can be found when loading tmux plugin
if [ -d "/usr/local/bin/" ]; then
    export PATH="/usr/local/bin:$PATH"
fi

# To fix zsh compinit: insecure directories, run compaudit for list.
# chmod -R 755 $HOME/.oh-mh-zsh
# Setting ZSH_DISABLE_COMPFIX to false is necessary, otherwise some completions are working.
export ZSH_DISABLE_COMPFIX=false

plugins=(git python rust brew go npm yarn man node tmux command-not-found cp docker vi-mode)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# save cdpath as loading oh-my-zsh will reset it
# cdpath_backup=($cdpath)

# autoload modules
# autoload -Uz add-zsh-hook
# autoload -Uz history-search-end
# autoload -Uz is-at-least
# autoload -Uz zargs
# autoload -Uz zmv


# zplug "lib/clipboard", from:oh-my-zsh
# zplug "lib/compfix", from:oh-my-zsh
# zplug "lib/completion", from:oh-my-zsh
# zplug "lib/correction", from:oh-my-zsh
# zplug "lib/diagnostics", from:oh-my-zsh
# zplug "lib/directories", from:oh-my-zsh
# zplug "lib/termsupport", from:oh-my-zsh
# zplug "lib/history", from:oh-my-zsh

# zplug "plugins/colored-man-page",   from:oh-my-zsh
# zplug "plugins/colorize",   from:oh-my-zsh
# zplug "plugins/git",   from:oh-my-zsh
# zplug "plugins/history", from:oh-my-zsh
# zplug "plugins/mercurial", from:oh-my-zsh
# zplug "plugins/ssh-agent", from:oh-my-zsh
# zplug "plugins/compfix", from:oh-my-zsh
# zplug "plugins/common-aliases", from:oh-my-zsh
# zplug "plguins/history", from:oh-my-zsh

# zplug "zsh-users/zsh-history-substring-search"
# zplug "zsh-users/zsh-completions"
# zplug "zsh-users/zsh-syntax-highlighting", defer:10

# zplug "benjaminwhite/vim-mode-for-oh-my-zsh", from:github
# zplug "b4b4r07/zsh-vimode-visual", from:github
# zplug "zsh-users/zsh-autosuggestions", from:github


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
# don't forgot to run zsh_concat.py

# need to eval here otherwise we'll get complete error
# eval "$(_TMUXP_COMPLETE=source /usr/local/bin/tmuxp)"

# Install packages that have not been installed yet
# if ! zplug check --verbose; then
#     printf "Install? [y/N]: "
#     if read -q; then
#         echo; zplug install
#     else
#         echo
#     fi
# fi

# Then, source plugins and add commands to $PATH
# zplug load #--verbose

# restore cdpath

# cdpath+=($cdpath_backup)

export DOTSPATH="$HOME/.zsh"

/usr/local/bin/python3 "$DOTSPATH/zsh_concat.py"
source_if_exists "$DOTSPATH/zsh_plugins.zsh"

# End of zshrc
function {
    local -i t1 startup
    t1=$(date '+%s')
    startup=$(( t1 - t0 ))
	echo "startup-time $startup"

    [[ $startup -gt 1 ]] && print "Hmm, poor shell startup time: $startup"
}
unset t0

export PATH="$HOME/.yarn/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
