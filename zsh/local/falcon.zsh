export PRINTER=HP_LaserJet_1020
alias reset_home_printer="sudo sed -i -e ‘/StateMessage .*lpd failed/d’ -e ‘s/State Stopped/State Idle/’ /etc/cups/printers.conf"
alias kill_subl3="pkill subl3; pkill plugin-host"

# add /usr/bin/core_perl if available
[ -d "/usr/bin/core_perl" ] && path=(/usr/bin/core_perl $path)

# add ~/.cabal/bin if available
[ -d "$HOME/.cabal/bin" ] && path=($HOME/.cabal/bin $path)

export BROWSER=google-chrome-stable

# Linux only plugins
zplug "plugins/systemd", from:oh-my-zsh, if:$OS_IS_LINUX
zplug "plugins/debian", from:oh-my-zsh, if:$OS_IS_LINUX
