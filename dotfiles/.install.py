#!/usr/bin/env python
#coding=utf-8

# import CreateLinks
from install import createLinks

# create the links
createLinks(
[
    {'src': 'dotfiles', 'dst': '.dotfiles' },
    { 'src': 'dotfiles/astylerc', 'dst': '.astylerc',  },
    { 'src': 'dotfiles/screenrc', 'dst': '.screenrc',  },
    { 'src': 'dotfiles/logrotate.conf', 'dst': '.logrotate.conf',  },
    { 'src': 'dotfiles/muttrc', 'dst': '.muttrc',  },
    { 'src': 'dotfiles/sqliterc', 'dst': '.sqliterc',  },
    { 'src': 'dotfiles/xbindkeys', 'dst': '.xbindkeysrc',  }
], { 'dry_run' : True, 'verbose' : False } )
