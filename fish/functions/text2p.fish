function text2p
    set options "--portrait --columns=2" 
    if test (count $argv) = 2
        _print_helper $options $argv[1] --output $argv[2]
    else
        _print_helper $options $argv[1]
    end
end
