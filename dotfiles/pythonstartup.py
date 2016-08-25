# coding: utf-8

# from https://www.reddit.com/comments/3ej9u2

from __future__ import unicode_literals, print_function, absolute_import

# import all the stuff I use all the time
import sys
import os
import re
import json
import csv
import random
import hashlib
import tempfile
import shelve
import subprocess
import atexit
from glob import glob
from uuid import uuid4
from pprint import pprint
from codecs import open

from itertools import *
from collections import *
from datetime import datetime, timedelta

# best lib to handle date times
try:
    import arrow
except ImportError:
    pass

# best lib to handle HTTP
try:
    import requests
except ImportError:
    pass

# best lib to handle path
try:
    from path import path
except ImportError:
    pass

# missing tools from python
# dict merging, recursive getmember, etc
try:
    from minibelt import *
except ImportError:
    pass

# activate autocomplete on python 2.7 shell
try:
    import rlcompleter
    import readline

    readline.parse_and_bind("tab: complete")
except ImportError:
    pass

# if in virtualenv
env = os.environ.get('VIRTUAL_ENV')
if env:

    # display the env name in the ipython shell promp
    env_name = os.path.basename(env)
    sys.ps1 = '(%s) %s ' % (env_name, getattr(sys, 'ps1', '>>>'))

    # display all modules installed in the virtualenv at the shell
    # start
    print("\nVirtualenv '{}' contains:\n".format(env_name))
    cmd = subprocess.check_output([env + "/bin/pip", "freeze"],
                                  stderr=subprocess.STDOUT)
    try:
        cmd = cmd.decode('utf8')
    except:
        pass

    cmd = cmd.strip().split("\n")
    p = re.compile(r'(^.*\:\s)|((#|@).*$)|(==.*$)')
    print("'" + "', '".join(sorted(set(os.path.basename(p.sub('', f)) for f in cmd))) + "'\n")

# print fast
p = print
pp = pprint

# make sure you always have  a temp dir available
TEMP_DIR = os.path.join(tempfile.gettempdir(), 'pythontemp')
try:
    os.makedirs(TEMP_DIR)
    TEMP_DIR = path(TEMP_DIR) # make it a Path object
except Exception as e:
    pass

# persistent key/value store
class Store(object):
    def __init__(self, filename):

        object.__setattr__(self, 'DICT', shelve.DbfilenameShelf(filename))

        atexit.register(self._clean)

    def __getattribute__(self, name):
        if name not in ("DICT", '_clean'):
            try:
                return self.DICT[name]
            except:
                return None
        return object.__getattribute__(self, name)

    def __setattr__(self, name, value):
        if name in ("DICT", '_clean'):
            raise ValueError("'%s' is a reserved name for this store" % name)
        self.DICT[name] = value

    def _clean(self):
        self.DICT.sync()
        self.DICT.close()

# Now you can do store.foo = 'bar' and get back store.foo in the next
# session.
python_version = "py%s" % sys.version_info.major
try:
    store = Store(os.path.join(TEMP_DIR, 'store.%s.db') % python_version)
except:
    print('\n/!\ A session using this store already exists.')

print("All set!")
