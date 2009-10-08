#!/usr/bin/env python

# import createLinks
from install import createLinks

# create the links
createLinks([
	{'src': 'emacs', 'dst': '.emacs.d' },
	{'src': 'emacs/emacs.el', 'dst': '.emacs' },
	{'src': 'emacs/viper.el', 'dst': '.viper' },
	{'src': 'emacs/wl.el', 'dst': '.wl' },
	{'src': 'emacs/wl-folders.el', 'dst': '.folders' }
])
