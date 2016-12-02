source "$HOME/.zsh/lib/00_base.zsh"

# add /usr/texbin to PATH, if available
[[ -d "/usr/texbin" ]] && path=(/usr/texbin $path)

alias dircolors=gdircolors

alias show_dot_files='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hide_dot_files='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

export PYTHONPATH=$HOME/src/hooks:$PYTHONPATH

# https://github.com/tonsky/AnyBar
function anybar { echo -n $1 | nc -4u -w0 localhost ${2:-1738}; }

zplug "plugins/brew",   from:oh-my-zsh
zplug "plugins/osx",   from:oh-my-zsh
zplug "/usr/local/share/zsh/site-functions/_aws", from:local
zplug "$HOME/Projects/cashbot/scripts/cashbot_defs.sh", from:local
zplug "$HOME/src/cashbot/scripts/cashbot_defs.sh", from:local

PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

function update_hg_tag {
    hg tag $1
    hg tag --force LATEST_RELEASE
}

function nvm {
    export NVM_DIR="$HOME/.nvm"
    . "$(brew --prefix nvm)/nvm.sh"
}
