#!/usr/bin/env python2

import os, re, sys

class CovertBashSetupFiles(object):
    def __init__( self, argv ):
        osshell = os.getenv('SHELL')
        # env
        if osshell.find("fish") >= 0:
            self.shell = "fish"
        elif osshell.find("tBash") >= 0:
            self.shell = "tBash"
        elif osshell.find("bash") >= 0:
            self.shell = "bash"
        elif osshell.find("zsh") >= 0:
            self.shell = "zsh"
        else:
            return None


        if self.shell == "zsh" or self.shell == "bash":
            self.env = lambda k, v: "export %s=\"%s\"" % (k, v)
            self.path = lambda v: "export PATH=\"\"%s\":$PATH\"" % v
        elif self.shell == "fish":
            self.env = lambda k, v: "set -x %s '%s'" % (k, v)
            self.path = lambda v: "set -xg PATH $PATH %s" % v
        else:
            self.env = lambda k, v: None
            self.path = lambda v: None

    def outputConvertedFile( self ):
        envPattern = re.compile( r'^(\?export)?\s*(.*)=(.*)$', re.IGNORECASE )
        #pathPattren = None

        for line in sys.stdin:
            env_parts = envPattern.search( line )
            #path_parts = pathPattren.search( line )

            if env_parts:
                key = env_parts.group(2)
                value = env_parts.group(3)
                print self.env(key,value)

            #if path_parts:
            #    value = path_parts.group(1).strip()
            #    print self.path(value)

if __name__ == "__main__":
    convert = CovertBashSetupFiles(sys.argv)
    convert.outputConvertedFile()