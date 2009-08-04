function _fish_run_command -d "Local fish function to run a command"

    if test (count $argv) = 1
        set command $argv[1]
        echo "Command: $command"
        eval $command
    end
end
