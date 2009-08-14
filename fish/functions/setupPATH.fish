function setupPATH -d "Define PATH"
    #/bin/echo "PATH: $PATH"

    # add bin dirs
    addToPATH /usr/local/bin
    addToPATH /usr/bin
    addToPATH /bin

    # add user's dirs
    addToPATH "$JAVA_HOME/bin"
    addToPATH "$HOME/local/bin"
    addToPATH "$HOME/bin"

    # add sbin dirs
    if test (id -u) = "0"
	addToPATH /sbin 
	addToPATH /usr/sbin 
	addToPATH /usr/local/sbin
    else
	addToPATH /usr/local/sbin after
	addToPATH /usr/sbin after
	addToPATH /sbin after
    end
    #/bin/echo "PATH: $PATH"
end
