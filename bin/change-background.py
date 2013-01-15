#!/usr/bin/env python2
#
# change-background.py
#
# A script to change to a random background image
#
# (c) 2004, Davyd Madeley <davyd@madeley.id.au>
#
#   This program is free software; you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation; either version 2, or (at your option)
#   any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program; if not, write to the Free Software Foundation,
#   Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
#

#backgrounds = "/space/BackgroundImages/apod/"

from os import environ
import gconf
import os.path
import random
import mimetypes

backgrounds = environ.get( 'HOME' ) + "/Pictures/images/"

class GConfClient( object ):
        def __init__ (self):
                self.__client__ = gconf.client_get_default ()
        def get_background (self):
                return self.__client__.get_string ("/desktop/gnome/background/picture_filename")
        def set_background (self, background):
                self.__client__.set_string ("/desktop/gnome/background/picture_filename", background)


background_dir = backgrounds

if os.path.isdir( background_dir ):
    client = GConfClient()

    dir_items = os.listdir( background_dir )
    items = []

    for item in dir_items:
	mimetype = mimetypes.guess_type( item )[0]
	if mimetype and mimetype.split( '/' )[0] == "image":
		items.append( item )

    item = random.randint( 0, len( items ) - 1)
    current_bg = client.get_background( )

    while ( items[item] == current_bg ):
	    item = random.randint( 0, len( items) - 1 )


    image = os.path.join( background_dir, items[item] )

    client.set_background( image )

else:
    print "%s is not a directory." % background_dir
