#!/bin/bash

if [ $(/bin/uname) == "Linux" ]; then 

    export PYSQL=$HOME/src/pysql
    
    if [ $(/bin/hostname -s ) == "zathras" ]; then
	export PYTHONPATH=$PYSQL/src:$PYTHONPATH
    else
        echo "pysql may not work on $(/bin/hostname -s)"
        return 0
    fi

    # Start it
    /usr/bin/python $PYSQL/src/bin/pysql $*
fi
