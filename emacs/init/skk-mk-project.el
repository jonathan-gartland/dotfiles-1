;;; skk-mk-project.el --- mk-project.el config

(when (require-maybe 'mk-project)

  (global-set-key (kbd "C-c p c") 'project-compile)
  (global-set-key (kbd "C-c p l") 'project-load)
  (global-set-key (kbd "C-c p a") 'project-ack)
  (global-set-key (kbd "C-c p g") 'project-grep)
  (global-set-key (kbd "C-c p o") 'project-multi-occur)
  (global-set-key (kbd "C-c p u") 'project-unload)
  (global-set-key (kbd "C-c p f") 'project-find-file-ido) ; or project-find-file-ido
  (global-set-key (kbd "C-c p i") 'project-index)
  (global-set-key (kbd "C-c p s") 'project-status)
  (global-set-key (kbd "C-c p h") 'project-home)
  (global-set-key (kbd "C-c p d") 'project-dired)
  (global-set-key (kbd "C-c p t") 'project-tags)

  ;; (defun web-project-def-factory (project-name hostname start-dir _vcs)
  ;;   "Create a project-def for RCI's web sites."

  ;;   (project-def project-name
  ;;   '(
  ;;     (basedir (concat "/ssh:" hostname ":" start-dir))
  ;;     (src-patterns _src-patterns)
  ;;     (file-list-cache (concat "~/.emacs.d/.cache/" start-dir "files"))
  ;;     (open-files-cache (concat "~/.emacs.d/.cache/" start-dir "open-files"))
  ;;     (tag-files (concat "~/.emacs.d/.cache/" start-dir "TAGS"))
  ;;     (vcs _vcs)
  ;;     (ack-args _src-patterns)
  ;;     (compile-cmd nil)
  ;;     (index-find-cmd (lambda (content)
  ;;                         ; TODO: 
  ;;                         ; 1) Update to use regex to split up basedir, instead of hard-coding data.
  ;;                         ; 2) It'd be nice to use src-patterns and ignore-patterns
  ;;                       (let* (
  ;;                                (find-cmd (concat "cd \"" start-dir "\"; find '.' -type f "
  ;;                                                  (mk-proj-find-cmd-src-args mk-proj-src-patterns))))
  ;;                           (when (mk-proj-get-vcs-path)
  ;;                             (setq find-cmd (concat find-cmd " -not -path " (mk-proj-get-vcs-path))))
                            
  ;;                           (concat "ssh " hostname " \"" find-cmd "\""))))
  ;;     (startup-hook (lambda ()
  ;;                     (make-directory (file-name-directory (expand-file-name mk-proj-file-list-cache)) t)
  ;;                     (make-directory (file-name-directory (expand-file-name mk-proj-open-files-cache)) t)
  ;;                     (make-directory (file-name-directory (expand-file-name mk-proj-tags-file)) t)
  ;;                     (setq cperl-indent-level 4))))))

  ;; (web-project-def-factory "TEST" "lithium.sr.unh.edu" "/web/epscor" 'git)
  
  ;; 
  ;; Web Projects
  ;; 


  ;; (defun make-project-def-sshfs (_projectname _basedir _vcs)
  ;;   (let (cache-dirname '(concat "~/.emacs.d/.cache/" _projectname))
  ;;     (project-def _projectname
  ;;                  '((basedir  _basedir)
  ;;                    (src-patterns ("*.js *.html *.pm *.css"))
  ;;                    (ignore-patterns nil)
  ;;                    (open-file-cache (concat cache-dirname "/open-files"))
  ;;                    (file-list-cache (concat cache-dirname "/files"))
  ;;                    (tags-file (concat cache-dirname "/TAGS"))
  ;;                    (vcs _vcs)
  ;;                    (ack-args "--perl --js --html --css")
  ;;                    (compile-cmd nil)
  ;;                    (startup-hook (lambda ()
  ;;                                (setq perl-command "/home/skk/bin/perl_syntax_checker.sh")
  ;;                                (setq perl-dbg-flags "")
  ;;                                (setq cperl-indent-level 4)))
  ;;                    (shutdown-hook (lambda ()))))))

  ;; (make-project-def-sshfs "EPSCOR Developemnt SSHFS" "/sshfs/lithium/web/epscor" 'git)
  ;; (make-project-def-sshfs "Housing Preview SSHFS" "/sshfs/myxomatosis//web/housing" 'git)
  ;; (make-project-def-sshfs "EPSCOR Preview SSHFS" "/sshfs/myxomatosis/web/epscor" 'git)
  ;; (make-project-def-sshfs "EPSCOR Testing SSHFS" "/sshfs/myxomatosis/web/epscor-tnt" 'git)


  (project-def "Housing Development (SSHFS)"
               '((basedir "/sshfs/lithium/web/housing")
                 (src-patterns ("*.js" " *.html" "*.pm" "*.css"))
                 (ignore-patterns nil)
                 (tags-file "~/.emacs.d/.cache/housing-dev/TAGS")
                 (file-list-cache "~/.emacs.d/.cache/housing-dev/files")
                 (open-files-cache "~/.emacs.d/.cache/housing-dev/open-files")
                 (tags-file "~/.emacs.d/.cache/housing-dev/TAGS")
                 (vcs git)
                 (ack-args "--perl --js --html --css")
                 (compile-cmd nil)
                 (startup-hook (lambda ()
                                 (setq perl-command "/home/skk/bin/perl_syntax_checker.sh")
                                 (setq perl-dbg-flags "")
                                 (setq cperl-indent-level 4)))
                 (shutdown-hook (lambda ()
                                  (setq tags-file-name nil)))))

  (project-def "NEC Live"
               '((basedir "/ssh:contact.sr.unh.edu:/web2/nec")
                 (src-patterns ("*.js *.html *.pm *.css"))
                 (ignore-patterns nil)
                 (file-list-cache "~/.emacs.d/.cache/nec/files")
                 (open-files-cache "~/.emacs.d/.cache/nec/open-files")
                 (tags-file "~/.emacs.d/.cache/nec/TAGS")
                 (vcs git)
                 (ack-args "--perl --js --html --css")
                 (compile-cmd nil)
                 (index-find-cmd (lambda (content)
                          ; TODO: 
                          ; 1) Update to use regex to split up basedir, instead of hard-coding data.
                          ; 2) It'd be nice to use src-patterns and ignore-patterns
                          (let* (
                                 (hostname "contact.sr.unh.edu")
                                 (start-dir "/web2/nec")
                                 (find-cmd (concat "cd \"" start-dir "\"; find '.' -type f "
                                                   (mk-proj-find-cmd-src-args mk-proj-src-patterns))))
                            (when (mk-proj-get-vcs-path)
                              (setq find-cmd (concat find-cmd " -not -path " (mk-proj-get-vcs-path))))
                            
                            (concat "ssh " hostname " \"" find-cmd "\""))))
                 (startup-hook (lambda ()
                                 (make-directory (file-name-directory (expand-file-name mk-proj-file-list-cache)) t)
                                 (make-directory (file-name-directory (expand-file-name mk-proj-open-files-cache)) t)
                                 (make-directory (file-name-directory (expand-file-name mk-proj-tags-file)) t)
                                 (setq cperl-indent-level 4)))
                 (shutdown-hook nil)))

  (project-def "NEC Development"
               '((basedir "/ssh:lithium.sr.unh.edu:/web/nec")
                 (src-patterns ("*.js *.html *.pm *.css"))
                 (ignore-patterns nil)
                 (file-list-cache "~/.emacs.d/.cache/nec-dev/files")
                 (open-files-cache "~/.emacs.d/.cache/nec-dev/open-files")
                 (tags-file "~/.emacs.d/.cache/nec-deve/TAGS")
                 (vcs git)
                 (ack-args "--perl --js --html --css")
                 (compile-cmd nil)
                 (index-find-cmd (lambda (content)
                          ; TODO: 
                          ; 1) Update to use regex to split up basedir, instead of hard-coding data.
                          ; 2) It'd be nice to use src-patterns and ignore-patterns
                          (let* (
                                 (hostname "lithium.sr.unh.edu")
                                 (start-dir "/web/nec")
                                 (find-cmd (concat "cd \"" start-dir "\"; find '.' -type f "
                                                   (mk-proj-find-cmd-src-args mk-proj-src-patterns))))
                            (when (mk-proj-get-vcs-path)
                              (setq find-cmd (concat find-cmd " -not -path " (mk-proj-get-vcs-path))))
                            
                            (concat "ssh " hostname " \"" find-cmd "\""))))
                 (startup-hook (lambda ()
                                 (make-directory (file-name-directory (expand-file-name mk-proj-file-list-cache)) t)
                                 (make-directory (file-name-directory (expand-file-name mk-proj-open-files-cache)) t)
                                 (make-directory (file-name-directory (expand-file-name mk-proj-tags-file)) t)
                                 (setq cperl-indent-level 4)))
                 (shutdown-hook nil)))

  (project-def "EPSCOR Development"
               '((basedir "/ssh:lithium.sr.unh.edu:/web/epscor")
                 (src-patterns ("*.js" "*.html" "*.pm" "*.css"))
                 (ignore-patterns nil)
                 (file-list-cache "~/.emacs.d/.cache/epscor-dev/files")
                 (open-files-cache "~/.emacs.d/.cache/epscor-dev/open-files")
                 (tags-file "~/.emacs.d/.cache/epscor-dev/TAGS")
                 (vcs git)
                 (ack-args "--perl --js --html --css")
                 (compile-cmd nil)
                 ;; (src-find-cmd (lambda (context)

                 ;;          ; TODO: 
                 ;;          ; 1) Update to use regex to split up basedir, instead of hard-coding data.
                 ;;          ; 2) It'd be nice to use src-patterns and ignore-patterns

                 ;;          (let* (
                 ;;                 (hostname "lithium.sr.unh.edu")
                 ;;                 (start-dir "/web/epscor")
                 ;;                 (find-cmd (concat "cd \"" start-dir "\"; find '.' -type f "
                 ;;                                   (mk-proj-find-cmd-src-args mk-proj-src-patterns))))
                 ;;            (when (mk-proj-get-vcs-path)
                 ;;              (setq find-cmd (concat find-cmd " -not -path " (mk-proj-get-vcs-path))))
                            
                 ;;            (concat "ssh " hostname " \"" find-cmd "\""))))

                 (index-find-cmd (lambda (contet)
                          ; TODO: 
                          ; 1) Update to use regex to split up basedir, instead of hard-coding data.
                          ; 2) It'd be nice to use src-patterns and ignore-patterns

                            (let* (
                                   (hostname "lithium.sr.unh.edu")
                                   (start-dir "/web/epscor")
                                   (find-cmd (concat "cd \"" start-dir "\"; find '.' -type f "
                                                     (mk-proj-find-cmd-src-args mk-proj-src-patterns))))
                            (when (mk-proj-get-vcs-path)
                              (setq find-cmd (concat find-cmd " -not -path " (mk-proj-get-vcs-path))))
                            
                            (concat "ssh " hostname " \"" find-cmd "\""))))

                 (startup-hook (lambda ()
                                 (make-directory (file-name-directory (expand-file-name mk-proj-file-list-cache)) t)
                                 (make-directory (file-name-directory (expand-file-name mk-proj-open-files-cache)) t)
                                 (make-directory (file-name-directory (expand-file-name mk-proj-tags-file)) t)
                                 (setq cperl-indent-level 4)))
                 (shutdown-hook nil)))

  (project-def "EPSCOR Preview"
               '((basedir "/ssh:myxomatosis.sr.unh.edu:/web/epscor")
                 (src-patterns ("*.js *.html *.pm *.css"))
                 (ignore-patterns nil)
                 (file-list-cache "~/.emacs.d/.cache/epscor-pre/files")
                 (open-files-cache "~/.emacs.d/.cache/epscor-pre/open-files")
                 (tags-file "~/.emacs.d/.cache/epscor-pre/TAGS")
                 (vcs git)
                 (ack-args "--perl --js --html --css")
                 (compile-cmd nil)
                 (index-find-cmd (lambda (content)
                          ; TODO: 
                          ; 1) Update to use regex to split up basedir, instead of hard-coding data.
                          ; 2) It'd be nice to use src-patterns and ignore-patterns
                          (let* (
                                 (hostname "myxomatosis.sr.unh.edu")
                                 (start-dir "/web/epscor")
                                 (find-cmd (concat "cd \"" start-dir "\"; find '.' -type f "
                                                   (mk-proj-find-cmd-src-args mk-proj-src-patterns))))
                            (when (mk-proj-get-vcs-path)
                              (setq find-cmd (concat find-cmd " -not -path " (mk-proj-get-vcs-path))))
                            
                            (concat "ssh " hostname " \"" find-cmd "\""))))
                 (startup-hook (lambda ()
                                 (make-directory (file-name-directory (expand-file-name mk-proj-file-list-cache)) t)
                                 (make-directory (file-name-directory (expand-file-name mk-proj-open-files-cache)) t)
                                 (make-directory (file-name-directory (expand-file-name mk-proj-tags-file)) t)
                                 (setq cperl-indent-level 4)))

                 (shutdown-hook nil)))

  (project-def "EPSCOR Test"
               '((basedir "/ssh:myxomatosis.sr.unh.edu:/web/epscor-tnt")
                 (src-patterns ("*.js *.html *.pm *.css"))
                 (ignore-patterns nil)
                 (file-list-cache "~/.emacs.d/.cache/epscor-tnt/files")
                 (open-files-cache "~/.emacs.d/.cache/epscor-tnt/open-files")
                 (tags-file "~/.emacs.d/.cache/epscor-tnt/TAGS")
                 (vcs git)
                 (ack-args "--perl --js --html --css")
                 (compile-cmd nil)
                 (index-find-cmd (lambda (content)
                          ; TODO: 
                          ; 1) Update to use regex to split up basedir, instead of hard-coding data.
                          ; 2) It'd be nice to use src-patterns and ignore-patterns
                          (let* (
                                 (hostname "myxomatosis.sr.unh.edu")
                                 (start-dir "/web/epscor-tnt")
                                 (find-cmd (concat "cd \"" start-dir "\"; find '.' -type f "
                                                   (mk-proj-find-cmd-src-args mk-proj-src-patterns))))
                            (when (mk-proj-get-vcs-path)
                              (setq find-cmd (concat find-cmd " -not -path " (mk-proj-get-vcs-path))))
                            
                            (concat "ssh " hostname " \"" find-cmd "\""))))
                 (startup-hook (lambda ()
                                 (make-directory (file-name-directory (expand-file-name mk-proj-file-list-cache)) t)
                                 (make-directory (file-name-directory (expand-file-name mk-proj-open-files-cache)) t)
                                 (make-directory (file-name-directory (expand-file-name mk-proj-tags-file)) t)
                                 (setq cperl-indent-level 4)))
                 (shutdown-hook nil)))

  (project-def "Housing Development"
               '((basedir "/ssh:lithium.sr.unh.edu:/web/housing")
                 (src-patterns ("*.js" " *.html" "*.pm" "*.css"))
                 (ignore-patterns nil)
                 (tags-file "~/.emacs.d/.cache/housing-dev/TAGS")
                 (file-list-cache "~/.emacs.d/.cache/housing-dev/files")
                 (open-files-cache "~/.emacs.d/.cache/housing-dev/open-files")
                 (tags-file "~/.emacs.d/.cache/housing-dev/TAGS")
                 (vcs git)
                 (ack-args "--perl --js --html --css")
                 (compile-cmd nil)
                 (index-find-cmd (lambda (content)
                          ; TODO: 
                          ; 1) Update to use regex to split up basedir, instead of hard-coding data.
                          ; 2) It'd be nice to use src-patterns and ignore-patterns
                          (let* (
                                 (hostname "lithium.sr.unh.edu")
                                 (start-dir "/web/housing")
                                 (find-cmd (concat "cd \"" start-dir "\"; find '.' -type f "
                                                   (mk-proj-find-cmd-src-args mk-proj-src-patterns))))
                            (when (mk-proj-get-vcs-path)
                              (setq find-cmd (concat find-cmd " -not -path " (mk-proj-get-vcs-path))))
                            (setq  cmd (concat "ssh " hostname " \"" find-cmd "\""))
                            cmd)))
                 (src-find-cmd (lambda (content)
                          ; TODO: 
                          ; 1) Update to use regex to split up basedir, instead of hard-coding data.
                          ; 2) It'd be nice to use src-patterns and ignore-patterns
                          (let* (
                                 (hostname "lithium.sr.unh.edu")
                                 (start-dir "/web/housing")
                                 (find-cmd (concat "cd \"" start-dir "\"; find '.' -type f "
                                                   (mk-proj-find-cmd-src-args mk-proj-src-patterns))))
                            (when (mk-proj-get-vcs-path)
                              (setq find-cmd (concat find-cmd " -not -path " (mk-proj-get-vcs-path))))
                            (setq  cmd (concat "ssh " hostname " \"" find-cmd "\""))
                            cmd)))

                 (startup-hook (lambda ()
                                 (setq tags-file-name "/ssh:lithium.sr.unh.edu:/web/housing/perl/TAGS")
                                 (make-directory (file-name-directory (expand-file-name mk-proj-file-list-cache)) t)
                                 (make-directory (file-name-directory (expand-file-name mk-proj-open-files-cache)) t)
                                 (make-directory (file-name-directory (expand-file-name mk-proj-tags-file)) t)
                                 (setq cperl-indent-level 4)))
                 (shutdown-hook (lambda ()
                                  (setq tags-file-name nil)))))

  (project-def "Housing Preview"
               '((basedir "/ssh:myxomatosis.sr.unh.edu:/web/housing")
                 (src-patterns ("*.js *.html *.pm *.css"))
                 (ignore-patterns nil)
                 (tags-file nil)
                 (file-list-cache "~/.emacs.d/.cache/housing-pre/files")
                 (open-files-cache "~/.emacs.d/.cache/housing-pre/open-files")
                 (tags-file "~/.emacs.d/.cache/housing-pre/TAGS")
                 (vcs git)
                 (ack-args "--perl --js --html --css")
                 (compile-cmd nil)
                 (index-find-cmd (lambda (content)
                          ; TODO: 
                          ; 1) Update to use regex to split up basedir, instead of hard-coding data.
                          ; 2) It'd be nice to use src-patterns and ignore-patterns
                                   (let* (
                                 (hostname "myxomatosis.sr.unh.edu")
                                 (start-dir "/web/housing")
                                 (find-cmd (concat "cd \"" start-dir "\"; find '.' -type f "
                                                   (mk-proj-find-cmd-src-args mk-proj-src-patterns))))
                            (when (mk-proj-get-vcs-path)
                              (setq find-cmd (concat find-cmd " -not -path " (mk-proj-get-vcs-path))))
                            
                            (concat "ssh " hostname " \"" find-cmd "\""))))
                 (startup-hook (lambda ()
                                 (make-directory (file-name-directory (expand-file-name mk-proj-file-list-cache)) t)
                                 (make-directory (file-name-directory (expand-file-name mk-proj-open-files-cache)) t)
                                 (make-directory (file-name-directory (expand-file-name mk-proj-tags-file)) t)
                                 (setq cperl-indent-level 4)))
                 (shutdown-hook nil)))

  (project-def "RCC Development"
               '((basedir "/ssh:amnesiac.sr.unh.edu:/webdev/rcc")
                 (src-patterns ("*.pm"))
                 (ignore-patterns nil)
                 (tags-file nil)
                 (file-list-cache "~/.emacs.d/.cache/rcc-dev/files")
                 (open-files-cache "~/.emacs.d/.cache/rcc-dev/open-files")
                 (tags-file "~/.emacs.d/.cache/rcc-dev/TAGS")
                 (vcs git)
                 (ack-args "--perl --js --html --css")
                 (compile-cmd nil)

                 (index-find-cmd (lambda (content)
                          ; TODO: 
                          ; 1) Update to use regex to split up basedir, instead of hard-coding data.
                          ; 2) It'd be nice to use src-patterns and ignore-patterns
                                   (let* (
                                 (hostname "amnesiac.sr.unh.edu")
                                 (start-dir "/webdev/rcc")
                                 (find-cmd (concat "cd \"" start-dir "\"; find '.' -type f "
                                                   (mk-proj-find-cmd-ignore-args  mk-proj-ignore-patterns))))
                            (when (mk-proj-get-vcs-path)
                              (setq find-cmd (concat find-cmd " -not -path " (mk-proj-get-vcs-path))))
                            
                            (concat "ssh " hostname " \"" find-cmd "\""))))

                 (startup-hook (lambda ()
                                 (make-directory (file-name-directory (expand-file-name mk-proj-file-list-cache)) t)
                                 (make-directory (file-name-directory (expand-file-name mk-proj-open-files-cache)) t)
                                 (make-directory (file-name-directory (expand-file-name mk-proj-tags-file)) t)
                                 (setq cperl-indent-level 4)))
                 (shutdown-hook nil)))

  (project-def "Human Factors"
               '((basedir "/ssh:velouria.sr.unh.edu:/web/humanf")
                 (src-patterns ("*.js *.html *.pm *.css"))
                 (ignore-patterns nil)
                 (tags-file nil)
                 (file-list-cache "~/.emacs.d/.cache/humanf/files")
                 (open-files-cache "~/.emacs.d/.cache/humanf/open-files")
                 (tags-file "~/.emacs.d/.cache/humanf/TAGS")
                 (vcs git)
                 (ack-args "--perl --js --html --css")
                 (compile-cmd nil)
                 (index-find-cmd (lambda (content)
                          ; TODO: 
                          ; 1) Update to use regex to split up basedir, instead of hard-coding data.
                          ; 2) It'd be nice to use src-patterns and ignore-patterns
                          (let* (
                                 (hostname "velouria.sr.unh.edu")
                                 (start-dir "/web/humanf")
                                 (find-cmd (concat "cd \"" start-dir "\"; find '.' -type f "
                                                   (mk-proj-find-cmd-ignore-args mk-proj-ignore-patterns)))))
                            (when (mk-proj-get-vcs-path)
                              (setq find-cmd (concat find-cmd " -not -path " (mk-proj-get-vcs-path))))
                            
                            (concat "ssh " hostname " \"" find-cmd "\"")))
                 (startup-hook (lambda ()
                                 (make-directory (file-name-directory (expand-file-name mk-proj-file-list-cache)) t)
                                 (make-directory (file-name-directory (expand-file-name mk-proj-open-files-cache)) t)
                                 (make-directory (file-name-directory (expand-file-name mk-proj-tags-file)) t)
                                 (setq cperl-indent-level 4)))

                 (shutdown-hook nil)))

  ;; 
  ;; Local Projects
  ;;
  (project-def "DotFilesForest"
               '((basedir "~/dot-files-forest/")
                 (src-patterns ("*.el .py .sh"))
                 (ignore-patterns nil)
                 (file-list-cache "~/.emacs.d/.cache/dot-files-forest/files")
                 (open-files-cache "~/.emacs.d/.cache/dot-files-forest/open-files")
                 (tags-file "~/.emacs.d/.cache/dot-files-forest/TAGS")
                 (vcs git)
                 (ack-args "--elisp --python --shell")
                 (compile-cmd nil)
                 (startup-hook (lambda ()
                                 (make-directory (file-name-directory (expand-file-name mk-proj-file-list-cache)) t)
                                 (make-directory (file-name-directory (expand-file-name mk-proj-open-files-cache)) t)
                                 (make-directory (file-name-directory (expand-file-name mk-proj-tags-file)) t)))
                 ))

  (project-def "emacs"
               '((basedir "~/.emacs.d/")
                 (src-patterns ("*.el"))
                 (ignore-patterns nil)
                 (file-list-cache "~/.emacs.d/.cache/emacs/files")
                 (open-files-cache "~/.emacs.d/.cache/emacs/open-files")
                 (tags-file "~/.emacs.d/.cache/emacs/TAGS")
                 (vcs git)
                 (ack-args "--elisp")
                 (compile-cmd nil)
                 (startup-hook (lambda ()
                                 (make-directory (file-name-directory (expand-file-name mk-proj-file-list-cache)) t)
                                 (make-directory (file-name-directory (expand-file-name mk-proj-open-files-cache)) t)
                                 (make-directory (file-name-directory (expand-file-name mk-proj-tags-file)) t)))
                 ))


  (project-def "CRMS"
               '((basedir "~/CRMS/")
                 (src-patterns ("*.js *.html *.java *.css *.jsp"))
                 (ignore-patterns nil)
                 (file-list-cache "~/.emacs.d/.cache/CRMS/files")
                 (open-files-cache "~/.emacs.d/.cache/CRMS/open-files")
                 (tags-file "~/.emacs.d/.cache/CRMS/TAGS")
                 (vcs git)
                 (ack-args "--perl --js --html --css --java --jsp")
                 (compile-cmd nil)
                 (startup-hook (lambda ()
                                 (make-directory (file-name-directory (expand-file-name mk-proj-file-list-cache)) t)
                                 (make-directory (file-name-directory (expand-file-name mk-proj-open-files-cache)) t)
                                 (make-directory (file-name-directory (expand-file-name mk-proj-tags-file)) t)))

                 ))
 )

(provide 'skk-mk-project)
;;; skk-mk-project.el ends here
