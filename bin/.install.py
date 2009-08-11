#!/usr/bin/env python
#coding=utf-8

from install import createLinks

# create the links
createLinks( [ { 'src': 'bin', 'dst': 'bin' } ], { 'dry_run' : True, 'verbose' : False } )
