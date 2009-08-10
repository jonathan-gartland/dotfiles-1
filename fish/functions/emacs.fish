function emacs -d "Start emacs[client]"
    emacsclient --no-wait --alternate-editor=(which emacs) $argv 
    #if test $status > 0
    #    ($location_emacs --daemon $argv)
    #end
end
