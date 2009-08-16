function setup_oracle_env

    set convertedOracleSetupFile 0

    if test -f /usr/local/setup/oracle
	   set -l tmpFile /tmp/setup.oracle.$USER
	   set -l oracleFile /usr/local/setup/oracle
	   convert_csh_fish $tmpFile $oracleFile
        set convertedOracleSetupFile 1
    end

    if test -f /usr/local/oracle/setup
        set -l tmpFile /tmp/setup.oracle.$USER
        set -l oracleFile /usr/local/oracle/setup
        convert_csh_fish $tmpFile $oracleFile
        set convertedOracleSetupFile 1
    end

    #if test $convertedOracleSetupFile -eq 1
    #    # Now ensure that EDITOR/VISUAL get reset to what *I* want.
    #    return 1
    #end
    #return 0
end
