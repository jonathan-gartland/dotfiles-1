#!/usr/bin/env python

# import CreateLinks
from install import createLinks

# create the links
<<<<<<< HEAD:fish/.install.py
createLinks( 
[
{'src': 'fish', 'dst': '.fish', 'type': 'dir' }, 
{'src': 'fish', 'dst': '../config/fish', 'type': 'dir' }
], { 'dry_run' : True, 'verbose' : True }
=======
cl = CreateLinks( argv )

# make the link
cl.createLinks(
    [
        { 'src': '', 'dst': '.fish' },
        { 'src': 'config.fish', 'dst': '.fishrc' }
        #{ 'src': 'lib/convert_csh_setup_file.py', 'dst': 'bin/convert_csh_setup_file.py' }
    ]
>>>>>>> 9fe10bfbebf264a70535c6214062c5f90b64042f:fish/.install.py
)
