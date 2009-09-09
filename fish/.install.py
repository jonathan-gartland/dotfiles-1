#!/usr/bin/env python

# import CreateLinks
from install import createLinks

# create the links
createLinks(
[
{'src': 'fish', 'dst': '.fish' },
{'src': 'fish/config.fish', 'dst' : '.fishrc' },

{'src': 'fish/config.fish', 'dst': '.config/fish/config.fish' },
{'src': 'fish/functions', 'dst': '.config/fish/functions' },
],
{ 'dry_run' : False, 'verbose' : False }
)
