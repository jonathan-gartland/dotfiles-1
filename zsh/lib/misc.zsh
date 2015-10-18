# set default umask
umask 002

# load (optional) percol
function exists { which $1 &> /dev/null }

if exists percol; then
    function percol_select_history() {
        local tac
        exists gtac && tac="gtac" || { exists tac && tac="tac" || { tac="tail -r" } }
        BUFFER=$(fc -l -n 1 | eval $tac | percol --query "$LBUFFER")
        CURSOR=$#BUFFER         # move cursor
        zle -R -c               # refresh
    }

    zle -N percol_select_history
    bindkey '^R' percol_select_history
fi

# load fasd
[[ -s $(which fasd) ]] && eval "$(fasd --init auto)"

# load LS colors
[[ -s $HOME/dot-files-forest/LS_COLORS/LS_COLORS ]] && eval $(dircolors -b $HOME/dot-files-forest/LS_COLORS/LS_COLORS)
