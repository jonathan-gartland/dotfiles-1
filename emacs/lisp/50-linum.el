(use-package linum
  :init
  (progn
    ; enable display of line-numbers to left of buffer,
    ; update linum's format
    (setq linum-format "%d ") 
    (global-linum-mode 1)))
