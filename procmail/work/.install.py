#!/usr/bin/env python

# import createLinks
from install import createLinks

# create the links
createLinks(
[
{'src': 'procmail/work', 'dst': '.procmail' },
{'src': 'procmail/work/procmailrc', 'dst': '.procmailrc' },
]
)
