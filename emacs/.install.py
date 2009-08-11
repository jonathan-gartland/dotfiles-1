#!/usr/bin/env python

# import createLinks
from install import createLinks

# create the links
createLinks(
[
{'src': 'emacs/emacs', 'dst': '.emacs.d' },
{'src': 'emacs/emacs.el', 'dst': '.emacs' },
{'src': 'emacs/viper.el', 'dst': '.viper' }
], { 'dry_run' : True, 'verbose' : False }
)
