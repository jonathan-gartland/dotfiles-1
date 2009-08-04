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

    svn_command = "/usr/bin/hg"
    home_directory = os.environ[ 'HOME' ]
    svn_server = 'sftp://zathras.sr.unh.edu/~/dottree/'

    svn_directories = [
            { 'src': 'terminfo', 'dst': '.terminfo' },
            { 'src': 'dotfiles', 'dst': '.dotfiles' },
            { 'src': 'bin', 'dst': 'bin' },
            { 'src': 'fish', 'dst': '.fish' },
            { 'src': 'vim', 'dst': '.vim' },
            { 'src': 'zsh', 'dst': '.zsh' },
            { 'src': 'emacs', 'dst': '.emacs.d' }
        ]

    for d in svn_directories:
        source = os.path.join( svn_server, d[ 'src' ] )

        if debug:
            dest = "test/%s" % d[ 'dst' ]
        else:
            dest = os.path.join( home_directory, d[ 'dst' ]  )

        #print "source %s" % source
        #print "dest %s" % dest

        command = "%s clone %s %s" % ( svn_command, source, dest )
        _execute_command( command )

        path = os.path.join( os.getcwd(), dest )

        for root, dirs, files in os.walk( path ):
            for file in files:
                full_filename = os.path.join( root, file )
                if file == ".install.py" and os.path.exists( full_filename ):
                    #command = "%s %s" % ( full_filename, root )
                    command = "%s" % ( full_filename )
                    print ".install.py: Command %s" % command
                    #_execute_command( command )
