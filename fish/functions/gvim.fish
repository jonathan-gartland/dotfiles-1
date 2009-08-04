function gvim -d "Choose gvim binary based on host"
    # Get vim based on which host we are on
    _fish_vim_selector "gvim" $argv
    # Run the vim command in variable $command ( this was set in _fish_vim_selector )
    _fish_run_command $command
    # Earse variable command
    set -e command 
end
