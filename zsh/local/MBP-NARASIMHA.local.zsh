# add /usr/texbin to PATH, if available
[[ -d "/usr/texbin" ]] && path=(/usr/texbin $path)

# alias QA='workon QA; cd ~/Projects/QA'
# alias start_selenium='cd ~/Projects/QA/webdriver/MacOSX/; sh start_webdriver.sh'

alias dircolors=gdircolors

alias show_dot_files='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hide_dot_files='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

export PYTHONPATH=$HOME/src/hooks:$PYTHONPATH

# https://github.com/tonsky/AnyBar
function anybar { echo -n $1 | nc -4u -w0 localhost ${2:-1738}; }
