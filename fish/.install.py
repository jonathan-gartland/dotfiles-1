#!/usr/bin/env python

# import CreateLinks
from install import createLinks

# create the links
createLinks(
[
{'src': 'fish', 'dst': '.fish' },
{'src': 'fish', 'dst': '.config/fish' },
#{'src': 'function', 'dst': '.config/function' }
],
{ 'dry_run' : True, 'verbose' : False }
)
