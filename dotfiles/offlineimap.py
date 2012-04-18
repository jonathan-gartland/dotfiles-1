#!/usr/bin/python

import re, os

def get_authinfo_password(machine, login, port,type):
    s = "machine %s login %s password ([^ ]*) port %s" % (machine, login, port)
    p = re.compile(s)
    authinfo = os.popen("gpg -q -d ~/.authinfo.%s" % type).read()
    return p.search(authinfo).group(1)
