function setupPATH -d "Define PATH"
    #echo "PATH: $PATH"
    # add user's dirs
    addToPATH $HOME/bin
    addToPATH $HOME/local/bin
    addToPATH $JAVA_HOME/bin

    # add bin dirs
    #addToPATH /usr/local/bin
    #addToPATH /usr/bin
    #addToPATH /bin

    # add sbin dirs
    #if test (id -u) = "0"
#	addToPATH /sbin 
#	addToPATH /usr/sbin 
#	addToPATH /usr/local/sbin
#    else
#	addToPATH /usr/local/sbin after
#	addToPATH /usr/sbin after
#	addToPATH /sbin after
#    end
    #echo "PATH: $PATH"
end
