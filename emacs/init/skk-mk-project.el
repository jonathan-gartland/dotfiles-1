;;; skk-mk-project.el --- mk-project.el config


(when (require-maybe 'mk-project)

  (global-set-key (kbd "C-c p c") 'project-compile)
  (global-set-key (kbd "C-c p l") 'project-load)
  (global-set-key (kbd "C-c p a") 'project-ack)
  (global-set-key (kbd "C-c p g") 'project-grep)
  (global-set-key (kbd "C-c p o") 'project-multi-occur)
  (global-set-key (kbd "C-c p u") 'project-unload)
  (global-set-key (kbd "C-c p f") 'project-find-file) ; or project-find-file-ido
  (global-set-key (kbd "C-c p i") 'project-index)
  (global-set-key (kbd "C-c p s") 'project-status)
  (global-set-key (kbd "C-c p h") 'project-home)
  (global-set-key (kbd "C-c p d") 'project-dired)
  (global-set-key (kbd "C-c p t") 'project-tags)

  (project-def "eSCATConduitProject"
               '((basedir "C:/eSCATConduit")
                 (src-patterns ("*.cpp", "*.h"))
                 (ignore-patterns ("*.o"))
                 (tags-file nil)
                 (file-list-cache nil)
                 (open-files-cache nil)
                 (vcs git)
                 (compile-cmd "q:/unix/MinGW/bin/make.exe -k")
                 (ack-args nil)
                 (startup-hook escatconduit-project-startup)
                 (shutdown-hook nil)))

  (defun escatconduit-project-startup ()
    (setq c-default-style "k&r"
          c-old-style-variable-behavior nil t))



  (project-def "eSCATDocsProject"
               '((basedir "~/work/eSCAT/docs")
                 (src-patterns ("*.rst"))
                 (tags-file nil)
                 (file-list-cache nil)
                 (open-files-cache nil)
                 (vcs git)
                 (compile-cmd "make html")
                 (ack-args nil)
                 (startup-hook nil)
                 (shutdown-hook nil)))

  (project-def "EPSCOR"
               '((basedir "/web/epscor")
                 (src-patterns ("*.js *.html *.pm"))
                 (ignore-patterns nil)
                 (tags-file nil)
                 (file-list-cache nil)
                 (open-files-cache nil)
                 (vcs git)
                 (ack-args "--perl --javascript")
                 (compile-cmd nil)
                 (startup-hook epscor-startuphook)
                 (shutdown-hook nil)))

  (defun epscor-startuphook ()
    (setq cperl-indent-level 4))

  (project-def "Housing-Dev"
               '((basedir "/ssh:lithium.sr.unh.edu:/web/housing")
                 (src-patterns ("*.js *.html *.pm"))
                 (ignore-patterns nil)
                 (tags-file nil)
                 (file-list-cache nil)
                 (open-files-cache nil)
                 (vcs git)
                 (ack-args "--perl --javascript")
                 (compile-cmd nil)
                 (startup-hook epscor-startuphook)
                 (shutdown-hook nil)))

  (project-def "Housing-Pre"
               '((basedir "/ssh:myxomatosis.sr.unh.edu:/web/housing")
                 (src-patterns ("*.js *.html *.pm"))
                 (ignore-patterns nil)
                 (tags-file nil)
                 (file-list-cache nil)
                 (open-files-cache nil)
                 (vcs git)
                 (ack-args "--perl --javascript")
                 (compile-cmd nil)
                 (startup-hook epscor-startuphook)
                 (shutdown-hook nil)))

  (defun housing-startuphook ()
    (setq cperl-indent-level 4))

)

(provide 'skk-mk-project)
;;; skk-mk-project.el ends here
