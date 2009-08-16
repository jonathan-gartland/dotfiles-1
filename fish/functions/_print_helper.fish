function _print_helper
    #set options "--highlight --tabsize=4 --color --pretty-print --columns=2 --portrait --borders --style=a2ps"
    #set command "/usr/bin/env enscript $options $argv[1]" 

    set options "--tabsize=4 --highlight-level=heavy --line-numbers=5"
    set command "/usr/bin/env a2ps $options $argv" 

    _fish_run_command $command
end
