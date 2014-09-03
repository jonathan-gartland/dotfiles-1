
(use-package paredit
  :init (progn
           (add-hook 'emacs-lisp-mode-hook 'paredit-mode)
           (add-hook 'lisp-mode-hook 'paredit-mode)
           (add-hook 'lisp-interaction-mode-hook 'paredit-mode)))

(provide '05-paredit)
