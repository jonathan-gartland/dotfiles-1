
export OS_IS_MAC_OS_X=false
export OS_IS_LINUX=false
export OS_IS_WINDOWS=false
export OS_IS_POSIX=false

if [[ "$OSTYPE" == darwin* ]]; then
    export OS_IS_MAC_OS_X=true
    export OS_IS_POSIX=true
fi

if [[ "$OSTYPE" == linux* ]]; then
    export OS_IS_LINUX=true
    export OS_IS_POSIX=true
fi

function exists {
    which $1 &> /dev/null
}

function source_if_exists {
    filename=$1

    if [[ -r "$filename" ]]; then
        # echo "source filename $filename"
        source $filename
    else
        # echo "source failed for filename $filename"
    fi
}
