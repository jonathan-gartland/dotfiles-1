function stowdir_local
    set stowdir /usr/local/stow/(basename $PWD)
    echo $stowdir
end
