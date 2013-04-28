;;; setup_haskell.el --- 

;; (use-package scion
;;   :init (progn
;;           (setq scion-program "~/.cabal/bin/scion-server")))

(use-package haskell-mode;
  :init (progn
          (add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
          (add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
          ;; (add-hook 'haskell-mode-hook (lambda ()
          ;;                                (scion-mode 1)
          ;;                                (scion-flycheck-on-save 1)))
          ))

(provide 'setup_haskell)
