#!/bin/bash

if [ $# != 2 ]; then 
    echo "$0: website-directory user:group"
    exit 1
fi

# Change owner
find $1 -exec chown $2 {} \;

# Change file persmission
find $1 -type f -exec chmod u+rw {} \;
find $1 -type f -exec chmod g+rw {} \;

# Change directory persmission
find $1 -type d -exec chmod u+rwx {} \;
find $1 -type d -exec chmod g+rwx {} \;
