#!/bin/sh

# Ham Maildir
sa-learn --no-sync --ham $HOME/Maildir/.Archive/{cur,new} > /dev/null

# Spam Maildir
sa-learn --no-sync --spam $HOME/Maildir/.Junk/{cur,new} > /dev/null
