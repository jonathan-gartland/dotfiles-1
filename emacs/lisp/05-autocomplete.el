; load yasnippet
 (add-hook 'after-init-hook
           ; Load yasnippet first to avoid precedence issues
           (lambda () 
             (use-package yasnippet
               :init
               (progn
                 (yas-global-mode 1)))))

; load auto-complete-config
 (add-hook 'after-init-hook
           (lambda () 
             (use-package auto-complete-config
               :init
               (progn
                  (setq ac-comphist-file emacs-acomphistfile-file)
                  (setq ac-auto-start nil)
                  (setq ac-quick-help-delay 0.5)

                  (add-to-list 'ac-dictionary-directories emacs-autocompletedict)
                  (ac-config-default)
                  (ac-set-trigger-key "TAB")
                  (define-key ac-mode-map  [(control tab)] 'auto-complete)
                  (setq-default ac-sources '(ac-source-yasnippet
                                             ac-source-abbrev
                                             ac-source-dictionary
                                             ac-source-words-in-same-mode-buffers))
                  (add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)
                  (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
                  (add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)
                  (add-hook 'css-mode-hook 'ac-css-mode-setup)
                  (add-hook 'auto-complete-mode-hook 'ac-common-setup)
                  (global-auto-complete-mode t)))))
