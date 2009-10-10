#!/usr/bin/env python

import sys, os, os.path

def _execute_command( command ):
	from subprocess import call
	from sys import stderr
	try:
		retcode = call(command, shell=True)

		if retcode < 0:
			print >>stderr, "Child was terminated by signal", -retcode

	except OSError, e:
			print >>stderr, "Execution failed:", e

def createLinks( args, options = {} ):
	if len(options.keys()) == 0:
		options = { 'verbose': False, 'dry_run': False }
	else:
		if not options.has_key('verbose'):
			options['verbose'] = None
		if not options.has_key('dry_rune'):
			options['dry_run'] = None

	dst_directory = os.environ[ 'HOME' ]
	src_directory = os.getcwd()

	for arg in args:
            if options[ 'verbose' ]:
                print "argument: %s" % arg
            src = os.path.join( src_directory, arg[ 'src' ] )
            dst = os.path.join( dst_directory, arg[ 'dst' ] )

            if options['verbose']:
                print "src: %s, dst: %s" % (src,dst)

            if options['verbose']:
                    print "ln -sf %s %s" % ( src, dst )

            if os.path.exists( dst ):
                    if options['verbose']:
                            print "Removing Exsting Link: %s" % ( dst )

                    if not options['dry_run']:
                            try:
                                    os.remove( dst )
                            except OSError:
                                    pass

                    if options['verbose']:
                            print "Recreating Link: %s" % (dst)

                    try:
                            os.symlink( src, dst )
                    except OSError:
                            pass
            else:
                    print "Creating Link: %s" % (dst)
                    try:
                            os.symlink( src, dst )
                    except OSError:
                            pass
if __name__ == "__main__":

	if len(sys.argv) != 2:
		print "%s: work|home|other" % __file__
                sys.exit(1)

	for dir in ['bin','conky','emacs','dotfiles','fish','vim']:
		file = "%s/.install.py" % dir
		if os.path.exists(file):
			execfile(file)

	location = sys.argv[1]
        if location.upper() == "WORK":
		file = "procmail/work/.install.py"
        elif location.upper() == "HOME":
		file = "procmail/home/.install.py"
	else:
		file = None

	if file != None and os.path.exists(file):
		execfile(file)
