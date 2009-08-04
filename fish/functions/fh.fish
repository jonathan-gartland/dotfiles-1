function zh
    if test $argv[1] != ''
        set command "echo grep -i $argv[1] $HOME/.fish_history"
        _fish_run_command $command
    end
end
