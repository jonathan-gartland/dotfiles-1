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

  (project-def "EPSCOR Development"
               '((basedir "/ssh:lithium.sr.unh.edu:/web/epscor")
                 (src-patterns ("*.js *.html *.pm *.css"))
                 (ignore-patterns nil)
                 (file-list-cache "~/.emacs.d/.cache/epscor-dev/files")
                 (open-files-cache "~/.emacs.d/.cache/epscor-dev/open-files")
                 (tags-file "~/.emacs.d/.cache/epscor-dev/TAGS")
                 (vcs git)
                 (ack-args "--perl --js --html --css")
                 (compile-cmd nil)
                 (index-find-cmd (lambda (content)
                          ; TODO: 
                          ; 1) Update to use regex to split up basedir, instead of hard-coding data.
                          ; 2) It'd be nice to use src-patterns and ignore-patterns
                          (let* (
                                 (hostname "lithium.sr.unh.edu")
                                 (start-dir "/web/epscor")
                                 (find-cmd (concat "cd \"" start-dir "\"; find '.' -type f "
                                                   (mk-proj-find-cmd-ignore-args mk-proj-ignore-patterns))))
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
'                          ; TODO: 
                          ; 1) Update to use regex to split up basedir, instead of hard-coding data.
                          ; 2) It'd be nice to use src-patterns and ignore-patterns
                          (let* (
                                 (hostname "myxomatosis.sr.unh.edu")
                                 (start-dir "/web/epscor")
                                 (find-cmd (concat "cd \"" start-dir "\"; find '.' -type f "
                                                   (mk-proj-find-cmd-ignore-args mk-proj-ignore-patterns))))
                            (when (mk-proj-get-vcs-path)
                              (setq find-cmd (concat find-cmd " -not -path " (mk-proj-get-vcs-path))))
                            
                            (concat "ssh " hostname " \"" find-cmd "\""))))
                 (startup-hook (lambda () 
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
                                                   (mk-proj-find-cmd-ignore-args mk-proj-ignore-patterns))))
                            (when (mk-proj-get-vcs-path)
                              (setq find-cmd (concat find-cmd " -not -path " (mk-proj-get-vcs-path))))
                            
                            (concat "ssh " hostname " \"" find-cmd "\""))))
                 (startup-hook (lambda () 
                                 (setq cperl-indent-level 4)))
                 (shutdown-hook nil)))


  (project-def "Housing Development"
               '((basedir "/ssh:lithium.sr.unh.edu:/web/housing")
                 (src-patterns ("*.js *.html *.pm *.css"))
                 (ignore-patterns nil)
                 (tags-file nil)
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
                                                   (mk-proj-find-cmd-ignore-args mk-proj-ignore-patterns))))
                            (when (mk-proj-get-vcs-path)
                              (setq find-cmd (concat find-cmd " -not -path " (mk-proj-get-vcs-path))))
                            
                            (concat "ssh " hostname " \"" find-cmd "\""))))
                 (startup-hook (lambda () 
                                 (setq cperl-indent-level 4)))
                 (shutdown-hook nil)))

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
                                                   (mk-proj-find-cmd-ignore-args mk-proj-ignore-patterns))))
                            (when (mk-proj-get-vcs-path)
                              (setq find-cmd (concat find-cmd " -not -path " (mk-proj-get-vcs-path))))
                            
                            (concat "ssh " hostname " \"" find-cmd "\""))))
                 (startup-hook (lambda () 
                                 (setq cperl-indent-level 4)))
                 (shutdown-hook nil)))

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

                 )))
(provide 'skk-mk-project)
;;; skk-mk-project.el ends here
