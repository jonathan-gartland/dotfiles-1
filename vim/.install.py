#!/usr/bin/env python
#coding=utf-8

# import CreateLinks
from createlinks import CreateLinks

createLinks(
[
  { 'src': 'vim', 'dst': '.vim' },
  { 'src': 'vim/vimrc', 'dst': '.vimrc' }
], { 'dry_run' : True, 'verbose' : False } )
