#!/usr/bin/env python
#coding=utf-8

from sys import argv,path
from subprocess import call
from os import chdir
from os.path import abspath, dirname

# change to the directory our script is running in
chdir( dirname( abspath( argv[0] ) ) )

# add directory .SetupUser/ to python's path
path.append( '../SetupUser' )

# import CreateLinks
from createlinks import CreateLinks

# create the links
cl = CreateLinks( argv )

# make the link
cl.createLinks(
    [
        { 'src': '', 'dst': '.fish' },
        { 'src': 'config.fish', 'dst': '.fishrc' },
        { 'src': 'lib/convert_csh_setup_file.py', 'dst': 'bin/convert_csh_setup_file.py' }
    ]
)
