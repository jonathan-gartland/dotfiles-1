function addToPATH -d "Add $argv[1] to PATH"

    set -l path $argv[1]
    #/bin/echo "path $path"

    if not /usr/bin/test -d $path
        return 2
    end

    if contains $path $PATH
        return 3
    end

    if /usr/bin/test (count $argv) -eq 2;
        if test $argv[2] = "after"
            #/bin/echo "Appending $path to \$PATH"
            #/bin/echo "PATH $PATH"
            set -gx PATH "$PATH $path"
            #/bin/echo "PATH $PATH"
        end
    else
        #/bin/echo "Appending $path to \$PATH"
        #/bin/echo "PATH $PATH"
        set -gx PATH "$path $PATH"
        #/bin/echo "PATH $PATH"
    end

    #/bin/echo "Adding $path to PATH: $PATH"
    #/bin/echo "\n"

    return 0
end
