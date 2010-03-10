#!/bin/sh

# Ham Maildir
sa-learn --no-sync --ham $HOME/Maildir/.MaildirInbox/{cur,new} > /dev/null
sa-learn --no-sync --ham $HOME/Maildir/.Ops/{cur,new} > /dev/null

# Spam Maildir
sa-learn --no-sync --spam $HOME/Maildir/.Junk/{cur,new} > /dev/null
