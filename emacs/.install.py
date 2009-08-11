#!/usr/bin/env python

# import createLinks
from install import createLinks

# create the links
<<<<<<< HEAD:emacs/.install.py
createLinks( 
[
{'src': 'emacs', 'dst': '.emacs.d', 'type': 'dir' }, 
{'src': 'emacs.el', 'dst': '.emacs', 'dir': 'emacs', 'type': 'file' }, 
{'src': 'viper.el', 'dst': '.viper', 'dir': 'emacs', 'type': 'file' } 
], { 'dry_run' : True, 'verbose' : True }
)
=======
cl = CreateLinks( argv )
cl.createLinks( [
{'src': '', 'dst': '.emacs.d' },
{'src': 'emacs.el', 'dst': '.emacs' },
{'src': 'viper.el', 'dst': '.viper' }
] )
>>>>>>> 9fe10bfbebf264a70535c6214062c5f90b64042f:emacs/.install.py
