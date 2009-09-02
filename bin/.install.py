#!/usr/bin/env python
#coding=utf-8

from install import createLinks

# create the links
createLinks( [ 
{ 'src': 'bin', 'dst': 'bin' },
{ 'src': 'bin/.eg.git/eg', 'dst': 'bin/eg' }
], 
{ 'dry_run' : False, 'verbose' : False } )
