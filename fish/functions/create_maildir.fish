function create_maildir -d "Create a Maildir directory"
    if test -d $MAILDIR
        if test (count $argv) = 1
	    mkdir -m 700 $MAILDIR/.$argv[1]/{,tmp,new,cur}
        end
    end
end
