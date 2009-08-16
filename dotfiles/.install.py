#!/usr/bin/env python
#coding=utf-8

# import CreateLinks
from install import createLinks

# create the links
createLinks(
[
    {'src': 'dotfiles', 'dst': '.dotfiles' },
    { 'src': 'dotfiles/astylerc', 'dst': '.astylerc' },
    { 'src': 'dotfiles/screenrc', 'dst': '.screenrc' },
    { 'src': 'dotfiles/logrotate.conf', 'dst': '.logrotate.conf' },
    { 'src': 'dotfiles/muttrc', 'dst': '.muttrc' },
    { 'src': 'dotfiles/sqliterc', 'dst': '.sqliterc'  },
    { 'src': 'dotfiles/xbindkeysrc', 'dst': '.xbindkeysrc'  },
    {'src' : 'dotfiles', 'dst' : '.zsh' },
    { 'src': 'dotfiles/zshrc', 'dst': '.zshrc' },
    { 'src': 'dotfiles/zshenv', 'dst': '.zshenv'},
    { 'src': 'dotfiles/zsh_prompt_termwide', 'dst': '.zsh_prompt_termwide'}
], { 'dry_run' : True, 'verbose' : False } )
