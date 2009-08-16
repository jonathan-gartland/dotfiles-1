function _fish_vim_selector


    # Get vim/gvim from $argv
    set vim_or_gvim $argv[1]
    
    # Remove vim/gvim value, now $argv will only contain any extra arguments for (g)vim
    set -e argv[1]

    # At present, the ~/local/ copy of vim is gone, so use (g)vim in /usr/bin/
    set -g command "/bin/bash -c '/usr/bin/$vim_or_gvim $argv'"

    #switch (hostname)
    #    case stella.sr.unh.edu kona.sr.sr.unh.edu amnesiac.sr.unh.edu kenyan.sr.unh.edu kona.sr.unh.edu
    #        set -g command "/bin/bash -c '/usr/bin/$vim_or_gvim $argv'"
    #    case contact.sr.unh.edu lithium.sr.sr.unh.edu
    #        set -g command "/bin/bash -c 'export LD_LIBRARY_PATH=$HOME/local/stow/Python-2.5.2/lib/:$HOME/local/lib/; $HOME/local/bin/$vim_or_gvim $argv'"
    #    case zathras.sr.unh.edu skk.ath.cx
    #        set -g command "/bin/bash -c '/usr/bin/$vim_or_gvim $argv'"
    #    case '*'
    #        set -g command "/bin/bash -c '$HOME/local/bin/$vim_or_gvim $argv'"
    ##end


end
