function fish_title
    echo "$USER: "
    if test $_ = fish
	pwd
    else
	echo $history[1]
    end
end
