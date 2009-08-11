#!/usr/bin/env python

# import CreateLinks
from install import createLinks

# create the links
createLinks( 
[
{'src': 'fish', 'dst': '.fish', 'type': 'dir' }, 
{'src': 'fish', 'dst': '../config/fish', 'type': 'dir' },
{'src': 'function', 'dst': '../config/function', 'type': 'dir' }
], 
{ 'dry_run' : False, 'verbose' : True }
)
