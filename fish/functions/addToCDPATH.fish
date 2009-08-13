function addToCDPATH -d "Add $argv[1] to CDPATH"
    if test -d $argv[1]
	set -xg CDPATH $CDPATH $argv[1]
    end
end
