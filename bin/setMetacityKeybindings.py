#!/usr/bin/env python

from os import environ
from os.path import expandvars, join
from string import upper
import gconf

MAX_SYSTEMS = 12

systems = [ 'xpsgtl', 'amnesiac', 'blackstar', 'contact', 'lithium', 'morden', 'kenyan', 'spoo', 'revelator', 'zathras', 'whitestar'  ]

if len( systems ) > MAX_SYSTEMS:
    print "The systems list is too long, only %d keybinds can be set." % MAX_SYSTEMS
    exit( 1 )

xpsgtl = join( expandvars('$HOME/bin/'), 'xpsgtl' )

client = gconf.client_get_default()

# clear out current keybindings
for i in range(0,MAX_SYSTEMS):
    print "Clearing /apps/metacity/keybinding_commands/command_%d" % i
    print "Clearing /apps/metacity/global_keybindings/run_command_%d" % i
    client.unset("/apps/metacity/keybinding_commands/command_%d" % i)
    client.unset("/apps/metacity/global_keybindings/run_command_%d" % i)


# set systems in systems list
for index in range(1,len(systems)+1):
    print "\n"
    system = systems[index-1]
    print "index %s ... system %s" % (index,system)

    i = index
    key = "/apps/metacity/keybinding_commands/command_%d" % i
    if system == "xpsgtl":
        value = xpsgtl
    else:
        value = "%s %s" % ( xpsgtl, system )
    client.set_string(key, value)
    print "key %s value %s" % ( key, value )

    key = "/apps/metacity/global_keybindings/run_command_%d" % i
    if system == "xpsgtl":
        value = "<Alt>Escape"
    else:
        value = "<Control><Alt>%s" % upper( system[:1] )

    client.set_string(key, value)
    print "key %s value %s" % ( key, value )
