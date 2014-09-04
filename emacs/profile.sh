#!/bin/bash
\grep -v mapc init.el  > fullinit.el
find lisp -name '*.el' -exec cat "{}" \; | \grep -v load-theme >> fullinit.el
emacs --eval '(setq profile-dotemacs-file "./fullinit.el")(load-theme deeper-blue)' -Q -l ./vendor/profile-dotemacs.el -f profile-dotemacs
