#!/usr/bin/env python
#coding=utf-8

# import CreateLinks
from install import createLinks

# create the links
createLinks(
[
    {'src': 'dotfiles', 'dst': '.dotfiles', 'type': 'dir' }, 
    { 'src': 'astylerc', 'dst': '.astylerc', 'dir': '.dotfiles', 'type': 'file' },
    { 'src': 'screenrc', 'dst': '.screenrc', 'dir': '.dotfiles', 'type': 'file' },
    { 'src': 'logrotate.conf', 'dst': '.logrotate.conf', 'dir': '.dotfiles', 'type': 'file' },
    { 'src': 'muttrc', 'dst': '.muttrc', 'dir': '.dotfiles', 'type': 'file' },
    { 'src': 'sqliterc', 'dst': '.sqliterc', 'dir': '.dotfiles', 'type': 'file' },
    { 'src': 'xbindkeys', 'dst': '.xbindkeysrc', 'dir': '.dotfiles', 'type': 'file' }
], { 'dry_run' : True, 'verbose' : True } )
