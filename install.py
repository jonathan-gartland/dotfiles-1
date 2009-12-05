#!/usr/bin/env python

import sys
import os.path
# append .lib/ to sys.path to allow us to import the "real" installer
sys.path.insert(0, os.path.dirname(os.path.realpath(__file__)) + os.path.sep + ".lib")

# import .lib install and call run method
import install
sys.exit(install.run(sys.argv))
