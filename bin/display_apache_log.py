#!/usr/bin/env python

from glob import glob
from os import environ
from sys import exit, argv
from os.path import join, pathsep

import os, sys

def findfile(file_to_find, paths):
    import os.path
    """
    Find the file named path in the paths.
    Returns the full path name if found, None if not found
    """
    for dirname in paths:
        possible = os.path.join(dirname, file_to_find)
        if os.path.isfile(possible):
            return possible
    return None

def _execute_command( command ):
    from subprocess import call
    try:
        #print >>sys.stderr, "Command:\n%s" % command
        #retcode = 0
        retcode = call(command, shell=True)

        if retcode < 0:
            print >>sys.stderr, "Child was terminated by signal", -retcode

    except OSError, e:
            print >>sys.stderr, "Execution failed:", e



def apache_log_helper( web_dir_base, web_dir, filename, command ):
    path = join( web_dir_base, web_dir )
    fn = join( path, '*', filename )
    logfile = glob( fn )
    if len(logfile) == 1:
        _execute_command( command + " " + logfile[0] )


paths = environ[ 'PATH' ].split( pathsep )
web_paths = ( "/webdev", "/web", "/home/web", "/web1", "/web2", "/web3", "/web4", "/web5", "/home" )

if __name__ == "__main__" and len(argv) == 2:

    if __file__.find("accesslog") != -1:
        cmd = findfile( "tail", paths ) + " -f"
        print "cmd %s" % cmd
        if cmd == None:
            print "Command Not Found: %s" % cmd
            exit(1)

        for web_path in web_paths:
            apache_log_helper( web_path, argv[1], "access*log", cmd )

    if __file__.find("errorlog") != -1:
        cmd = findfile( "tail", paths ) + " -f"
        if cmd == None:
            print "Command Not Found: %s" % cmd
            exit(1)

        for web_path in web_paths:
            apache_log_helper( web_path, argv[1], "error*log", cmd )
