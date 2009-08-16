function updateSourceDir

    # default to pwd
    set source_dir $PWD

    # we've been passed an argv, use it
    #if test $argv[1] != ''
#	set source_dir $argv[1]
#    end

    # set SOURCE_DIR
    set -x SOURCE_DIR $source_dir
end
