#!/usr/bin/env python

import sys, zipfile

def zipFileContent( filename ):
        z = zipfile.ZipFile(file(filename))
        print "%s:" % (filename)
        for f in z.namelist():
            if f.endswith( "jar" ) or f.endswith( "war" ):
                try:
                    zipFileContent( f )
                except:
                    continue
            else:
                print "\t%s" % (f)
        print ""

for filename in sys.argv[1:]:
    zipFileContent( filename )
