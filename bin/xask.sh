#!/bin/bash

konsole="/usr/bin/env konsole"
$konsole
exit 0

case ${1:-UnseT} in
    UnseT) 
	$konsole -e "$0" "Ask" &
	;;
    Ask)
	echo -n "ssh to what system? "
	read h
	if [ ${h:-''} = '' ]; then
            h="localhost"
	fi
	$HOME/bin/xrename $h
	/usr/bin/ssh -Y $h $2 $3
	;;
    *)
	echo $konsole -e "/usr/bin/ssh" "-Y $1 $2 $3" &
	;;
esac
