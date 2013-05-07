(use-package flymake
  :config
  '(progn
     (add-to-list 'load-path "~/.emacs.d/vendor/emacs-flymake")
     ;; Let's run 8 checks at once instead.
     (setq flymake-max-parallel-syntax-checks 4)
     ;; Yes, I want my copies in the same dir as the original.
     (setq flymake-run-in-place nil)
     
     ;; This lets me say where my temp dir is.
     (setq temporary-file-directory "~/.emacs.d/.cache/")
     ;; I want to see at most the first 4 errors for a line.
     (setq flymake-number-of-errors-to-display 4)))

(use-package flymake-jshint
  :init
  (progn
    (setenv "PATH" (concat "/home/skk/local/bin:" (getenv "PATH")))
    (setq exec-path '("/home/skk/local/bin" "/bin/" "/usr/bin"))
    (add-hook 'javascript-mode-hook
              (lambda () (flymake-mode t)))))

(use-package flymake-perlcritic
  :init
  (progn
    (setq flymake-perlcritic-profile "~/.perlcriticrc")
    (add-hook 'cperl-mode-hook
              (lambda () 
                (setq 
                 flymake-perlcritic-severity 2
                 flymake-perlcritic-theme "pbp && bugs")
                (flymake-mode t)))))


;;;_. flymake-cursor
(use-package flymake-cursor)
(global-set-key [XF86Back] 'flymake-goto-prev-error)
(global-set-key [XF86Forward] 'flymake-goto-next-error)

;(provide 'setup_flymake)
