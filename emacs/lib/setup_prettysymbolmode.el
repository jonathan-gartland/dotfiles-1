(use-package pretty-symbols)

(add-hook 'sepia-mode-hook 'pretty-symbols-mode)
(add-hook 'emacs-lisp-mode-hook 'pretty-symbols-mode)
(add-hook 'cperl-mode-hook 'pretty-symbols-mode)
(add-hook 'js2-mode 'pretty-symbols-mode)
(add-hook 'javascript-mode 'pretty-symbols-mode)
(add-hook 'python-mode 'pretty-mode)

(provide 'setup_prettysymbolmode)

