#!/usr/bin/env python

# import createLinks
from install import createLinks

# create the links
createLinks( 
[
{'src': 'emacs', 'dst': '.emacs.d', 'type': 'dir' }, 
{'src': 'emacs.el', 'dst': '.emacs', 'dir': 'emacs', 'type': 'file' }, 
{'src': 'viper.el', 'dst': '.viper', 'dir': 'emacs', 'type': 'file' } 
], { 'dry_run' : False, 'verbose' : True }
)
