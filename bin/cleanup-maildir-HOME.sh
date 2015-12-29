#!/bin/bash
$HOME/bin/cleanup-maildir --age=7  delete "Mailing Lists.Python List"
$HOME/bin/cleanup-maildir --age=7  delete "Mailing Lists.Elixir Users"
$HOME/bin/cleanup-maildir --age=7  delete "Mailing Lists.Lua Users"
$HOME/bin/cleanup-maildir --age=7  delete "Junk"
$HOME/bin/cleanup-maildir --age=30 delete "Daily"
$HOME/bin/cleanup-maildir --age=30 delete "Trash"
