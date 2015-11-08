# set default umask
umask 002

# load (optional) percol
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


if exists fuck; then
    eval $(thefuck --alias)
fi

if exists fasd; then
    eval $(fasd --init auto)
fi


if [[ "$OS_IS_LINUX" = true ]]; then
    alias gdircolors=dircolors
fi

[[ -s $HOME/src/forest/LS_COLORS/LS_COLORS ]] && eval $(gdircolors -b $HOME/src/LS_COLORS/LS_COLORS)
