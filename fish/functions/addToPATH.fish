function addToPATH -d "Add $argv[1] to PATH"

    set debug 0

    set -l path $argv[1]
    #/bin/echo "path $path"

    if not /usr/bin/test -d $path
        #echo "path ($path) does not exists as dir"
        return 2
    end

    if contains $path $PATH
        #echo "path ($path) is in PATH"
        return 3
    end

    if /usr/bin/test (count $argv) -eq 2;
        if test $argv[2] = "after"
            #/bin/echo "Appending $path to \$PATH"
            #/bin/echo "PATH $PATH"
            set PATH $PATH $path
            #/bin/echo "PATH $PATH"
        end
    else
        #/bin/echo "Prepending $path to \$PATH"
        #/bin/echo "PATH before $PATH"
        set PATH $path $PATH
        #/bin/echo "PATH after $PATH"
    end

    #/bin/echo "Adding $path to PATH: $PATH"
    #/bin/echo ""

    return 0
end
