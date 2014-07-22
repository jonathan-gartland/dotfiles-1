export PRINTER=HP_LaserJet_1020
alias reset_home_printer="sudo sed -i -e ‘/StateMessage .*lpd failed/d’ -e ‘s/State Stopped/State Idle/’ /etc/cups/printers.conf"
alias kill_subl3="pkill subl3; pkill plugin-host"

# add ~/.cabal/bin if available
[ -d "$HOME/.cabal/bin" ] && export PATH=$PATH:"$HOME/.cabal/bin"

# add /usr/bin/core_perl if available
[ -d "/usr/bin/core_perl" ] && export PATH=$PATH:"/usr/bin/core_perl"

export BROWSER=google-chrome-stable
