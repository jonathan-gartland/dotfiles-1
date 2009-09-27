#!/usr/bin/env python

# import createLinks
from install import createLinks

# create the links
createLinks(
[
{'src': 'procmail/home', 'dst': '.procmail' },
{'src': 'procmail/home/procmailrc', 'dst': '.procmailrc' },
]
)
