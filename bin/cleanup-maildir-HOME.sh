#!/bin/bash
$HOME/bin/cleanup-maildir --age=7  delete "Mailing Lists.Python List"
$HOME/bin/cleanup-maildir --age=7  delete "Mailing Lists.Lua Users"
$HOME/bin/cleanup-maildir --age=30  delete "Trash"
$HOME/bin/cleanup-maildir --age=7   delete "Junk"
