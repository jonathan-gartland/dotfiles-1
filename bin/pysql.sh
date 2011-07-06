#!/bin/bash

if [ $(/bin/uname) == "Linux" ]; then 

    export PYSQL=$HOME/src/pysql-0.15
    export PYTHONPATH=$PYSQL/src:$PYTHONPATH

    # Start it
    /usr/bin/python $PYSQL/src/bin/pysql $*
fi
