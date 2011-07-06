;;; skk-ibuffer.el 

(require 'ibuffer) 
(setq ibuffer-saved-filter-groups
  (quote (("default"      
            ("erma-skk"
             (filename . "/web/erma-skk"))
            ("nh-wetlands-mapper-dev"
             (filename . "/web/nh-wetlands-mapper-dev"))
            ("Housing"
             (filename . "/web/housing"))
            ("EPSCoR"
             (or
              (filename . "/web/epscor")
              (filename . "/web/perl/Lib/EPSCOR")))
            ("UPS"
             (filename . "~/work/ups"))
            ("NEC"
             (or
              (filename . "/web/nec")
              (filename . "/web1/nec")
              (filename . "/web2/nec")))
            ("Emacs Config"
              (filename . "emacs"))
            ("NHIHPP"
             (filename . "/web/perl/Lib/NHIHPP"))
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
                ;; etc
                ))
            ))))

(add-hook 'ibuffer-mode-hook 
	  '(lambda ()
	     (ibuffer-auto-mode 1)
	     (ibuffer-switch-to-saved-filter-groups "default")))

(setq ibuffer-show-empty-filter-groups nil)

(global-set-key (kbd "C-x C-b") 'ibuffer)

(provide 'skk-ibuffer)
;;; skk-ibuffer.el ends here
