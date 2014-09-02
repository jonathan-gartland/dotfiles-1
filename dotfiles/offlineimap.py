#!/usr/bin/python

import re, os

# Format of ~/.msmtp.authinfo.X.gpg file
# host: $HOST username: $USER password: $PASSWORD port: $PORT

def get_authinfo_password(machine, login, port, type):
    cmd = "gpg --no-tty --batch -d -q ~/.msmtp.authinfo.%s.gpg 2> /dev/null" % type
    authinfo = os.popen(cmd).read()
    return re.search("host: %s username: %s password: ([^ ]*) port: %s" % (machine, login, port), authinfo).group(1)

if __name__ == '__main__':
    print("password:", get_authinfo_password("knight.cx", "steven", "25", "home"))
