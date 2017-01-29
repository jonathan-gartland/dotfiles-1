# add /usr/texbin to PATH, if available
[[ -d "/usr/texbin" ]] && path=(/usr/texbin $path)

alias dircolors=gdircolors

alias show_dot_files='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hide_dot_files='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# https://github.com/tonsky/AnyBar
function anybar { echo -n $1 | nc -4u -w0 localhost ${2:-1738}; }

zplug "plugins/brew",   from:oh-my-zsh
zplug "plugins/osx",   from:oh-my-zsh
zplug "/usr/local/share/zsh/site-functions/_aws", from:local
zplug "$HOME/src/cashbot/scripts/cashbot_defs.sh", from:local

export PATH="/usr/local/bin:/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# set to avoid message "Warning: The default Caskroom location has moved to /usr/local/Caskroom"
export HOMEBREW_CASK_OPTS="--caskroom=/opt/homebrew-cask/Caskroom"

export EVENT_NOKQUEUE=1

