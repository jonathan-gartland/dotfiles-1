#!/usr/bin/env python
#coding=utf-8

# import CreateLinks
from install import createLinks

# create the links
createLinks(
[
{'src' : 'zsh', 'dst' : '.zsh' },
{ 'src': 'zsh/zshrc', 'dst': '.zshrc' },
{ 'src': 'zsh/zshenv', 'dst': '.zshenv'},
{ 'src': 'zsh/zsh_prompt_termwide', 'dst': '.zsh_prompt_termwide'}
], { 'dry_run' : True, 'verbose' : False }
)
