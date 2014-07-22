export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"

alias kill_subl3="pkill subl3; pkill plugin-host"

# add ~/.cabal/bin if available
[ -d "$HOME/.cabal/bin" ] && export PATH=$PATH:"$HOME/.cabal/bin"

# add /usr/bin/core_perl if available
[ -d "/usr/bin/core_perl" ] && export PATH=$PATH:"/usr/bin/core_perl"

export BROWSER=google-chrome-stable
