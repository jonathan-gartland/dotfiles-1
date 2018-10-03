# add /usr/texbin to PATH, if available
[[ -d "/usr/texbin" ]] && path=(/usr/texbin $path)

alias dircolors=gdircolors

alias show_dot_files='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hide_dot_files='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# zplug "plugins/brew",   from:oh-my-zsh
# zplug "plugins/osx",   from:oh-my-zsh
# zplug "/usr/local/share/zsh/site-functions/_aws", from:local
source $HOME/Projects/cashbot/scripts/cashbot_defs.sh

export PATH="/usr/local/mysql/bin:/usr/local/bin:/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# set to avoid message "Warning: The default Caskroom location has moved to /usr/local/Caskroom"
# export HOMEBREW_CASK_OPTS="--caskroom=/opt/homebrew-cask/Caskroom"

export EVENT_NOKQUEUE=1

fpath=(/usr/local/share/zsh/site-functions $fpath)

export PATH=$PATH:/usr/local/opt/go/libexec/bin:/Library/TeX/texbin/

type ls > /dev/null && unset -f ls 2> /dev/null
type ll > /dev/null && unset -f ll 2> /dev/null
type lR > /dev/null && unset -f lR 2> /dev/null
type lr > /dev/null && unset -f lr 2> /dev/null

alias ls='exa'
alias ll='exa --long --classify --time-style long-iso'
alias lR='exa --recurse'
alias lt='exa --tree --long'
alias lr='exa --long --reverse --sort modified'
alias lg='exa --git --long'
alias hg='/usr/local/bin/hg'

# https://github.com/dvorka/hstr

# add this configuration to ~/.zshrc
export HISTFILE=~/.zsh_history  # ensure history file visibility
export HH_CONFIG=hicolor        # get more colors
# bind hh to Ctrl-r (for Vi mode check doc)
bindkey -s '^R' '^Ahh ^M'   

export GOPATH=$HOME/.go
export PATH=$PATH:/usr/local/opt/go@1.8/libexec/bin

if [ -f ~/.config/exercism/exercism_completion.zsh ]; then
  . ~/.config/exercism/exercism_completion.zsh
fi

export RUST_SRC_PATH=${HOME}/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src
export DYLD_LIBRARY_PATH=${HOME}/.rustup/toolchains/stable-x86_64-apple-darwin/lib
export RLS_ROOT=${HOME}/src/rls

# . /Applications/Docker.app/Contents/Resources/etc/docker.zsh-completion
# . /Applications/Docker.app/Contents/Resources/etc/docker-compose.zsh-completion
# . /Applications/Docker.app/Contents/Resources/etc/docker-machine.zsh-completion 

export PATH="$PATH:/Users/steven.knight/Projects/git_hooks/commands"


export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# Add to .bashrc, too
export CASHSTAR_HOOKS=$HOME/Projects/git_hooks/


alias chunkwm_stop='brew services stop chunkwm'
alias chunkwm_start='brew services start chunkwm'
alias chunkwm_restart='chunkwm_stop && chunkwm_start'

alias skhd_stop='brew services stop skhd'
alias skhd_start='brew services start skhd'
alias skhd_restart='skhd_stop && skhd_start'
