#!/usr/bin/env python
#coding=utf-8

import sys
import os.path
import os

debug = False

def _execute_command( command ):

    from subprocess import call

    try:
        print >>sys.stderr, "Command:\n%s" % command
        #retcode = 0
        retcode = call(command, shell=True)

        if retcode < 0:
            print >>sys.stderr, "Child was terminated by signal", -retcode

    except OSError, e:
            print >>sys.stderr, "Execution failed:", e


if __name__ == "__main__":

    directories = ['bin', 'conky', 'dotfiles', 'emacs', 'fish', 'terminfo', 'vim', 'zsh' ]

    for d in directories:
        command = "%s/.install.py"
        _execute_command( command )
