
export OS_IS_MAC_OS_X=false
export OS_IS_LINUX=false
export OS_IS_WINDOWS=false

if [[ "$OSTYPE" == darwin* ]]; then
    export OS_IS_MAC_OS_X=true
fi

if [[ "$OSTYPE" == linux* ]]; then
    export OS_IS_LINUX=true
fi

function exists { which $1 &> /dev/null }

function source_if_exists() {
    filename=$1

    if [ -r "$filename" ]; then
        source $filename
    fi
}
