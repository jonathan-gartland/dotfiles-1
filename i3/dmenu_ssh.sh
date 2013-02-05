#!/bin/bash
# simple dmenu_run for SSH connections

# http://infrared.yuuzukiyo.net/?p=200

DEFAULT_USER=`whoami`  # you may replace it with any user name you need
DEFAULT_PORT=22        # the port may be changed too

TERMINAL="terminator"
TERM=${TERMINAL:-xterm}

TERM="$TERM -e 'ssh %s %s@%s'"  # template for term emulator launcher
DMENU=`awk '{print $1}' ~/.ssh/known_hosts | awk -F',' '{print $1}' | \
       sed -e 's/\[\(.*\)\]/\1/' | dmenu -p 'ssh:'`

TITLE=$DMENU # run dmenu and get the hostname we need to connect to

# if there are more than 1 ':' characters, it is IPv6 address, and we don't need to extract port number from it
IS_IPV6=`echo $TITLE | awk -F':' '{print NF}'`
if (( "$IS_IPV6" <= "1" ))
then
    TARGET_HOST=`echo $TITLE | awk -F':' '{print $1}'`
    TARGET_PORT=`echo $TITLE | awk -F':' '{print $2}'`
    if [ -z "$TARGET_PORT" ]
    then
        TARGET_PORT=$DEFAULT_PORT
    fi  
else
    TARGET_HOST=$TITLE
fi

declare RUN
# default run string
RUN=$(printf "$TERM" "$DEFAULT_USER@$TITLE" "$TARGET_PORT" "$DEFAULT_USER" "$TARGET_HOST")

# the file with users database
FILE=~/.ssh/users

CONTENT=(`cat "$FILE"`)
COUNT=${#CONTENT[@]}

I=0 # cycle counter
while [ "$I" -lt "$COUNT" ]
do
    GIVEN_HOST=${CONTENT[$I]}
    GIVEN_USER=${CONTENT[$I+1]}
    if [ $GIVEN_HOST == $TITLE ]; then
        # if there is the hostname in users database, we need to use it as login
        RUN=$(printf "$TERM" "$GIVEN_USER@$TITLE" "$TARGET_PORT" "$GIVEN_USER" "$TARGET_HOST")
    fi  
    let "I = $I +1"
done

echo "RUN $RUN"

# spawn new terminal with SSH session
$RUN &

