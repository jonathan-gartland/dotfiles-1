function emacs -d "Start emacsclient or emacs"
     emacsclient --create-frame --no-wait --alternate-editor=emacs $argv 	
end
