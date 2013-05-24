(use-package pretty-symbols
  :init (progn
    (add-hook 'sepia-hook 'pretty-symbols)
    (add-hook 'emacs-lisp-hook 'pretty-symbols)
    (add-hook 'cperl-hook 'pretty-symbols)
    (add-hook 'js2 'pretty-symbols)
    (add-hook 'javascript 'pretty-symbols)
    (add-hook 'python 'pretty-symbols)))

(provide 'setup_prettysymbolmode)

