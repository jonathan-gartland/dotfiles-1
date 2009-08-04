#!/usr/bin/env python
#coding=utf-8

from sys import argv,path
from subprocess import call
from os import chdir
from os.path import abspath, dirname

# change to the directory our script is running in
chdir( dirname( abspath( argv[0] ) ) )

# checkout /svn/skk/SetupUser
try:
    retcode = call( "/usr/bin/env svn checkout https://svn.sr.unh.edu/svn/skk/SetupUser .SetupUser", shell=True)
    if retcode < 0:
        print "Child was terminated by signal", -retcode

except OSError, e:
        print "Execution failed:", e

# add directory .SetupUser/ to python's path
path.append( '.SetupUser' )

# import CreateLinks
from createlinks import CreateLinks

# create the links
cl = CreateLinks( argv )
cl.createLinks( [ { 'src': 'vimrc', 'dst': '.vimrc' } ] )
