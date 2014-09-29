#!/bin/bash
ruby ./to-single-el-file.rb
emacs --eval '(setq profile-dotemacs-file "./emacs-combined.el")' -Q -l ./vendor/profile-dotemacs.el -f profile-dotemacs

