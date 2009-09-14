#!/usr/bin/env python
#coding=utf-8

# import CreateLinks
from install import createLinks

createLinks(
[
  { 'src': 'vim', 'dst': '.vim' },
  { 'src': 'vim/vimrc', 'dst': '.vimrc' }
] )
