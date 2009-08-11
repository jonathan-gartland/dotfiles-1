#!/usr/bin/env python

# import CreateLinks
from install import createLinks

# create the links
createLinks( 
[
{'src': 'fish', 'dst': '.fish', 'type': 'dir' }, 
{'src': 'fish', 'dst': '../config/fish', 'type': 'dir' }
], { 'dry_run' : True, 'verbose' : True }
)
