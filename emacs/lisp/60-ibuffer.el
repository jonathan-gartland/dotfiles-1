(use-package ibuffer
  :config
  (progn 
    (setq ibuffer-saved-filter-groups
          (quote (("default"      
                   ("resume"
                    (filename . "resume"))
                   ("HemlockForest"
                    (filename . "HemlockForest"))
                   ("Emacs Config"
                    (filename . "emacs"))
                   ("dmenu_ssh"
                    (filename . "dmenu_ssh"))
                   ("DotFilesForest"
                    (filename . "dot-files-forest"))
                   ("version control" 
                    (or (mode . svn-status-mode)
                        (mode . svn-log-edit-mode)
                        (name . "^\\*svn-")
                        (name . "^\\*vc\\*$")
                        (name . "^\\*Annotate")
                        (name . "^\\*git-")
                        (name . "^\\*vc-")))
                   ("emacs" 
                    (or 
                     (name . "^\\*scratch\\*$")
                     (name . "^\\*Messages\\*$")
                     (name . "^TAGS\\(<[0-9]+>\\)?$")
                     (name . "^\\*Help\\*$")
                     (name . "^\\*info\\*$")
                     (name . "^\\*Occur\\*$")
                     (name . "^\\*grep\\*$")
                     (name . "^\\*Compile-Log\\*$")
                     (name . "^\\*Backtrace\\*$")
                     (name . "^\\*Process List\\*$")
                     (name . "^\\*gud\\*$")
                     (name . "^\\*Man")
                     (name . "^\\*WoMan")
                     (name . "^\\*Customize\*")
                     (name . "^\\*Pymacs\*")
                     (name . "^\\*Kill Ring\\*$")
                     (name . "^\\*Completions\\*$")
                     (name . "^\\*tramp")
                     (name . "^\\*Quail\*")
                     (name . "^\\*pymacs run")
                     (name . "^\\*shell\\*$")
                     (name . "^\\*compilation\\*$")))
                   ("Programming" ;; prog stuff not already in MyProjectX
                    (or
                     (mode . c-mode)
                     (mode . perl-mode)
                     (mode . python-mode)
                     (mode . emacs-lisp-mode)
                     (mode . scheme-mode)
                     ;; etc
                     ))))))

    (add-hook 'ibuffer-mode-hook 
              '(lambda ()
                 (ibuffer-auto-mode 1)
                 (ibuffer-switch-to-saved-filter-groups "default")))

    (setq ibuffer-show-empty-filter-groups nil)

    (global-set-key [XF86HomePage] 'ibuffer)))

(use-package ibuf-ext)
