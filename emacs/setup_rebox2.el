; http://www.emacswiki.org/emacs/rebox2
(use-package rebox2
  :init
  (progn
    (bind-key "M-q" 'rebox-dwim)
    (bind-key "S-M-q" 'rebox-cycle)))

