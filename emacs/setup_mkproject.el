;;; setup_mkproject.el --- 

;; Copyright (C) 2012  Steven Knight

;; Author: Steven Knight <skk@sr.unh.edu>
;; Keywords: 

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; 

;;; Code:

(use-package mk-project
  :init
  (progn
    (bind-key "C-x p c" 'project-compile)
    (bind-key "C-x p l" 'project-load)
    (bind-key "C-x p a" 'project-ack)
    (bind-key "C-x p g" 'project-grep)
    (bind-key "C-x p o" 'project-multi-occur)
    (bind-key "C-x p u" 'project-unload)
    (bind-key "C-x p f" 'project-find-file-ido)
    (bind-key "C-x p i" 'project-index)
    (bind-key "C-x p s" 'project-status)
    (bind-key "C-x p h" 'project-home)
    (bind-key "C-x p d" 'project-dired)
    (bind-key "C-x p t" 'project-tags))

  :config
  (progn
    (project-def "ePIP Unit Testing"
                 '((basedir "/home/skk/epip_unit_testing/")
                   (src-patterns ("*.py"))
                   (ignore-patterns ("bzr/.*"))
                   (tags-file "~/.emacs.d/.cache/epip_unit_testing/TAGS")
                   (file-list-cache "~/.emacs.d/.cache/epip_unit_testing/files")
                   (open-files-cache "~/.emacs.d/.cache/epip_unit_testing/open-files")
                   (vcs git)
                   (ack-args "--python")
                   (compile-cmd nil)
                   (startup-hook (lambda ()
                                   (make-directory (file-name-directory (expand-file-name mk-proj-file-list-cache)) t)
                                   (make-directory (file-name-directory (expand-file-name mk-proj-open-files-cache)) t)
                                   (make-directory (file-name-directory (expand-file-name mk-proj-tags-file)) t)))
                   (shutdown-hook (lambda ()
                                    (setq tags-file-name nill)))))
    
    (project-def "MedHome Development"
                 '((basedir "/sshfs/lithium/web/medhome")
                   (src-patterns ("*.js"  "*.pm" "*.css"))
                   (ignore-patterns ("*.png" "*.jpg" "*.gif" "*.gif"
                                     "*.PNG" "*.JPG" "*.GIF" "*.GIF" "*.mov" "*.pdf"
                                     "htdocs/ckeditor/*.*" "*.pkb" "*.pks"))
                   (tags-file "~/.emacs.d/.cache/medhome-dev/TAGS")
                   (file-list-cache "~/.emacs.d/.cache/medhome-dev/files")
                   (open-files-cache "~/.emacs.d/.cache/medhome-dev/open-files")
                   (tags-file "~/.emacs.d/.cache/medhome-dev/TAGS")
                   (vcs git)
                   (ack-args "--perl --js --css")
                   (compile-cmd nil)
                   (startup-hook (lambda ()
                                   (setq cperl-indent-level 4))
                                   (make-directory (file-name-directory (expand-file-name mk-proj-file-list-cache)) t)
                                   (make-directory (file-name-directory (expand-file-name mk-proj-open-files-cache)) t)
                                   (make-directory (file-name-directory (expand-file-name mk-proj-tags-file)) t))
                   (shutdown-hook (lambda ()
                                    (setq tags-file-name nil)))))
    (project-def "UACC Development"
                 '((basedir "/sshfs/lithium/web/uacc")
                   (src-patterns ("*.js"  "*.pm" "*.css"))
                   (ignore-patterns ("*.png" "*.jpg" "*.gif" "*.gif"
                                     "*.PNG" "*.JPG" "*.GIF" "*.GIF" "*.mov" "*.pdf"
                                     "htdocs/ckeditor/*.*" "*.pkb" "*.pks"))
                   (tags-file "~/.emacs.d/.cache/uacc-dev/TAGS")
                   (file-list-cache "~/.emacs.d/.cache/uacc-dev/files")
                   (open-files-cache "~/.emacs.d/.cache/uacc-dev/open-files")
                   (tags-file "~/.emacs.d/.cache/uacc-dev/TAGS")
                   (vcs git)
                   (ack-args "--perl --js --css")
                   (compile-cmd nil)
                   (startup-hook (lambda ()
                                   (setq cperl-indent-level 4))
                                   (make-directory (file-name-directory (expand-file-name mk-proj-file-list-cache)) t)
                                   (make-directory (file-name-directory (expand-file-name mk-proj-open-files-cache)) t)
                                   (make-directory (file-name-directory (expand-file-name mk-proj-tags-file)) t))
                   (shutdown-hook (lambda ()
                                    (setq tags-file-name nil)))))
    
    (project-def "UACC Live"
                 '((basedir "/sshfs/housing1/web/uacc")
                   (src-patterns ("*.js"  "*.pm" "*.css"))
                   (ignore-patterns ("*.png" "*.jpg" "*.gif" "*.gif"
                                     "*.PNG" "*.JPG" "*.GIF" "*.GIF" "*.mov" "*.pdf"
                                     "htdocs/ckeditor/*.*" "*.pkb" "*.pks"))
                   (tags-file "~/.emacs.d/.cache/uacc-live/TAGS")
                   (file-list-cache "~/.emacs.d/.cache/uacc-live/files")
                   (open-files-cache "~/.emacs.d/.cache/uacc-live/open-files")
                   (tags-file "~/.emacs.d/.cache/uacc-live/TAGS")
                   (vcs git)
                   (ack-args "--perl --js --css")
                   (compile-cmd nil)
                   (startup-hook (lambda ()
                                   (setq cperl-indent-level 4))
                                   (make-directory (file-name-directory (expand-file-name mk-proj-file-list-cache)) t)
                                   (make-directory (file-name-directory (expand-file-name mk-proj-open-files-cache)) t)
                                   (make-directory (file-name-directory (expand-file-name mk-proj-tags-file)) t))
                   (shutdown-hook (lambda ()
                                    (setq tags-file-name nil)))))

    (project-def "HealthyUNH Development"
                 '((basedir "/sshfs/lithium/web/healthyunh")
                   (src-patterns ("*.js"  "*.pm" "*.css"))
                   (ignore-patterns ("*.png" "*.jpg" "*.gif" "*.gif"
                                     "*.PNG" "*.JPG" "*.GIF" "*.GIF" "*.mov" "*.pdf"
                                     "htdocs/ckeditor/*.*" "*.pkb" "*.pks"))
                   (tags-file "~/.emacs.d/.cache/healthyunh-dev/TAGS")
                   (file-list-cache "~/.emacs.d/.cache/healthyunh-dev/files")
                   (open-files-cache "~/.emacs.d/.cache/healthyunh-dev/open-files")
                   (tags-file "~/.emacs.d/.cache/healthyunh-dev/TAGS")
                   (vcs git)
                   (ack-args "--perl --js --css")
                   (compile-cmd nil)
                   (startup-hook (lambda ()
                                   (setq cperl-indent-level 4))
                                   (make-directory (file-name-directory (expand-file-name mk-proj-file-list-cache)) t)
                                   (make-directory (file-name-directory (expand-file-name mk-proj-open-files-cache)) t)
                                   (make-directory (file-name-directory (expand-file-name mk-proj-tags-file)) t))
                   (shutdown-hook (lambda ()
                                    (setq tags-file-name nil)))))

    (project-def "SpiceCore Development"
                 '((basedir "/sshfs/lithium/web/spicecore")
                   (src-patterns ("*.js"  "*.pm" "*.css"))
                   (ignore-patterns ("*.png" "*.jpg" "*.gif" "*.gif"
                                     "*.PNG" "*.JPG" "*.GIF" "*.GIF" "*.mov" "*.pdf"
                                     "htdocs/ckeditor/*.*" "*.pkb" "*.pks"))
                   (tags-file "~/.emacs.d/.cache/spicecore-dev/TAGS")
                   (file-list-cache "~/.emacs.d/.cache/spicecore-dev/files")
                   (open-files-cache "~/.emacs.d/.cache/spicecore-dev/open-files")
                   (tags-file "~/.emacs.d/.cache/spicecore-dev/TAGS")
                   (vcs git)
                   (ack-args "--perl --js --css")
                   (compile-cmd nil)
                   (startup-hook (lambda ()
                                   (setq cperl-indent-level 4))
                                   (make-directory (file-name-directory (expand-file-name mk-proj-file-list-cache)) t)
                                   (make-directory (file-name-directory (expand-file-name mk-proj-open-files-cache)) t)
                                   (make-directory (file-name-directory (expand-file-name mk-proj-tags-file)) t))
                   (shutdown-hook (lambda ()
                                    (setq tags-file-name nil)))))
    
    (project-def "EOS Development"
                 '((basedir "/sshfs/lithium/web/eos-dev")
                   (src-patterns ("*.js"  "*.pm" "*.css"))
                   (ignore-patterns ("*.png" "*.jpg" "*.gif" "*.gif"
                                     "*.PNG" "*.JPG" "*.GIF" "*.GIF" "*.mov" "*.pdf"
                                     "htdocs/ckeditor/*.*" "*.pkb" "*.pks"))
                   (tags-file "~/.emacs.d/.cache/eos-dev/TAGS")
                   (file-list-cache "~/.emacs.d/.cache/eos-dev/files")
                   (open-files-cache "~/.emacs.d/.cache/eos-dev/open-files")
                   (tags-file "~/.emacs.d/.cache/eos-dev/TAGS")
                   (vcs git)
                   (ack-args "--perl --js --css")
                   (compile-cmd nil)
                   (startup-hook (lambda ()
                                   (setq cperl-indent-level 4))
                                   (make-directory (file-name-directory (expand-file-name mk-proj-file-list-cache)) t)
                                   (make-directory (file-name-directory (expand-file-name mk-proj-open-files-cache)) t)
                                   (make-directory (file-name-directory (expand-file-name mk-proj-tags-file)) t))
                   (shutdown-hook (lambda ()
                                    (setq tags-file-name nil)))
                   ))
    
    (project-def "Housing Development"
                 '((basedir "/sshfs/lithium/web/housing")
                   (src-patterns ("*.js"  "*.pm" "*.css"))
                   (ignore-patterns ("*.png" "*.jpg" "*.gif" "*.gif"
                                     "*.PNG" "*.JPG" "*.GIF" "*.GIF" "*.mov" "*.pdf"
                                     "htdocs/ckeditor/*.*" "*.pkb" "*.pks"))
                   (tags-file "~/.emacs.d/.cache/housing-dev/TAGS")
                   (file-list-cache "~/.emacs.d/.cache/housing-dev/files")
                   (open-files-cache "~/.emacs.d/.cache/housing-dev/open-files")
                   (tags-file "~/.emacs.d/.cache/housing-dev/TAGS")
                   (vcs git)
                   (ack-args "--perl --js --css")
                   (compile-cmd nil)
                   (startup-hook (lambda ()
                                   (make-directory (file-name-directory (expand-file-name mk-proj-file-list-cache)) t)
                                   (make-directory (file-name-directory (expand-file-name mk-proj-open-files-cache)) t)
                                   (make-directory (file-name-directory (expand-file-name mk-proj-tags-file)) t)
                                   (setq cperl-indent-level 4)))
                   (shutdown-hook (lambda ()
                                    (setq tags-file-name nil)))
                   ))

    (project-def "NEC Live"
                 '((basedir "/sshfs/contact/web2/nec")
                   (src-patterns ("*.js *.html *.pm *.css"))
                   (ignore-patterns nil)
                   (file-list-cache "~/.emacs.d/.cache/nec/files")
                   (open-files-cache "~/.emacs.d/.cache/nec/open-files")
                   (tags-file "~/.emacs.d/.cache/nec/TAGS")
                   (vcs git)
                   (ack-args "--perl --js --html --css")
                   (compile-cmd nil)
                   (startup-hook (lambda ()
                                   (make-directory (file-name-directory (expand-file-name mk-proj-file-list-cache)) t)
                                   (make-directory (file-name-directory (expand-file-name mk-proj-open-files-cache)) t)
                                   (make-directory (file-name-directory (expand-file-name mk-proj-tags-file)) t)
                                   (setq cperl-indent-level 4)))
                   (shutdown-hook nil)
                   ))

    (project-def "NEC Development"
                 '((basedir "/sshfs/lithium/web/nec")
                   (src-patterns ("*.js *.html *.pm *.css"))
                   (ignore-patterns nil)
                   (file-list-cache "~/.emacs.d/.cache/nec-dev/files")
                   (open-files-cache "~/.emacs.d/.cache/nec-dev/open-files")
                   (tags-file "~/.emacs.d/.cache/nec-deve/TAGS")
                   (vcs git)
                   (ack-args "--perl --js --html --css")
                   (compile-cmd nil)
                   (startup-hook (lambda ()
                                   (make-directory (file-name-directory (expand-file-name mk-proj-file-list-cache)) t)
                                   (make-directory (file-name-directory (expand-file-name mk-proj-open-files-cache)) t)
                                   (make-directory (file-name-directory (expand-file-name mk-proj-tags-file)) t)
                                   (setq cperl-indent-level 4)))
                   (shutdown-hook nil)))

    (project-def "Housing Preview"
                 '((basedir "/sshfs/myxomatosis/web/housing")
                   (src-patterns ("*.js *.html *.pm *.css"))
                   (ignore-patterns nil)
                   (tags-file nil)
                   (file-list-cache "~/.emacs.d/.cache/housing-pre/files")
                   (open-files-cache "~/.emacs.d/.cache/housing-pre/open-files")
                   (tags-file "~/.emacs.d/.cache/housing-pre/TAGS")
                   (vcs git)
                   (ack-args "--perl --js --html --css")
                   (compile-cmd nil)
                   (startup-hook (lambda ()
                                   (make-directory (file-name-directory (expand-file-name mk-proj-file-list-cache)) t)
                                   (make-directory (file-name-directory (expand-file-name mk-proj-open-files-cache)) t)
                                   (make-directory (file-name-directory (expand-file-name mk-proj-tags-file)) t)
                                   (setq cperl-indent-level 4)))
                   (shutdown-hook nil)))

    (project-def "Obliterase Live"
                 '((basedir "/sshfs/revelator/web/neat-rcc")
                   (src-patterns ("*.js *.html *.pm *.css"))
                   (ignore-patterns nil)
                   (tags-file nil)
                   (file-list-cache "~/.emacs.d/.cache/neat-rcc-live/files")
                   (open-files-cache "~/.emacs.d/.cache/neat-rcc-live/open-files")
                   (tags-file "~/.emacs.d/.cache/neat-rcc-live/TAGS")
                   (vcs git)
                   (ack-args "--perl --js --html --css")
                   (compile-cmd nil)
                   (startup-hook (lambda ()
                                   (make-directory (file-name-directory (expand-file-name mk-proj-file-list-cache)) t)
                                   (make-directory (file-name-directory (expand-file-name mk-proj-open-files-cache)) t)
                                   (make-directory (file-name-directory (expand-file-name mk-proj-tags-file)) t)
                                   (setq cperl-indent-level 4)))
                   (shutdown-hook nil)))

    (project-def "Obliterase Development"
                 '((basedir "/sshfs/lithium/web/neat")
                   (src-patterns ("*.js *.html *.pm *.css"))
                   (ignore-patterns nil)
                   (tags-file nil)
                   (file-list-cache "~/.emacs.d/.cache/neat-dev/files")
                   (open-files-cache "~/.emacs.d/.cache/neat-dev/open-files")
                   (tags-file "~/.emacs.d/.cache/neat-dev/TAGS")
                   (vcs git)
                   (ack-args "--perl --js --html --css")
                   (compile-cmd nil)
                   (startup-hook (lambda ()
                                   ;; (setenv "PERL5LIB"
                                   ;;         (concat
                                   ;;          "/sshfs/lithium/usr/lib/perl5/site_perl/5.8.8/i386-linux-thread-multi/" ":"
                                   ;;          "/sshfs/lithium/usr/lib/perl5/vendor_perl/5.8.8/i386-linux-thread-multi/" ":"
                                   ;;          "/sshfs/lithium/web/neat/perl" ":" 
                                   ;;          "/sshfs/lithium/web/neat/cgi-bin" ":"
                                   ;;          "/sshfs/lithium/web/perl" ":"
                                   ;;          "/sshfs/lithium/web/perl/Lib/Layout2/Core" ":"
                                   ;;          "/sshfs/lithium/web/perl/Lib/Libraries/Html2Pdf"  ":"
                                   ;;          (getenv "PERL5LIB")))
                                   (make-directory (file-name-directory (expand-file-name mk-proj-file-list-cache)) t)
                                   (make-directory (file-name-directory (expand-file-name mk-proj-open-files-cache)) t)
                                   (make-directory (file-name-directory (expand-file-name mk-proj-tags-file)) t)
                                   (setq cperl-indent-level 4))
                   (shutdown-hook nil))))

    (project-def "HCGS Development"
                 '((basedir "/sshfs/lithium/web/hcgs")
                   (src-patterns ("*.js *.html *.pm *.css"))
                   (ignore-patterns nil)
                   (tags-file nil)
                   (file-list-cache "~/.emacs.d/.cache/hcgs-dev/files")
                   (open-files-cache "~/.emacs.d/.cache/hcgs-dev/open-files")
                   (tags-file "~/.emacs.d/.cache/hcgs-dev/TAGS")
                   (vcs git)
                   (ack-args "--perl --js --html --css")
                   (compile-cmd nil)
                   (startup-hook (lambda ()
                                   (make-directory (file-name-directory (expand-file-name mk-proj-file-list-cache)) t)
                                   (make-directory (file-name-directory (expand-file-name mk-proj-open-files-cache)) t)
                                   (make-directory (file-name-directory (expand-file-name mk-proj-tags-file)) t)
                                   (setq cperl-indent-level 4)))
                   (shutdown-hook nil)))

    (project-def "HCGS Preview"
                 '((basedir "/sshfs/myxomatosis/web/hcgs")
                   (src-patterns ("*.js *.html *.pm *.css"))
                   (ignore-patterns nil)
                   (tags-file nil)
                   (file-list-cache "~/.emacs.d/.cache/hcgs-dev/files")
                   (open-files-cache "~/.emacs.d/.cache/hcgs-dev/open-files")
                   (tags-file "~/.emacs.d/.cache/hcgs-dev/TAGS")
                   (vcs git)
                   (ack-args "--perl --js --html --css")
                   (compile-cmd nil)
                   (startup-hook (lambda ()
                                   ;; (setenv "PERL5LIB"
                                   ;;         (concat
                                   ;;          "/sshfs/lithium/usr/lib/perl5/site_perl/5.8.8/i386-linux-thread-multi/" ":"
                                   ;;          "/sshfs/lithium/usr/lib/perl5/vendor_perl/5.8.8/i386-linux-thread-multi/" ":"
                                   ;;          "/sshfs/lithium/web/hcgs/perl" ":" 
                                   ;;          "/sshfs/lithium/web/perl" ":"
                                   ;;          "/sshfs/lithium/web/perl/Lib/Layout2/Core" ":"
                                   ;;          "/sshfs/lithium/web/perl/Lib/Libraries/Html2Pdf"  ":"
                                   ;;          (getenv "PERL5LIB")))
                                   (make-directory (file-name-directory (expand-file-name mk-proj-file-list-cache)) t)
                                   (make-directory (file-name-directory (expand-file-name mk-proj-open-files-cache)) t)
                                   (make-directory (file-name-directory (expand-file-name mk-proj-tags-file)) t)
                                   (setq cperl-indent-level 4))
                   (shutdown-hook nil))))


    (project-def "RCC Development"
                 '((basedir "/sshfs/amnesiac/webdev/rcc")
                   (src-patterns ("*.pm"))
                   (ignore-patterns nil)
                   (tags-file nil)
                   (file-list-cache "~/.emacs.d/.cache/rcc-dev/files")
                   (open-files-cache "~/.emacs.d/.cache/rcc-dev/open-files")
                   (tags-file "~/.emacs.d/.cache/rcc-dev/TAGS")
                   (vcs git)
                   (ack-args "--perl --js --html --css")
                   (compile-cmd nil)
                   (startup-hook (lambda ()
                                   (make-directory (file-name-directory (expand-file-name mk-proj-file-list-cache)) t)
                                   (make-directory (file-name-directory (expand-file-name mk-proj-open-files-cache)) t)
                                   (make-directory (file-name-directory (expand-file-name mk-proj-tags-file)) t)
                                   (setq cperl-indent-level 4)))
                   (shutdown-hook nil)))

    (project-def "Human Factors"
                 '((basedir "/sshfs/velouria/web/humanf")
                   (src-patterns ("*.js *.html *.pm *.css"))
                   (ignore-patterns nil)
                   (tags-file nil)
                   (file-list-cache "~/.emacs.d/.cache/humanf/files")
                   (open-files-cache "~/.emacs.d/.cache/humanf/open-files")
                   (tags-file "~/.emacs.d/.cache/humanf/TAGS")
                   (vcs git)
                   (ack-args "--perl --js --html --css")
                   (compile-cmd nil)
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
                   (ignore-patterns (".backup .cache"))
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

    (project-def "SICP"
                 '((basedir "~/work/SICP/")
                   (src-patterns ("*.scm"))
                   (ignore-patterns nil)
                   (file-list-cache "~/.emacs.d/.cache/SICP/files")
                   (open-files-cache "~/.emacs.d/.cache/SICP/open-files")
                   (tags-file "~/.emacs.d/.cache/SICP/TAGS")
                   (vcs git)
                   (ack-args "--scheme")
                   (compile-cmd nil)
                   (startup-hook (lambda ()
                                   (make-directory (file-name-directory (expand-file-name mk-proj-file-list-cache)) t)
                                   (make-directory (file-name-directory (expand-file-name mk-proj-open-files-cache)) t)
                                   (make-directory (file-name-directory (expand-file-name mk-proj-tags-file)) t)))))
    (project-def "Hemlock Forest"
                 '((basedir "~/HemlockForest/")
                   (src-patterns ("*.rst" "Makefile"))
                   (ignore-patterns nil)
                   (file-list-cache "~/.emacs.d/.cache/hemlockforest/files")
                   (open-files-cache "~/.emacs.d/.cache/hemlockforest/open-files")
                   (tags-file "~/.emacs.d/.cache/hemlockforest/TAGS")
                   (vcs git)
                   (ack-args "--scheme")
                   (compile-cmd nil)
                   (startup-hook (lambda ()
                                   (make-directory (file-name-directory (expand-file-name mk-proj-file-list-cache)) t)
                                   (make-directory (file-name-directory (expand-file-name mk-proj-open-files-cache)) t)
                                   (make-directory (file-name-directory (expand-file-name mk-proj-tags-file)) t)))))

    
    (project-def "NH-ePIP"
                 '((basedir "~/work/nh-epip/")
                   (src-patterns ("*.cs"))
                   (ignore-patterns nil)
                   (file-list-cache "~/.emacs.d/.cache/NH-ePIP/files")
                   (open-files-cache "~/.emacs.d/.cache/NH-ePIP/open-files")
                   (tags-file "~/.emacs.d/.cache/NH-ePIP/TAGS")
                   (vcs git)
                   (ack-args "--csharp")
                   (compile-cmd nil)
                   (startup-hook (lambda ()
                                   (make-directory (file-name-directory (expand-file-name mk-proj-file-list-cache)) t)
                                   (make-directory (file-name-directory (expand-file-name mk-proj-open-files-cache)) t)
                                   (make-directory (file-name-directory (expand-file-name mk-proj-tags-file)) t)))))
    ))


;(provide 'setup_mkproject)

;;; setup_mkproject.el ends here
