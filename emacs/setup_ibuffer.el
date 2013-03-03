;;;_. ibuffer
(require 'ibuffer) 
(require 'ibuf-ext)

(use-package ibuffer
  :config
  (progn 
    (setq ibuffer-saved-filter-groups
          (quote (("default"      
                   ("erma-skk"
                    (filename . "/web/erma-skk"))
                   ("nh-wetlands-mapper-dev"
                    (filename . "/web/nh-wetlands-mapper-dev"))
                   ("SICP"
                    (filename . "SICP"))
                   ("HemlockForest"
                    (filename . "HemlockForest"))
                   ("MedHome"
                    (or
                     (filename . "/web/medhome")))
                   ("HCGS"
                    (or
                     (filename . "/web/hcgs")))
                   ("UACC"
                    (or
                     (filename . "/web/uacc")))
                   ("SpiceCore"
                    (or
                     (filename . "/web/SpiceCore")))
                   ("HealthyUNH"
                    (or
                     (filename . "/web/healthyunh")))
                   ("Housing OCM"
                    (or
                     (filename . "/web/housing/perl/HOUSING/EXT/OCM")
                     (filename . "/web/housing/htdocs/js/ocm")
                     (filename . "/web/housing/htdocs/css/ocm")
                     (filename . "/web/housing/sql/ocm")))
                   ("Housing ResLife"
                    (or
                     (filename . "/web/housing/perl/HOUSING/EXT/ResLife")
                     (filename . "/web/housing/htdocs/js/reslife")
                     (filename . "/web/housing/htdocs/css/reslife")
                     (filename . "/web/housing/sql/reslife")))
                   ("Housing InHall"
                    (or
                     (filename . "/web/housing/perl/HOUSING/EXT/Assignments/InHall")
                     (filename . "/web/housing/htdocs/js/inhall")
                     (filename . "/web/housing/htdocs/css/inhall")
                     (filename . "/web/housing/sql/inhall")))
                   ("Housing"
                    (filename . "/web/housing"))
                   ("Obliterase"
                    (or
                     (filename . "/web/neat-rcc")
                     (filename . "/web/neat")))
                   ("RCC"
                    (filename . "/webdev/rcc"))
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
                   ("scm-prompt"
                    (filename . "scm-prompt"))
                   ("dmenu_ssh"
                    (filename . "dmenu_ssh"))
                   ("University Calculus"
                    (filename . "~/TextBookSummaries/UniversityCalculus"))
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
                     (mode . scheme-mode)
                     ;; etc
                     ))))))
    ))

    (add-hook 'ibuffer-mode-hook 
              '(lambda ()
                 (ibuffer-auto-mode 1)
                 (ibuffer-switch-to-saved-filter-groups "default")))

    (setq ibuffer-show-empty-filter-groups nil)

    (defun mk/proj-buffer-p (b)
      "Is the buffer `b' part of the project?"
      (and mk-proj-name 
           (or (mk-proj-buffer-p b)
               (string= (buffer-name b) mk-proj-fib-name)
               (string= (buffer-file-name b) mk-proj-tags-file))))

    (define-ibuffer-column mk-proj-col
      (:name "P")
      (if (mk/proj-buffer-p buffer) "p" ""))

    ;; Define 3 formats, each including the new mk-proj-col
    ;; column. Switch formats with ibuffer-switch-format (bound to "`").
    (setq ibuffer-formats
          '((mark modified read-only              
                  (mk-proj-col 2 2 :left :elide) " "
                  (name 30 30 :left :elide) " "
                  (size 9 -1 :right) " "
                  (mode 16 16 :left :elide) " "
                  filename-and-process)
            (mark modified read-only
                  (mk-proj-col 2 2 :left :elide) " "
                  (name 45 -1 :left) " "
                  filename-and-process)
            (mark modified read-only
                  (mk-proj-col 2 2 :left :elide) " "
                  filename-and-process)))

    (global-set-key (kbd "C-x C-b") 'ibuffer)

    (define-ibuffer-filter project
        "Toggle current view to buffers in the defined mk-project."
      (:description "mk-project")
      (mk/proj-buffer-p buf))
    (define-key ibuffer-mode-map (kbd "/ k") 'ibuffer-filter-by-project)

(global-set-key [XF86HomePage] 'ibuffer)

;(provide 'setup_ibuffer)

