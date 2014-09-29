
; https://github.com/clojure-emacs/clojure-mode
(use-package clojure-mode
  :init
  (progn
    (add-hook 'clojure-mode-hook 'paredit-mode)
    (add-hook 'clojure-mode-hook 'subword-mode)
    (add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
    ))

; https://github.com/clojure-emacs/cider
(use-package cider
  :init
  (progn
    (add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
    (add-hook 'cider-mode-hook 'disable-evil-mode)
    (setq nrepl-hide-special-buffers t)
    ))

; https://github.com/clojure-emacs/ac-cider
(use-package ac-cider
  :init
  (progn
    (add-hook 'cider-mode-hook 'ac-flyspell-workaround)
    (add-hook 'cider-mode-hook 'ac-cider-setup)
    (add-hook 'cider-repl-mode-hook 'ac-cider-setup)
    (eval-after-load "auto-complete"
      '(add-to-list 'ac-modes 'cider-mode))
    ))
