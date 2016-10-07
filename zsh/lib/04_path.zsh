# typeset -U path

# prepends
path=(~/.local/bin "$path[@]")
# path=(~/.cabal/bin "$path[@]")

# appends

# prune paths that don't exist
# path=($^path(N))
