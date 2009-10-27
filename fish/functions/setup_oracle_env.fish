function setup_oracle_env
    if test -f /usr/local/setup/oracle
        ~/bin/convert_csh_setup_file.py < /usr/local/setup/oracle | .
     end

    if test -f /usr/local/oracle/setup
        ~/bin/convert_csh_setup_file.py < /usr/local/oracle/setup | .
    end
end
