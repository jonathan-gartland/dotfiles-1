function addToPATH -d "Add $argv[1] to PATH"

    set -l path $argv[1]
    #echo "path $path"

    if not test -d $path
        return 2
    end

    if contains $path $PATH
        return 3
    end

    if test (count $argv) -eq 2;
        if test $argv[2] = "after"
            #echo "Appending $path to \$PATH"
            #echo "PATH $PATH"
            set PATH $PATH $path
            #echo "PATH $PATH"
        end
    else
        #echo "Appending $path to \$PATH"
        #echo "PATH $PATH"
        set PATH $PATH $path
        #echo "PATH $PATH"
    end

    #echo "Adding $path to PATH: $PATH"
    #echo "\n"

    return 0
end
