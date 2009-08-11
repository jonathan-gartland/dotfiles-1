#!/usr/bin/env python
#coding=utf-8

# import CreateLinks
from createlinks import CreateLinks

# create the links
createLinks(
[
{'src' : 'zsh', 'dst' : '.zsh', 'type': 'dir' },
{ 'src': 'zshrc', 'dst': '.zshrc', 'dir': '../', 'type' : 'file'  },
{ 'src': 'zshenv', 'dst': '.zshenv', 'dir': '../', 'type' : 'file' },
{ 'src': 'zsh_prompt_termwide', 'dst': '.zsh_prompt_termwide','dir': '../',  'type' : 'file' }
], { 'dry_run' : False, 'verbose' : True }
)
