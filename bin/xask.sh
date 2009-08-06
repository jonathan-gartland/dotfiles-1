#!/bin/sh

konsole="/usr/bin/env konsole"

case ${1:-UnseT} in
    UnseT) 
	$konsole -e "/net/home/rcc/skk/bin/xask.sh" "Ask" &
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
	$terminal -e "/usr/bin/ssh" "-Y $1 $2 $3" &
	;;
esac
