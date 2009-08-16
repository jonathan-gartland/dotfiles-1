function text1r
    set options "--landscape --columns=1" 
    if test (count $argv) = 2
        _print_helper $options $argv[1] --output $argv[2]
    else
        _print_helper $options $argv[1]
    end
end
