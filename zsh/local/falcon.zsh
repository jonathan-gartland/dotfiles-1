if [ $HOSTNAME = "falcon" ]; then
    export PRINTER=HP_LaserJet_1020
    alias reset_home_printer="sudo sed -i -e ‘/StateMessage .*lpd failed/d’ -e ‘s/State Stopped/State Idle/’ /etc/cups/printers.conf"
    alias kill_subl3="pkill subl3; pkill plugin-host"

    # add ~/.cabal/bin if available
    if [ -d "$HOME/.cabal/bin" ]; then
        export PATH=$PATH:"$HOME/.cabal/bin"
    fi

    if [ -d "/usr/bin/core_perl" ]; then
        export PATH=$PATH:"/usr/bin/core_perl"
    fi

    export BROWSER=google-chrome-stable
fi
