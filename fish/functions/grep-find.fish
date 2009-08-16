function grep-find
    find . -path "*/CVS*" -prune -o -path "*/_darcs*" -prune -o -path "*/.svn*" -prune -o -name "*[~#]" -prune -o -not -name semantic.cache -type f -print0 | xargs -0 -e grep -i -n -e $argv
end
