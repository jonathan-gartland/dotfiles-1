function emacs -d "Start emacsclient or emacs"

# look through process
#ps u $USERNAME  |grep "emacs --daemon"
# see if one exists
#if $status 
    
    emacsclient --create-frame --no-wait --alternate-editor=(which emacs) $argv 
end
