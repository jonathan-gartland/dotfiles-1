#!/usr/bin/env python
#coding=utf-8

# import CreateLinks
from install import createLinks

# create the links
createLinks(
[
    {'src': 'dotfiles', 'dst': '.dotfiles', 'type': 'dir' }, 
    { 'src': 'astylerc', 'dst': '.astylerc', 'dir': '../', 'type': 'file' },
    { 'src': 'screenrc', 'dst': '.screenrc', 'dir': '../', 'type': 'file' },
    { 'src': 'logrotate.conf', 'dst': '.logrotate.conf', 'dir': '../', 'type': 'file' },
    { 'src': 'muttrc', 'dst': '.muttrc', 'dir': '../', 'type': 'file' },
    { 'src': 'sqliterc', 'dst': '.sqliterc', 'dir': '../', 'type': 'file' },
    { 'src': 'xbindkeys', 'dst': '.xbindkeysrc', 'dir': '../', 'type': 'file' }
], { 'dry_run' : False, 'verbose' : True } )
