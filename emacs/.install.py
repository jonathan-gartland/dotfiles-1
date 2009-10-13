#!/usr/bin/env python

# import createLinks
from install import createLinks

# create the links
createLinks([
	{'src': 'emacs', 'dst': '.emacs.d' },
	{'src': 'emacs/emacs.el', 'dst': '.emacs' },
	{'src': 'emacs/viper.el', 'dst': '.viper' },
	{'src': 'emacs/init/skk-wanderlust.el', 'dst': '.wl' },
	{'src': 'emacs/init/skk-wanderlust-folders.el', 'dst': '.folders' }
])
