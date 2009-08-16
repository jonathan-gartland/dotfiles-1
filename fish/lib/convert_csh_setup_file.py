#!/usr/bin/env python

import re
import sys
import string

from optparse import OptionParser
from os import environ

class OptionHandling( object ):

    def __init__( self, argv ):
        self.argv = argv

    def getOptions( self ):
        parser = OptionParser()
        parser.add_option("-t", "--shell_type", dest="shell_type", help="Shell Type", action="store" )
        parser.add_option("-s", "--source_filename", dest="source_filename", help="Source shell config file", action="store" )
        parser.add_option("-d", "--dest_filename", dest="dest_filename", help="Destination shell config file", action="store" )

        (options, args) = parser.parse_args( args = self.argv )

        if len( self.argv ) < 1:
            parser.print_help()
            exit( 1 )

        return ( options, parser )

    def optionHandlingAndParsing( self ):
        # get options
        ( options, parser ) = self.getOptions()

        if options.shell_type and options.source_filename and options.dest_filename:
            return ( options.shell_type, options.source_filename, options.dest_filename )
        else:
            parser.print_help()
            exit( 1 )


class BaseShellWriter(object):
    def __init__(self, outputFile = None):
        self.outputFile = outputFile

    def envValue(self, key, value):
        pass

    def pathValue(self, path):
        pass

class FishWriter(BaseShellWriter):
    def __init__(self, outputFile):
        super(FishWriter, self).__init__(outputFile)

    def envValue(self, key, value):
        self.outputFile.write(  "set -xg %s %s\n" % ( key, value ) )

    def pathValue(self, path):
        self.outputFile.write( "set -xg PATH $PATH %s\n" % path )

class ZshWriter(BaseShellWriter):
    def __init__(self, outputFile):
        super(ZshWriter, self).__init__(outputFile)

    def envValue(self, key, value):
        self.outputFile.write( "export %s=%s\n" % ( key, value ) )

    def pathValue(self, path):
	self.outputFile.write( "export PATH=%s\n" % path )


class CovertCSHSetupFiles(object):
    def __init__( self, argv ):
        self.options = OptionHandling(argv)
        ( self.shell_type, self.source_filename, self.dest_filename ) = self.options.optionHandlingAndParsing()
	self.outputFile = file(self.dest_filename, "w+")
	self.inputFile = file(self.source_filename, "r")

        self.shellWriter = BaseShellWriter()

        if self.shell_type == "zsh":
            self.shellWriter = ZshWriter(self.outputFile)
        elif self.shell_type == "fish":
            self.shellWriter = FishWriter(self.outputFile)
        else:
            print "Unknown ShellType %s" % self.shell_type
            exit(1)


    def outputConvertedFile( self ):
	envPattern = re.compile( r'setenv\s*([-$_a-z0-9]*)\s*(.*)', re.IGNORECASE )
	pathPattren = re.compile( r'set path = \((\$.*)\$.*\)', re.IGNORECASE )

	self.env = {}
	self.path = []

	for line in self.inputFile.readlines():
            env_parts = envPattern.search( line )
            path_parts = pathPattren.search( line )

            if env_parts:
                key = env_parts.group(1)
                value = env_parts.group(2)
                self.shellWriter.envValue(key, value)

            if path_parts:
                path = path_parts.group(1)
                self.shellWriter.pathValue(path)

if __name__ == "__main__":
    convert = CovertCSHSetupFiles(sys.argv)
    convert.outputConvertedFile()
