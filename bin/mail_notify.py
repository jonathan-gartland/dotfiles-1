#!/usr/bin/env python

import sys, re
import logging
from subprocess import call

# logging setup
import logging
LOG_FILENAME="/tmp/MailNotify.log"
logging.basicConfig(filename=LOG_FILENAME, level=logging.DEBUG, format='%(asctime)s %(levelname)-8s %(name)-12s %(filename)s:%(lineno)d %(message)s')
logger = logging.getLogger(__name__)
# end logging setup

def run_command( command ):
    try:
        retcode = call(command, shell=True)
        logger.debug("command: " + command)
        if retcode < 0:
            print >>sys.stderr, "Child was terminated by signal", -retcode
            return False
        else:
            return True

    except OSError, e:
            print >>sys.stderr, "Execution failed:", e
            return False

def get_headers(headers, data):
    print headers
    d = dict()
    regex = re.compile("^([-_a-zA-Z]*):(.*)$")
    for line in data:
        mo = regex.search(line)
        if mo:
            k,v = mo.groups()

            if k in headers:
                d[k] = v.strip()
    return d

if __name__ == '__main__':
    msg = sys.stdin.readlines()
    hostname = sys.argv[1]
    headers = get_headers( ['Subject', 'From'], msg)
    cmd = "ssh %s \"/usr/bin/notify-send -u normal '%s %s'\"" % (hostname, headers['From'], headers['Subject'])
    run_command(cmd)
