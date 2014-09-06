(use-package paredit
  :init
  (progn
    (add-hook 'emacs-lisp-mode-hook 'paredit-mode)
    (add-hook 'eval-expression-minibuffer-setup-hook 'paredit-mode)
    (add-hook 'ielm-mode-hook 'paredit-mode)
    (add-hook 'lisp-mode-hook 'paredit-mode)
    (add-hook 'lisp-interaction-mode-hook 'paredit-mode)
    (add-hook 'scheme-mode-hook 'paredit-mode)))
