#!/usr/bin/env python2
import shutil 
from os import getenv, makedirs, rename
import os
from os.path import exists, realpath, isfile, isdir, abspath, sep
from sys import argv
from datetime import datetime, date

DELETE_DIR = getenv( 'HOME' ) + "/delete"


def update_src_name( src, dst, index = 0 ):
    new_name = dst + sep + src + "_" + str( index )

    if exists ( new_name ):
        index += 1
        return update_src_name( src, dst, index )
    else:
        return src + "_" + str( index )

def move( src, dst ):

    if exists( dst ) == False:
	makedirs( dst )

    if isfile( src ):
        src2 = src
        if exists( dst + sep + src ):
            src2 = update_src_name( src, dst )

	if debug:
	    print "shutil.move( %s, %s )" % ( realpath( src ), dst + sep + src2 )
	    return None

	try:
	    shutil.move( realpath( src ), dst + sep + src2 )
	except IOError, (errno, strerror):
	    print "Unable to move %s, error: %s" % (src, strerror)


    if isdir( src ):
        src2 = src
        if exists( dst + sep + src ):
            src2 = update_src_name( src, dst )
            
	if debug:
	    print "shutil.move( %s, %s )" % ( realpath( src ), dst + sep + src2 )
	    return None

	try:
	    shutil.move( abspath( src ), dst + sep + src2 )
	except IOError, (errno, strerror):
	    print "Unable to move %s, error: %s" % (src, strerror)
	    


if __name__ == '__main__':

    debug = False

    dst = DELETE_DIR + sep + datetime.today().strftime( "%Y-%m-%d" )

    for src in argv[1:]:

	#statinfo = os.stat( src )
	#today = datetime.fromtimestamp( statinfo.st_mtime ).strftime("%Y-%m-%d")
	#dst = DELETE_DIR + sep + today


	move( src, dst )
