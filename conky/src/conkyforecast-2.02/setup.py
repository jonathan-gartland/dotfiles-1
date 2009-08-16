#!/usr/bin/env python
#
# Copyright (C) 2008 Mark Buck (Kaivalagi)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
#

from distutils.core import setup
from fnmatch        import fnmatch
import os

# remove MANIFEST. distutils doesn't properly update it when the contents of directories change.
if os.path.exists('MANIFEST'): os.remove('MANIFEST')

def listfiles(*dirs):
	dir, pattern = os.path.split(os.path.join(*dirs))
	return [os.path.join(dir, filename)
		for filename in os.listdir(os.path.abspath(dir))
			if filename[0] != '.' and fnmatch(filename, pattern)]

setup(
		name             = 'conkyforecast',
		version          = '2.02',
		description      = 'Conky Weather Forecast',
		long_description = "Weather forecast script with support for language files, for use in Conky",
		author           = 'Mark Buck (Kaivalagi)',
		author_email     = 'm_buck@hotmail.com',
		url              = 'None',
		platforms        = 'linux',
		license          = 'GPLv3',
		scripts          = ['conkyForecast'],
		data_files       = [
			('/usr/share/conkyforecast/', [ 'conkyForecast.py' ] ),
			('/usr/share/conkyforecast/', [ 'conkyForecast.pot' ] ),
			('/usr/share/conkyforecast/', [ 'conkyForecast.config' ] ),
			('/usr/share/conkyforecast/locale/bg/LC_MESSAGES', listfiles( 'locale/bg/LC_MESSAGES', '*' ) ),
			('/usr/share/conkyforecast/locale/cs/LC_MESSAGES', listfiles( 'locale/cs/LC_MESSAGES', '*' ) ),
			('/usr/share/conkyforecast/locale/es/LC_MESSAGES', listfiles( 'locale/es/LC_MESSAGES', '*' ) ),
			('/usr/share/conkyforecast/locale/fr/LC_MESSAGES', listfiles( 'locale/fr/LC_MESSAGES', '*' ) ),
			('/usr/share/conkyforecast/locale/fj/LC_MESSAGES', listfiles( 'locale/fj/LC_MESSAGES', '*' ) ),
			('/usr/share/conkyforecast/locale/nl/LC_MESSAGES', listfiles( 'locale/nl/LC_MESSAGES', '*' ) ),
			('/usr/share/conkyforecast/locale/ro/LC_MESSAGES', listfiles( 'locale/ro/LC_MESSAGES', '*' ) ),	
			('/usr/share/conkyforecast/example', listfiles( 'example', '*' ) ),
			('/usr/share/conkyforecast/test', listfiles( 'test', '*' ) ),
			('/usr/share/fonts/truetype/conkyforecast', listfiles( 'fonts', '*' ) )
		],
	)

