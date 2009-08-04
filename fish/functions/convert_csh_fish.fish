function convert_csh_fish
    # get file, dir
    set tmpFile $argv[1]
    set oracleFile $argv[2]

    # set cmd
    set command "$HOME/bin/convert_csh_setup_file.py"

    # run command
    eval $command -t "fish" -s $oracleFile -d $tmpFile

    # source convert oracle statement
    . $tmpFile

    # dump file
    #cat $tmpFile

    # remove tmp file
    rm -f $tmpFile
end
