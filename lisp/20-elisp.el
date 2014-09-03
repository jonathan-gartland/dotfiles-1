(add-hook 'emacs-lisp-mode-hook
          '(lambda () 
             (define-key emacs-lisp-mode-map (kbd "C-c C-r") 'eval-region)))

(provide '20-elisp)
