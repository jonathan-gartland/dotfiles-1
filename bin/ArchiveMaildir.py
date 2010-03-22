#!/usr/bin/env python

from os import environ, mkdir
from shutil import rmtree, move
import datetime
import sys
from subprocess import call

rsync_options = "rltgoDvh"

def run_command( command ):
    try:
        retcode = call(command, shell=True)
        #print "Command: %s" % command; retcode = 0

        if retcode < 0:
            print >>sys.stderr, "Child was terminated by signal", -retcode
            return False
        else:
            return True

    except OSError, e:
            print >>sys.stderr, "Execution failed:", e
            return False

def rsync( options, src, dst ):
    command = '/usr/bin/rsync -%s %s %s' % ( options, src, dst )
    run_command( command )

if __name__ == '__main__':

    # Backup ~skk/Maildir/ to ~MailArchive
    rsync( rsync_options, '/home/skk/Maildir', '/home/MailArchive' )

    if datetime.date.today().day == 1:
        # Delete ~skk/Maildir
        #rmtree( '/home/rcc/skk/Maildir' )

        # move Maildir out of the way
        move( "/net/home/rcc/skk/Maildir", "/net/home/rcc/skk/MaildirOLD" )

        # Create ~skk/Maildir
        mkdir( "/net/home/rcc/skk/Maildir" )

        # Copy Maildir directory structure
        rsync( "dlptgo", '/home/MailArchive/Maildir', '/home/rcc/skk/Maildir' )

        # Copy .Sent/ back to ~skk/Maildir
        rsync( rsync_options, '/home/MailArchive/Maildir/.Sent', '/net/home/rcc/skk/Maildir' )

    run_command( "/usr/bin/find /home/MailArchive/Maildir -type d -exec chmod g+rx {} \;" );
    run_command( "/usr/bin/find /home/MailArchive/Maildir -type f -exec chmod g+r {} \;" );
    run_command( "/bin/chown -R MailArchive:MailArchive /home/MailArchive/Maildir" )
    run_command( "/bin/chown -R skk:users /home/skk/Maildir/" )
