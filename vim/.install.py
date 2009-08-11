#!/usr/bin/env python
#coding=utf-8

# import CreateLinks
from createlinks import CreateLinks

createLinks( 
[ 
  { 'src': 'vim', 'dst': '.vim', 'type': 'dir' }, 
  { 'src': 'vimrc', 'dst': '.vimrc', 'dir': 'vim', 'type': 'file' } 
], { 'dry_run' : False, 'verbose' : True } )
