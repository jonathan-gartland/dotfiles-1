#!/usr/bin/env python

from os import environ, getcwd, remove, symlink
from os.path import exists, join

def _execute_command( command ):
    from subprocess import call
    from sys import stderr
    try:
        print >>stderr, "Command:\n%s" % command
        #retcode = 0
        retcode = call(command, shell=True)

        if retcode < 0:
            print >>stderr, "Child was terminated by signal", -retcode

    except OSError, e:
            print >>stderr, "Execution failed:", e

def createLinks( args, options = {} ):
    if options is None:
        options = { 'verbose': None, 'dry_run': None }
    else:
        if not options.has_key('verbose'):
            options['verbose'] = None
        if not options.has_key('dry_rune'):
            options['dry_run'] = None

    dst_directory = environ[ 'HOME' ]
    src_directory = getcwd()

    for arg in args:
        print ""
        if options[ 'verbose' ]:
            print "argument: %s" % arg

	src = join( src_directory, arg[ 'src' ] )
	dst = join( dst_directory, arg[ 'dst' ] )

        if exists( dst ):
            print "Removing Link: %s" % ( dst )
            if not options['dry_run']:
                try:
                    remove( dst )
                except OSError:
                    pass

        print "ln -sf %s %s" % ( src, dst )
        if not options['dry_run']:
            try:
                symlink( src, dst )
            except OSError:
                pass

if __name__ == "__main__":
    for dir in ['bin', 'conky', 'emacs', 'dotfiles', 'fish', 'vim']:

        #_execute_command( "git submodule init %s" % dir )
        #_execute_command( "git submodule update %s" % dir )

        file = "%s/.install.py" % dir
        if exists(file):
            execfile(file)
