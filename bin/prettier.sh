#!/bin/sh

OPTIONS="--print-width 90 --tab-width 2 --trailing-comma all --jsx-bracket-same-line"
/usr/local/bin/prettier --write ${OPTIONS} $*
