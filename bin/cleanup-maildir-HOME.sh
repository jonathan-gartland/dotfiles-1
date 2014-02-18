#!/bin/bash
$HOME/bin/cleanup-maildir --age=30 delete "Mailing Lists.Arch General"
$HOME/bin/cleanup-maildir --age=30 delete "Mailing Lists.Eclim User"
$HOME/bin/cleanup-maildir --age=30 delete "Mailing Lists.Eclim Dev"
$HOME/bin/cleanup-maildir --age=30 delete "Mailing Lists.Fish User"
$HOME/bin/cleanup-maildir --age=60 delete "Mailing Lists.i3"
$HOME/bin/cleanup-maildir --age=30 delete "Mailing Lists.Ledger"
$HOME/bin/cleanup-maildir --age=30 delete "Mailing Lists.Mutt User"
$HOME/bin/cleanup-maildir --age=30 delete "Mailing Lists.Ruby Talk"
