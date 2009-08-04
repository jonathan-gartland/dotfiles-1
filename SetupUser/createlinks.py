#!/usr/bin/env python

from optparse import OptionParser
from os import remove, symlink, environ, getcwd
from os.path import exists, join, basename

class CreateLinks( object ):

    def __init__( self, argv ):
        ( self.options, self.args, self.parser ) = self.optionHandlingAndParsing( argv )

    def optionHandlingAndParsing( self, argv ):

        usage = "usage: %prog [options] [SourceDirName]"
        version = "0.0.2"
        parser = OptionParser( usage = usage, version = version )
        parser.prog = basename(argv[0])

        parser.add_option("-n", "--dry-run",    dest="dry_run",     help="perform a trial run with no changes made", action="store_true" )

        parser.add_option("-v", "--verbose",    dest="verbose",     help="print extra information",         action="store_const", const=1 )

        ( options, args ) = parser.parse_args( args = argv )
        return ( options, args, parser )

    def createLinks( self, files ):

        dst_directory = environ[ 'HOME' ]

        if len( self.args ) == 2:
            src_directory = self.args[1]
        else:
            src_directory = getcwd()

        for file in files:
            print ""

            if self.options.verbose:
                print "file %s" % file

            src = join( src_directory, file[ 'src' ] )
            dst = join( dst_directory, file[ 'dst' ] )

            if exists( dst ):
                print "%s: Removing Link: %s" % ( self.args[0], dst )
                if not self.options.dry_run:
                    try:
                        remove( dst )
                    except OSError:
                        pass

            print "%s: Creating link: %s to %s" % ( self.args[0], src, dst )
            if not self.options.dry_run:
                try:
                    symlink( src, dst )
                except OSError:
                    pass

