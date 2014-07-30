#!/bin/bash
$HOME/bin/cleanup-maildir --age=30 delete "Mailing Lists.Arch Dev Public"
$HOME/bin/cleanup-maildir --age=30 delete "Mailing Lists.Arch General"
$HOME/bin/cleanup-maildir --age=30 delete "Mailing Lists.Fish User"
$HOME/bin/cleanup-maildir --age=60 delete "Mailing Lists.i3"
$HOME/bin/cleanup-maildir --age=30 delete "Mailing Lists.Ruby On Rails"
$HOME/bin/cleanup-maildir --age=30 delete "Mailing Lists.Ruby Talk"
$HOME/bin/cleanup-maildir --age=30 delete "Mailing Lists.Rust Dev"
$HOME/bin/cleanup-maildir --age=30 delete "Trash"

$HOME/bin/cleanup-maildir --age=7 delete "knightcx"
$HOME/bin/cleanup-maildir --age=7 delete "Junk"
$HOME/bin/cleanup-maildir --age=7 delete "github/fish-shell"
$HOME/bin/cleanup-maildir --age=7 delete "github/oh-my-fish"
