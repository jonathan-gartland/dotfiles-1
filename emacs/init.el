;;;_. Initialization

(setq message-log-max 16384)


(defconst emacs-start-time (current-time))
(defconst use-package-dir (expand-file-name "~/dot-files-forest/use-package"))
(add-to-list 'load-path use-package-dir)

(require 'use-package)
(require 'bind-key)

(eval-when-compile
  (setq use-package-verbose (null byte-compile-current-file)))

;;;_. Post initialization

(when window-system
  (let ((elapsed (float-time (time-subtract (current-time)
                                            emacs-start-time))))
    (message "Loading %s...done (%.3fs)" load-file-name elapsed))

  (add-hook 'after-init-hook
            `(lambda ()
               (let ((elapsed (float-time (time-subtract (current-time)
                                                         emacs-start-time))))
                 (message "Loading %s...done (%.3fs) [after-init]"
                          ,load-file-name elapsed)))
            t))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(add-to-list 'custom-theme-load-path "~/.emacs.d/el-get/color-theme-solarized")
;(load-theme 'tango-dark)
;(load-theme 'solarized-light t)
;(load-theme 'solarized-dark t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;_. Packages

;;;_ , el-get


(use-package el-get
  :disabled t
  :commands (el-get
             el-get-install
             el-get-update
             el-get-list-packages)
  :init
  (defvar el-get-sources nil)

  :config
  (defun el-get-read-status-file ()
    (mapcar #'(lambda (entry)
                (cons (plist-get entry :symbol)
                      `(status "installed" recipe ,entry)))
            el-get-sources))

  (defalias 'el-get-init 'ignore
    "Don't use el-get for making packages available for use."))

(setq el-get-verbose t)

;; Local Variables:
;;   mode: emacs-lisp
;;   mode: allout
;;   outline-regexp: "^;;;_\\([,. ]+\\)"
;; End:

;;; emacs.el ends here


(require 'cl)				; common lisp goodies, loop


(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil t)
  (url-retrieve "https://raw.github.com/dimitri/el-get/master/el-get-install.el" 
                (lambda (s) 
                  (let (el-get-master-branch) (end-of-buffer) (eval-print-last-sexp)))))

(require 'el-get)
(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get/recipes")
(add-to-list 'el-get-recipe-path "~/.emacs.d/vendor/el-get-recipes")

;; now either el-get is `require'd already, or have been `load'ed by the
;; el-get installer.
                                        ;(el-get-emacswiki-refresh)
(setq el-get-sources '(
                       (:name hexrgb :type emacswiki)
                       ; (:name flyspell :type elpa)
                       (:name flymake :type elpa)
                       ; (:name bookmark :type emacswiki)
                       (:name tiling :type emacswiki)
                       (:name cursor-chg :type elpa)
                       (:name multi-term :type elpa)
                       (:name mk-project :type emacswiki)
                       (:name icicles :type emacswiki)
                       (:name icicles-mac :type emacswiki)
                       (:name icicles-face :type emacswiki)
                       (:name icicles-opt :type emacswiki)
                       (:name icicles-var :type emacswiki)
                       (:name icicles-fn :type emacswiki)
                       (:name icicles-mcmd :type emacswiki)
                       (:name icicles-cmd1 :type emacswiki)
                       (:name icicles-cmd2 :type emacswiki)
                       (:name icicles-doc1 :type emacswiki)
                       (:name icicles-doc2 :type emacswiki)
                       (:name icicles-mode :type emacswiki)
                       (:name lacarte :type emacswiki)
                       (:name hl-line+ :type emacswiki)
                       (:name minimap :type emacswiki)
                       (:name pysmell :type elpa)
                       (:name company :type elpa)
                       (:name shell-pop :type emacswiki)
                       (:name guru-mode :type elpa)
                       (:name iy-go-to-char :type elpa)
                       (:name monokai-theme :type elpa)
                       (:name nrepl :type elpa)

                       ; js2-refactor
                       (:name js2-refactor :type git 
                              :url "https://github.com/magnars/js2-refactor.el.git")
                       
                       (:name mapserver-mode :type http
                              :url "http://www.mobilegeographics.com/mapserver/mapserver-mode.el")

                       ))

(if (string-match "linux" system-configuration)
    (loop for p in '(auctex emacs-w3m magit swank-clojure);  pymacs rope ropemacs slime swank-clojure
          do (add-to-list 'el-get-sources p)))

(setq my-el-get-packages  
      (append  
       '(
         ; cmake-mode
         ; bookmark+ ; HTTP 503 error
         ; egg
         ; pymacs
         ace-jump-mode
         ack
         auto-complete
         auto-complete-css
         auto-complete-emacs-lisp
         auto-complete-etags
         auto-complete-extension
         auto-complete-yasnippet
         autopair
         bookmark+
         bookmark+-1
         bookmark+-bmu
         bookmark+-doc
         bookmark+-key
         bookmark+-mac
         bookmark+-lit
         boxquote
         breadcrumb
         calfw
         clevercss
         clojure-mode
         cperl-mode
         crontab-mode
         csv
         csv-mode
         dtrt-indent
         dictionary
         durendal
         edit-server
         expand-region
         emeteo
         ;git-emacs
         ;gitconfig-mode
         geiser
         google-maps
         google-weather
         guru-mode
         helm
         hexrgb
         js2-mode ; TODO Added :after hook
         jshint-mode
         js2-refactor
         json
         jump-char
         lusty-explorer
         key-chord
         offlineimap
         mapserver-mode
         mark-multiple
         markdown-mode
         monokai-theme
         mu4e ; this includes mu4e
         nrepl
         notify
         package
         paredit
         point-stack
;         powerline2
         ;; python
         python-mode
         ;; python-pep8
         quack
         rainbow-delimiters
;         redo
         rebox2
         rect-mark
         sinburn-theme
         smart-tab
         smex
         sql
         sql-complete
         sqlplus
         swank-clojure
         sunrise-commander
         sunrise-x-checkpoints
         sunrise-x-loop
         sunrise-x-mirror
         sunrise-x-modeline
         sunrise-x-tree
         tomorrow-night-paradise-theme
         tail
         xclip
         yasnippet
         whole-line-or-region
         zencoding-mode
         workgroups)    
       (mapcar 'el-get-source-name el-get-sources)))

(el-get 'sync my-el-get-packages)

(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defconst emacsd-cache-dir (expand-file-name "~/.emacs.d/.cache"))
(defconst emacsd-backup-dir (expand-file-name "~/.emacs.d/.backup"))
(defconst emacsd-image-dired-dir (expand-file-name "~/.emacs.d/.cache/image-dired"))

;; create required directories
(unless (file-directory-p emacsd-image-dired-dir)
  (make-directory emacsd-image-dired-dir)) 

(unless (file-directory-p emacsd-backup-dir)
  (make-directory emacsd-backup-dir)) 

(unless (file-directory-p emacsd-image-dired-dir)
  (make-directory emacsd-image-dired-dir)) 

(setq image-dired-dir emacsd-image-dired-dir)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defconst vendor-load-path '("~/.emacs.d/vendor/")) ;; my elisp directories
(mapcar '(lambda(p)
           (add-to-list 'load-path p) 
           (cd p) (normal-top-level-add-subdirs-to-load-path)) vendor-load-path)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;_. auto-complete
(use-package auto-complete-config
  :init 
  (progn
    (add-to-list 'load-path "~/.emacs.d/el-get/auto-complete")
    (require 'auto-complete-config)
    (ac-config-default)
    (setq ac-comphist-file  "~/.emacs.d/.cache/ac-comphist.dat")))

;; ;;;_. calfw
;; (use-package calfw-cal)
;; (use-package calfw-ical)
;; (use-package calfw
;;   :config 
;;   (progn 
;;     (cfw:open-ical-calendar "https://www.google.com/calendar/ical/02388ju54civ56dklbv8n8tihk%40group.calendar.google.com/private-7937a20b31137f5ab34376f3bfe7b4a0/basic.ics")
;;     (cfw:open-ical-calendar "https://www.google.com/calendar/ical/stevenknight1980%40gmail.com/private-8016020c8aaedfdd7a86000c09f786e9/basic.ics")))

;; ;;;_. slime
;; (use-package slime
;;   slime-mode
;;   :init 
;;   (progn
;;     (autoload 'slime "slime" nil t)
;;     (slime-setup '(slime-repl))))

;;;_. clojure
(use-package clojure-mode
  :init 
  (progn
    (autoload 'clojure-mode "clojure-mode" nil t)))

;; ;;;_. company-mode
;; (use-package company-mode
;;   :init
;;   (progn
;;     (setq company-minimum-prefix-length 1)
;;     (require 'company)
;;     (require 'company-abbrev)
;;     (require 'company-css)
;;     (require 'company-elisp)
;;     (require 'company-etags)
;;     (require 'company-ispell)
;;     (require 'company-files)
;;     (require 'company-nxml)

;;     (eval-after-load "company"
;;       (progn
;;         (defun indent-or-complete ()
;;           (interactive)
;;           (if (looking-at "\\_>")
;;               (company-complete-common)
;;             (indent-according-to-mode)))
        
;;         (setq company-show-numbers nil)
;;         (dolist (hook (list
;;                        'emacs-lisp-mode-hook
;;                        'lisp-mode-hook
;;                        'lisp-interaction-mode-hook
;;                        'sh-mode-hook))
;;           (add-hook hook 'company-mode))))
;;     ))

;;;_. eldoc
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)
(add-hook 'cperl-mode-hook 'turn-on-eldoc-mode)
(add-hook 'sepai-mode-hook 'turn-on-eldoc-mode)

;;;_. flymake-mode
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
    (add-hook 'javascript-mode-hook
              (lambda () (flymake-mode t)))))

;;;_. guru-mode
(use-package guru-mode)
(add-hook 'prog-mode-hook (lambda () (guru-mode +1)))

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
                    (filename . "~work/SICP"))
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
                     ))))))))

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

;;;_. hexrgb
(use-package hexrgb)

;;;_. hl-line+
(use-package hl-line+
  :init 
  (progn
    (toggle-hl-line-when-idle 1)))

;;;_. icicles
(use-package icicles
  :init
  (progn
    (icy-mode 1)))

;;;_. lacarte
(use-package lacarte
  :config
  (progn
    (global-set-key [?\M-`] 'lacarte-execute-menu-command)))


(use-package lusty-explorer)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; http://emacsrocks.com/e10.html

;; Push mark when using ido-imenu
(defvar push-mark-before-goto-char nil)

(defadvice goto-char (before push-mark-first activate)
  (when push-mark-before-goto-char
    (push-mark)))

; https://gist.github.com/2360578
(defun ido-imenu ()
  "Update the imenu index and then use ido to select a symbol to navigate to.
Symbols matching the text at point are put first in the completion list."
  (interactive)
  (imenu--make-index-alist)
  (let ((name-and-pos '())
        (symbol-names '()))
    (flet ((addsymbols (symbol-list)
                       (when (listp symbol-list)
                         (dolist (symbol symbol-list)
                           (let ((name nil) (position nil))
                             (cond
                              ((and (listp symbol) (imenu--subalist-p symbol))
                               (addsymbols symbol))

                              ((listp symbol)
                               (setq name (car symbol))
                               (setq position (cdr symbol)))

                              ((stringp symbol)
                               (setq name symbol)
                               (setq position (get-text-property 1 'org-imenu-marker symbol))))

                             (unless (or (null position) (null name))
                               (add-to-list 'symbol-names name)
                               (add-to-list 'name-and-pos (cons name position))))))))
      (addsymbols imenu--index-alist))
    ;; If there are matching symbols at point, put them at the beginning of `symbol-names'.
    (let ((symbol-at-point (thing-at-point 'symbol)))
      (when symbol-at-point
        (let* ((regexp (concat (regexp-quote symbol-at-point) "$"))
               (matching-symbols (delq nil (mapcar (lambda (symbol)
                                                     (if (string-match regexp symbol) symbol))
                                                   symbol-names))))
          (when matching-symbols
            (sort matching-symbols (lambda (a b) (> (length a) (length b))))
            (mapc (lambda (symbol) (setq symbol-names (cons symbol (delete symbol symbol-names))))
                  matching-symbols)))))
    (let* ((selected-symbol (ido-completing-read "Symbol? " symbol-names))
           (position (cdr (assoc selected-symbol name-and-pos))))
      (goto-char position))))

(defun ido-imenu-push-mark ()
  (interactive)
  (let ((push-mark-before-goto-char t))
    (imenu-update-menubar)
    (ido-imenu)))


;;;_. ido
(use-package ido
  :init
  (progn
    (bind-key "C-x C-i" 'ido-imenu)
    (setq ido-create-new-buffer (quote never))
    (setq ido-enable-flex-matching t)
    (setq ido-enable-last-directory-history nil)
    (setq ido-enable-regexp nil)
    (setq ido-max-directory-size 300000)
    (setq ido-max-file-prompt-width 0.1)
    (setq ido-use-filename-at-point (quote guess))
    (setq ido-use-url-at-point t)
    (setq ido-use-virtual-buffers t)
    ;; enable fuzzy matching
    (setq ido-enable-flex-matching t)
    ))

(use-package sepia
  :init
  (progn 

    (defconst sepia-path (file-truename "~/.emacs.d/vendor/Sepia-0.992_01"))
    (add-to-list 'load-path sepia-path)
    (setq sepia-perl5lib (list (expand-file-name (concat sepia-path "/lib"))))
    (defalias 'perl-mode 'sepia-mode)

    (defvar electrify-return-match
      "[\]}\)\"]"
      "If this regexp matches the text after the cursor, do an \"electric\"
  return.")
    

    (defun electrify-return-if-match (arg)
      "If the text after the cursor matches `electrify-return-match' then
  open and indent an empty line between the cursor and the text.  Move the
  cursor to the new line."
      (interactive "P")
      (let ((case-fold-search nil))
        (if (looking-at electrify-return-match)
            (save-excursion (newline-and-indent)))
        (newline arg)
        (indent-according-to-mode)))

    ;; Using local-set-key in a mode-hook is a better idea.
    (global-set-key (kbd "RET") 'electrify-return-if-match)


    (setq cperl-indent-level 4)

    (defun cperl-indent4 ()
      (setq cperl-indent-level 4))

    (defun cperl-indent2 ()
      (setq cperl-indent-level 2))

    (defun my-cperl-eldoc-documentation-function ()
      "Return meaningful doc string for `eldoc-mode'."
      (car
       (let ((cperl-message-on-help-error nil))
         (cperl-get-help)))))

  :config
  (progn
    (set (make-local-variable 'eldoc-documentation-function)
         'my-cperl-eldoc-documentation-function)
    (turn-on-eldoc-mode)
    (local-set-key (kbd "RET") 'electrify-return-if-match)
    (eldoc-add-command 'electrify-return-if-match)
    (show-paren-mode t)))


;;;_. key-chord
(use-package key-chord
  :init
  (progn
    (key-chord-define sepia-mode-map ";;" "\C-e;")))


;;;_. mk-project
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
                   (shutdown-hook nil)
                   ))
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
                                   (setq flymake-perl-lib-dir "/sshfs/lithium/web/eos-dev/perl")
                                   (setq perl-command "/sshfs/lithium/net/home/rcc/skk/dot-files-forest/bin/perl_syntax_checker.pl")
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
                                   (setq flymake-perl-lib-dir "/sshfs/lithium/web/housing/perl")
                                   (setq perl-command "/sshfs/lithium/net/home/rcc/skk/dot-files-forest/bin/perl_syntax_checker.pl")
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
                                   (make-directory (file-name-directory (expand-file-name mk-proj-tags-file)) t)))

                   ))

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
                                   (make-directory (file-name-directory (expand-file-name mk-proj-tags-file)) t)))
                   ))
    ))
;;;_. mu, mu4e
(use-package mu4e
  :init
  (progn 
    (visual-line-mode)

    ;; Only needed if your maildir is _not_ ~/Maildir
    (setq 
     mu4e-maildir "/home/skk/Maildir"
     
     ; set mu4e as mail-user-agent
     mail-user-agent 'mu4e-user-agent
     
     mu4e-update-interval 30

     ;; when you want to use some external command for text->html conversion,
     ;; i.e., the 'html2text' program
     mu4e-html2text-command "html2text"
     
     ;; the headers to show in the headers list -- a pair of the field + its
     ;; width, with `nil' meaning 'unlimited' (better only use that for
     ;; the last field. These are the defaults:
     mu4e-headers-fields
     '( (:date          .  25)
        (:flags         .   5)
        (:from          .  20)
        (:to             . 20)
        (:subject       .  nil))
     
     ;; program to get mail; alternatives are 'fetchmail', 'getmail'
     ;; isync or your own shellscript. called when 'U' is pressed in
     ;; main view
     mu4e-get-mail-command "true"

     ;; enable verbose/debug 
     mu4e-debug t
     
     message-send-mail-function 'message-send-mail-with-sendmail

     message-citation-line-format "On %a, %b %d %Y %p at %R, %N wrote:"

     message-citation-line-function (quote message-insert-formatted-citation-line)

     ;; general emacs mail settings; used when composing e-mail
     mu4e-reply-to-address "skk@sr.unh.edu"
     user-mail-address "skk@sr.unh.edu"
     user-full-name  "Steven Knight"

     ;; below are the defaults; if they do not exist yet, mu4e will offer to
     ;; create them
     mu4e-sent-folder   "/Sent"
     mu4e-drafts-folder "/Drafts"
     mu4e-trash-folder  "/Trash")
    
    (setq mu4e-bookmarks (list))

    (add-to-list 'mu4e-bookmarks
                 '("flag:unread AND NOT maildir:'/Sent' AND NOT flag:trashed AND NOT maildir:'/Spam' AND NOT maildir:'/Junk'"
                   "Unread messages" ?u))
    (add-to-list 'mu4e-bookmarks
                 '("date:today..now AND NOT maildir:'/Sent' AND NOT flag:trashed AND NOT maildir:'/Junk' AND NOT maildir:'/Spam' AND NOT maildir:'/Trash'"
                   "Today's messages" ?t))
    (add-to-list 'mu4e-bookmarks
                 '("date:7d..now AND NOT maildir:'/Sent' AND NOT flag:trashed AND NOT maildir:'/Junk' AND NOT maildir:'/Spam' AND NOT maildir:'/Trash'"
                   "Last 7 days"?w))
    (add-to-list 'mu4e-bookmarks '("flag:unread" "Unread messages (ALL)" ?U))
    (add-to-list 'mu4e-bookmarks '("date:today..now" "Today's messages (ALL)" ?T))
    (add-to-list 'mu4e-bookmarks '("date:7d..now" "Last 7 days (ALL)" ?W))
    (global-set-key [XF86Mail] 'mu4e))
  
  )

;;;_. sqlplus
(use-package sqlplus)

;;;_. sql
(use-package sql)

;;;_. linum
(use-package linum
  :init
  (progn
    ; enable display of line-numbers to left of buffer,
    ; update linum's format
    (setq linum-format "%d ") 
    (global-linum-mode 1)))


;;;_. python
(use-package python-mode
 :mode ("\\.py$" . python-mode)
  :interpreter ("python" . python-mode)
  :init
  (progn
    ;; ; pymacs
    ;; (require 'pymacs)
    ;; (autoload 'pymacs-load "pymacs" nil t)
    ;; (autoload 'pymacs-eval "pymacs" nil t)
    ;; (autoload 'pymacs-apply "pymacs")
    ;; (autoload 'pymacs-call "pymacs")

    ;; ;; Initialize Rope
    ;; (pymacs-load "ropemacs" "rope-")
    ;; (setq ropemacs-enable-autoimport t)
    ;; (setq ropemacs-guess-project t)

    ;; Initialize company-mode
    (add-hook 'python-mode-hook (lambda () 
                                  (progn
                                    ;(company-mode)
                                    (set-variable 'py-indent-offset 4)
                                    (set-variable 'py-smart-indentation nil)
                                    (set-variable 'indent-tabs-mode nil)
                                    (show-paren-mode 1)
                                    (eldoc-mode 1))))

    ;(when (load "flymake" t)
    ;  (defun flymake-pychecker-init ()
    ;    (let* ((temp-file (flymake-init-create-temp-buffer-copy
    ;                       'flymake-create-temp-inplace))
    ;           (local-file (file-relative-name
    ;                        temp-file
    ;                        (file-name-directory buffer-file-name))))
    ;      (list "pychecker"  (list local-file))))
    ;  (add-to-list 'flymake-allowed-file-name-masks '("\\.py\\'" flymake-pychecker-init)))
    ;(add-hook 'find-file-hook 'flymake-find-file-hook)
    ))

;;;_. ack
(use-package ack)

;;;_. c#
(use-package csharp-mode
  :init
  (progn
    (setq auto-mode-alist
          (append '(("\\.cs$" . csharp-mode)) auto-mode-alist))
    ))

;;;_. flyspell
(use-package flyspell
  :init
  (progn
    (defun turn-on-flyspell ()
      "Force flyspell-mode on using a positive argument. For use in hooks."
      (interactive)
      (flyspell-mode 1))

    (when (eq system-type "gnu/linux")
      (add-hook 'c++-mode-common-hook 'turn-on-flyspell)
      (add-hook 'c++-mode-hook 'turn-on-flyspell)
      (add-hook 'c-mode-common-hook 'turn-on-flyspell  )
      (add-hook 'emacs-lisp-mode-hook 'turn-on-flyspell)
      (add-hook 'fundamental-mode-hook 'turn-on-flyspell)
      (add-hook 'message-mode-hook 'turn-on-flyspell)
      (add-hook 'python-mode-hook 'turn-on-flyspell)
      (add-hook 'text-mode-hook 'turn-on-flyspell))))

;;;_. rst
; http://docutils.sourceforge.net/docs/user/emacs.html
(use-package rst
  :init
  (progn
    (setq auto-mode-alist
          (append '(("\\.txt$" . rst-mode)
                    ("\\.rst$" . rst-mode)
                    ("\\.rest$" . rst-mode)) auto-mode-alist))))

;;;_. nxml
(use-package nxml-mode
  :init
  (progn
    (add-to-list 'auto-mode-alist '("\\.xml$" . nxml-mode))
    (add-to-list 'auto-mode-alist '("\\.jsp$" . nxml-mode))))

;;;_. yasnippet
(use-package yasnippet
  :conf
  (progn 
    ; Initialize Yasnippet
    (yas/initialize)
    (setq yas/use-menu 'abbreviate)

    (yas/global-mode 1)

    ; set yas/root-directory as a list, to allow for adding user snippets 
    (setq yas/root-directory '(
                               "~/.emacs.d/snippets"
                               "~/.emacs.d/el-get/yasnippet/snippets"))

    ;; Map `yas/load-directory' to every element
    (mapc 'yas/load-directory yas/root-directory)))

;;;_. add-hook
(add-hook 'emacs-lisp-mode-hook
          '(lambda () 
             (define-key emacs-lisp-mode-map (kbd "C-c C-r") 'eval-region)))

;;;_. breadcrumb
(use-package breadcrumb
    :init (progn
            (bind-key "M-o"       'bc-set)            ;; Shift-SPACE for set bookmark
            (bind-key "M-j"       'bc-previous)       ;; M-j for jump to previous
            (bind-key "S-M-j"     'bc-next)           ;; Shift-M-j for jump to next
            (bind-key "M-<up>"    'bc-local-previous) ;; M-up-arrow for local previous
            (bind-key "M-<down>"  'bc-local-next)     ;; M-down-arrow for local next
            (bind-key "C-c j"     'bc-goto-current)   ;; C-c j for jump to current bookmark
            (bind-key "C-x M-j"   'bc-list)           ;; C-x M-j for the bookmark menu list
            ))
;;;_. js2
(use-package js2-mode
  :init
  (progn
    ; These three functions came from http://mihai.bazon.net/projects/editing-javascript-with-emacs-js2-mode.
    (defun skk-js2-indent-function ()
      (interactive)
      (save-restriction
        (widen)
        (let* ((inhibit-point-motion-hooks t)
               (parse-status (save-excursion (syntax-ppss (point-at-bol))))
               (offset (- (current-column) (current-indentation)))
               (indentation (espresso--proper-indentation parse-status))
               node)

          (save-excursion

            ;; I like to indent case and labels to half of the tab width
            (back-to-indentation)
            (if (looking-at "case\\s-")
                (setq indentation (+ indentation (/ espresso-indent-level 2))))

            ;; consecutive declarations in a var statement are nice if
            ;; properly aligned, i.e:
            ;;
            ;; var foo = "bar",
            ;;     bar = "foo";
            (setq node (js2-node-at-point))
            (when (and node
                       (= js2-NAME (js2-node-type node))
                       (= js2-VAR (js2-node-type (js2-node-parent node))))
              (setq indentation (+ 4 indentation))))

          (indent-line-to indentation)
          (when (> offset 0) (forward-char offset)))))


    (defun skk-indent-sexp ()
      (interactive)
      (save-restriction
        (save-excursion
          (widen)
          (let* ((inhibit-point-motion-hooks t)
                 (parse-status (syntax-ppss (point)))
                 (beg (nth 1 parse-status))
                 (end-marker (make-marker))
                 (end (progn (goto-char beg) (forward-list) (point)))
                 (ovl (make-overlay beg end)))
            (set-marker end-marker end)
            (overlay-put ovl 'face 'highlight)
            (goto-char beg)
            (while (< (point) (marker-position end-marker))
              ;; don't reindent blank lines so we don't set the "buffer
              ;; modified" property for nothing
              (beginning-of-line)
              (unless (looking-at "\\s-*$")
                (indent-according-to-mode))
              (forward-line))
            (run-with-timer 0.5 nil '(lambda(ovl)
                                       (delete-overlay ovl)) ovl)))))


    (defun skk-js2-mode-hook ()
      (require 'espresso)
      (setq js2-basic-offset 4)
      (setq espresso-indent-level 4
            indent-tabs-mode nil
            c-basic-offset 4)
      (c-toggle-auto-state 0)
      (c-toggle-hungry-state 1)
      (set (make-local-variable 'indent-line-function) 'skk-js2-indent-function)
      (define-key js2-mode-map [(meta control |)] 'cperl-lineup)
      (define-key js2-mode-map [(meta control \;)] 
        '(lambda()
           (interactive)
           (insert "/* -----[ ")
           (save-excursion
             (insert " ]----- */"))
           ))
      (define-key js2-mode-map [(return)] 'newline-and-indent)
      (define-key js2-mode-map [(backspace)] 'c-electric-backspace)
      (define-key js2-mode-map [(control d)] 'c-electric-delete-forward)
      (define-key js2-mode-map [(control meta q)] 'skk-indent-sexp)
      (if (featurep 'js2-highlight-vars)
          (js2-highlight-vars-mode))
      (message "SKK JS2 hook"))

    (add-hook 'js2-mode-hook 'skk-js2-mode-hook)


    (setq-default js2-allow-rhino-new-expr-initializer nil)
    (setq-default js2-auto-indent-p nil)
    (setq-default js2-enter-indents-newline nil)
    (setq-default js2-global-externs '("module" "require" "jQuery" "$" "_" "buster" "sinon" "assert" "refute" "setTimeout" "clearTimeout" "setInterval" "clearInterval" "location" "__dirname"))
    (setq-default js2-idle-timer-delay 0.1)
    (setq-default js2-indent-on-enter-key nil)
    (setq-default js2-mirror-mode nil)
    (setq-default js2-strict-inconsistent-return-warning nil)
    (setq-default js2-auto-indent-p t)
    (setq-default js2-rebind-eol-bol-keys nil)
    (setq-default js2-include-rhino-externs nil)
    (setq-default js2-include-gears-externs nil)

                                        ;(require 'js2-mode)

    (define-key js2-mode-map (kbd "C-c RET jt") 'jump-to-test-file)
    (define-key js2-mode-map (kbd "C-c RET ot") 'jump-to-test-file-other-window)
    (define-key js2-mode-map (kbd "C-c RET js") 'jump-to-source-file)
    (define-key js2-mode-map (kbd "C-c RET os") 'jump-to-source-file-other-window)
    (define-key js2-mode-map (kbd "C-c RET jo") 'jump-between-source-and-test-files)
    (define-key js2-mode-map (kbd "C-c RET oo") 'jump-between-source-and-test-files-other-window)

    (defun js2-hide-test-functions ()
      (interactive)
      (save-excursion
        (goto-char (point-min))
        (ignore-errors
          (while (re-search-forward "\"[^\"]+\": function (")
            (js2-mode-hide-element)))))

    (define-key js2-mode-map (kbd "C-c t") 'js2-hide-test-functions)

    ;; js2-mode steals TAB, let's steal it back for yasnippet
    (defun js2-tab-properly ()
      (interactive)
      (let ((yas/fallback-behavior 'return-nil))
        (unless (yas/expand)
          (indent-for-tab-command)
          (if (looking-back "^\s*")
              (back-to-indentation)))))

    (define-key js2-mode-map (kbd "TAB") 'js2-tab-properly)

    ;; Use lambda for anonymous functions
    (font-lock-add-keywords
     'js2-mode `(("\\(function\\) *("
                  (0 (progn (compose-region (match-beginning 1)
                                            (match-end 1) "\u0192")
                            nil)))))

    ;; Use right arrow for return in one-line functions
    (font-lock-add-keywords
     'js2-mode `(("function *([^)]*) *{ *\\(return\\) "
                  (0 (progn (compose-region (match-beginning 1)
                                            (match-end 1) "\u2190")
                            nil)))))))
;; ;;;_. powerline
;; (use-package powerline
;;   :init (progn
;;           (powerline-default)))

;;;_. js2-refactor
(use-package js2-refactor)

;;;_. org-mode
(use-package org
  :init
  (progn
    ; org-mode http://orgmode.org/org.html
    (add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
    (setq org-log-done 'time)
    ; Set to the location of your Org files on your local system
    (setq org-directory "~/Projects/EPSCOR")
    ;; Set to the name of the file where new notes will be stored
    (setq org-mobile-inbox-for-pull "~/Projects/EPSCOR/flagged.org")
    ;; Set to <your Dropbox root directory>/MobileOrg.
    (setq org-mobile-directory "~/Dropbox/MobileOrg")))


;;;_. scheme
(use-package geiser)


;;;_. makefile-mode-hook
(add-hook 'makefile-mode-hook
          (lambda ()
            (setq show-trailing-whitespace t)))

;;;_. text-mode-hook
(add-hook 'text-mode-hook
          (lambda ()
            (interactive)
            (set-fill-column 78)                    ; lines are 78 chars long ...         
            (auto-fill-mode t)                      ; ... and wrapped around automagically
            ; (set-input-method "latin-1-prefix")     ; make " + e => ë etc.
            ; do the intelligent wrapping of lines
            (use-package filladapt
              :init (filladapt-mode t))))

;;;_. expand-region
(use-package expand-region
  :init
  (progn
    (bind-key "C-=" 'er/expand-region)))

;;;_. whole-line-or-region
(use-package whole-line-or-region)

;;;_. which-func
(which-function-mode t)
(eval-after-load "which-func"
  '(add-to-list 'which-func-modes 'sepia-mode))

;;;_. iy-go-to-char
(use-package iy-go-to-char
     :init 
     (progn
       (bind-key "M-m" 'jump-char-forward)
       (bind-key "M-M" 'jump-char-backward)))

(setq emacs-program-name "emacs")
(setq emacs-program-version 'emacs-version)

(setq emeteo-data-sources
      '((portsmouth_nh
         :region-path (america us portsmouth)
         :uri "http://weather.noaa.gov/pub/data/observations/metar/decoded/KPSM.TXT"
         :fetch-chain default
         :temp-unit fahrenheit
         :temp-unit-string "°F"
         :name "Portsmouth NH USA"
         :shortname "Portsmouth")))

(use-package emeteo)
(use-package emeteo-modeline)
(emeteo-modeline)


;;;_. Smart M-x
(use-package smex
  :init
  (progn
    (setq smex-save-file (expand-file-name "~/.emacs.d/.cache/smex-items"))
    (bind-key "M-x" 'smex)
    (bind-key "M-X" 'smex-major-mode-commands)
    (bind-key "C-c C-c M-x" 'smex-major-mode-commands)))

;; ;; ;;;_. workgroups
; TODO: Loading of workgroups is current broken :(
;; (use-package workgroups
;;   :init
;;   (progn
;;     (workgroups-mode 1)
;;     (setq wg-prefix-key (kbd "C-c w"))
;;     (setq wg-switch-on-load nil) ; don't auto switch to the first workgroup 
;;     (wg-load "~/.emacs.d/.cache/workgroups")))

;;;_. desktop-save-mode
;(setq desktop-path "~/.emacs.d/.cache/")
;(desktop-save-mode 1)

;;;_. tabber, pair-mode
;(use-package tabber)
;(use-package pair-mode)

;;;_. rect-mark
(use-package rect-mark
  :init
  (progn
    (bind-key "C-x r C-SPC" 'rm-set-mark)
    (bind-key "C-x r C-x" 'rm-exchange-point-and-mark)
    (bind-key "C-x r C-w" 'rm-kill-region)
    (bind-key "C-x r M-w" 'rm-kill-ring-save)

    (autoload 'rm-set-mark "rect-mark"
      "Set mark for rectangle." t)
    (autoload 'rm-exchange-point-and-mark "rect-mark"
      "Exchange point and mark for rectangle." t)
    (autoload 'rm-kill-region "rect-mark"
      "Kill a rectangular region and save it in the kill ring." t)
    (autoload 'rm-kill-ring-save "rect-mark"
      "Copy a rectangular region to the kill ring." t)))


;;;_. redo
;(use-package redo)

;;;_. dtrt-indent
;; http://git.savannah.gnu.org/gitweb/?p=dtrt-indent.git;a=blob_plain;f=dtrt-indent.el;hb=HEAD
(use-package dtrt-indent
  :init
  (dtrt-indent-mode 1))

;;;_. uniquify
; http://emacs-fu.blogspot.com/2009/11/making-buffer-names-unique.html
(use-package uniquify
  :init
  (progn
    (setq 
     uniquify-buffer-name-style 'post-forward
     uniquify-separator ":")))


;;;_. auto-insert
; http://www.emacswiki.org/emacs/AutoInsertMode
(use-package autoinsert
  :init
  (progn
    (auto-insert-mode 1)  ;;; Adds hook to find-files-hook
    (add-hook 'find-file-hook 'auto-insert)
    (setq auto-insert-directory "~/.emacs.d/templates/") ;;; Or use custom, *NOTE* Trailing slash important
    (setq auto-insert-query nil) ;;; If you don't want to be prompted before insertion
    (define-auto-insert "\.py" "template.py")
    (define-auto-insert "\.pm" "template.pm")))

; http://emacs-fu.blogspot.com/2009/11/copying-lines-without-selecting-them.html
(defadvice kill-ring-save (before slick-copy activate compile) "When called
  interactively with no active region, copy a single line instead."
  (interactive (if mark-active (list (region-beginning) (region-end)) (message
  "Copied line") (list (line-beginning-position) (line-beginning-position
  2)))))

(defadvice kill-region (before slick-cut activate compile)
  "When called interactively with no active region, kill a single line instead."
  (interactive
    (if mark-active (list (region-beginning) (region-end))
      (list (line-beginning-position)
        (line-beginning-position 2)))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun byte-recompile-emacsd ()
  "Byte-compilete all files in ~/.emacs.d"
  (byte-recompile-directory '~/.emacs.d' 0 t))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Highlight mark
; http://lists.gnu.org/archive/html/help-gnu-emacs/2003-11/msg00328.html
; nice mark - shows mark as a highlighted 'cursor' so user 'always' 
; sees where the mark is. Especially nice for killing a region.
(defvar pg-mark-overlay nil
  "Overlay to show the position where the mark is") 
(make-variable-buffer-local 'pg-mark-overlay)

(put 'pg-mark-mark 'face 'secondary-selection)

(defvar pg-mark-old-position nil
  "The position the mark was at. To be able to compare with the
current position")

(defun pg-show-mark () 
  "Display an overlay where the mark is at. Should be hooked into 
activate-mark-hook" 
  (unless pg-mark-overlay 
    (setq pg-mark-overlay (make-overlay 0 0))
    (overlay-put pg-mark-overlay 'category 'pg-mark-mark))
  (let ((here (mark t)))
    (when here
      (move-overlay pg-mark-overlay here (1+ here)))))

(defadvice  exchange-point-and-mark (after pg-mark-exchange-point-and-mark)
  "Show visual marker"
  (pg-show-mark))

(ad-activate 'exchange-point-and-mark)
(add-hook 'activate-mark-hook 'pg-show-mark)

;;;_. multi-term
; http://www.emacswiki.org/emacs/MultiTerm
(use-package multi-term
  :init 
  (setq multi-term-program "/bin/bash"))

;;;_. shell-pop
; http://www.emacswiki.org/emacs/ShellPop 
(use-package shell-pop
  :init (progn
          (shell-pop-set-internal-mode "multi-term")
          (shell-pop-set-internal-mode-shell "/bin/bash")
          (bind-key "<F-8>" 'shell-pop)))


;;;_. lusty explorer

; http://www.emacswiki.org/emacs/LustyExplorer
(use-package lusty-explorer
  :init 
  (progn
    (bind-key "C-x C-f" 'lusty-file-explorer)
    (bind-key "C-x b" 'lusty-buffer-explorer)))
  ;; overrride the normal file-opening, buffer switching
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun tab-width-two ()
  (setq default-tab-width 2)            ; set tab-width
  (setq-default tab-stop-list (list 2 4 6 8 10 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40 42 44 46 48 50 52 54 56 58 60 62 64 66 68 70 72 74 76 78 80 82 84 86 88 90 92 94 96 98 100 102 104 106 108))
  (setq-default indent-tabs-mode nil))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; http://floss.zoomquiet.org/data/20110326155829/index.html
(use-package point-stack
  :init
  (progn
    (global-set-key '[(f5)] 'point-stack-push)
    (global-set-key '[(f6)] 'point-stack-pop)
    (global-set-key '[(f7)] 'point-stack-forward-stack-pop)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; http://emacs-fu.blogspot.com/2011/01/setting-frame-title.html
(setq frame-title-format
  '("" invocation-name ": "(:eval (if (buffer-file-name)
                (abbreviate-file-name (buffer-file-name))
                  "%b"))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; http://www.masteringemacs.org/articles/2011/01/27/find-files-faster-recent-files-package/
(require 'recentf)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
;; recent files                                                                  

(defun ido-recentf-open ()
  "Use `ido-completing-read' to \\[find-file] a recent file"
  (interactive)
  (if (find-file (ido-completing-read "Find recent file: " recentf-list))
      (message "Opening file...")
    (message "Aborting")))

(use-package recentf
  :init
  (progn
    (bind-key "C-x C-r" 'ido-recentf-open)
    (setq recentf-save-file "~/.emacs.d/.cache/recent-files"
          recentf-max-saved-items 500                                            
          recentf-max-menu-items 60)
    (recentf-mode t)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; http://www.emacswiki.org/emacs/ZenCoding
(use-package zencoding-mode
  :init
  (progn
    (add-hook 'sgml-mode-hook 'zencoding-mode) ;; Auto-start on any markup modes
    (add-hook 'cperl-mode-hook 'zencoding-mode) ;; Auto-start on any markup modes
    ))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(bind-key "C-x C-;" 'comment-region)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; http://emacs-fu.blogspot.com/2011/05/toward-balanced-and-colorful-delimiters.html
(use-package rainbow-delimiters
  :init
  (progn
    (add-hook 'cperl-mode-hook  'rainbow-delimiters-mode)
    (add-hook 'lisp-mode-hook 'rainbow-delimiters-mode)
    (add-hook 'python-mode-hook 'rainbow-delimiters-mode)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; http://www.emacswiki.org/emacs/ImenuMode
(defun try-to-add-imenu ()
  (condition-case nil (imenu-add-to-menubar "Imenu") (error nil)))

(add-hook 'cperl-mode-hook 'try-to-add-imenu)
(add-hook 'python-mode-hook 'try-to-add-imenu)
(add-hook 'lisp-mode-hook 'try-to-add-imenu)
(add-hook 'js2-mode-hook 'try-to-add-imenu)

(bind-key "C-c =" 'imenu)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; http://me.in-berlin.de/~myrkr/dictionary/
(use-package dictionary 
    :init
    (progn
      (load "dictionary-init")
      (bind-key "\C-cs" 'dictionary-search)
      (bind-key "\C-cm" 'dictionary-match-words)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; bookmarks
; http://www.nongnu.org/bm/
(setq bm-restore-repository-on-load t)
(require 'bm)
(global-set-key (kbd "<M-f2>") 'bm-toggle)
(global-set-key (kbd "<f2>")   'bm-next)
(global-set-key (kbd "<S-f2>") 'bm-previous)
 
;; make bookmarks persistent as default
(setq-default bm-buffer-persistence t)
 
;; Loading the repository from file when on start up.
(add-hook' after-init-hook 'bm-repository-load)
 
;; Restoring bookmarks when on file find.
(add-hook 'find-file-hooks 'bm-buffer-restore)
 
;; Saving bookmark data on killing a buffer
(add-hook 'kill-buffer-hook 'bm-buffer-save)

;; Allow cross-buffer 'next'
(setq bm-cycle-all-buffers t)
 
;; Saving the repository to file when on exit.
;; kill-buffer-hook is not called when emacs is killed, so we
;; must save all bookmarks first.
(add-hook 'kill-emacs-hook '(lambda nil
                              (bm-buffer-save-all)
                              (bm-repository-save)))

; http://www.emacswiki.org/emacs/bm-ext.el
; (require 'bm-ext)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;http://www.emacswiki.org/emacs/tiling.el
(use-package tiling
  :init
  (progn
    ;; Windows related operations
    ;; Split & Resize
    (bind-key "C-x |" 'split-window-horizontally)
    (bind-key "C-x _" 'split-window-vertically)
    (bind-key "C-{" 'shrink-window-horizontally)
    (bind-key "C-}" 'enlarge-window-horizontally)
    (bind-key "C-^" 'enlarge-window-verticially)
    ;; Navgating: Windmove uses C-<up> etc.
    (bind-key "C-<up>" '  windmove-up)
    (bind-key "C-<down>" 'windmove-down)
    (bind-key "C-<right>" 'windmove-right)
    (bind-key "C-<left>" 'windmove-left)
    ;; Swap buffers: M-<up> etc.
    (bind-key "M-<up>" '  buf-move-up)
    (bind-key "M-<down>" 'buf-move-down)
    (bind-key "M-<right>" 'buf-move-right)
    (bind-key "M-<left>" 'buf-move-left)
    ;; Tile
    (bind-key "C-\\" 'tiling-cycle) ; accepts prefix number
    (bind-key "C-M-<up>" 'tiling-tile-up)
    (bind-key "C-M-<down>" 'tiling-tile-down)
    (bind-key "C-M-<right>" 'tiling-tile-right)
    (bind-key "C-M-<left>" 'tiling-tile-left)))

;;;_. paredit
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; http://www.emacswiki.org/emacs/ParEdit
(use-package paredit
  :init
  (progn
    (add-hook 'emacs-lisp-mode-hook       (lambda () (paredit-mode +1)))
    (add-hook 'lisp-mode-hook             (lambda () (paredit-mode +1)))
    (add-hook 'lisp-interaction-mode-hook (lambda () (paredit-mode +1)))
    (add-hook 'slime-repl-mode-hook (lambda () (paredit-mode +1)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; http://www.emacswiki.org/emacs/rebox2
(use-package rebox2
  :init
  (progn
    (bind-key "M-q" 'rebox-dwim)
    (bind-key "S-M-q" 'rebox-cycle)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; http://blog.gabrielsaldana.org/easy-css-editing-with-emacs/
; CSS and Rainbow modes 
(defun all-css-modes() (css-mode) (rainbow-mode)) 

;; Load both major and minor modes in one call based on file type 
(add-to-list 'auto-mode-alist '("\\.css$" . all-css-modes)) 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; http://www.emacswiki.org/emacs/ModeCompile
 ;;mode-compile
(use-package mode-compile
  :init
  (progn
    (bind-key "\C-cc" 'mode-compile)
    (bind-key "\C-ck" 'mode-compile-kill)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defconst show-local-info-path (file-truename "~/local/share/info"))
(if (file-accessible-directory-p show-local-info-path)
    (add-to-list 'Info-default-directory-list show-local-info-path))

;;;_. Emacs Rocks

;;;_. Emacs Rocks 04
; http://www.emacswiki.org/emacs/IyGoToChar
; iy-go-to-char - like f in Vim
(use-package jump-char
  :init
  (progn
    (bind-key "M-m" 'jump-char-forward)
    (bind-key "M-M" 'jump-char-backward)

    ;; Remap old M-m to M-i (better mnemonic for back-to-indentation)
    ;; We lose tab-to-tab-stop, which is no big loss in my use cases.
    (bind-key "M-i" 'back-to-indentation)))

;;;_. Emacs Rocks 04
;; Expand region (increases selected region by semantic units)
(use-package expand-region
  :init
  (progn
    (bind-key "M-'" 'er/expand-region)))

;;;_. Emacs Rocks 10
; http://www.emacswiki.org/emacs/AceJump
(require 'ace-jump-mode)
(bind-key "<C-c space>" 'ace-jump-mode)

;; Push mark when using ido-imenu

(defvar push-mark-before-goto-char nil)

(defadvice goto-char (before push-mark-first activate)
  (when push-mark-before-goto-char
    (push-mark)))

(defun add-hyper-char-to-ace-jump-word-mode (c)
  (define-key global-map
    (read-kbd-macro (concat "H-" (string c)))
    `(lambda ()
       (interactive)
       (setq ace-jump-query-char ,c)
       (setq ace-jump-current-mode 'ace-jump-word-mode)
       (ace-jump-do (concat "\\b"
                            (regexp-quote (make-string 1 ,c)))))))

(loop for c from ?0 to ?9 do (add-hyper-char-to-ace-jump-word-mode c))
(loop for c from ?A to ?Z do (add-hyper-char-to-ace-jump-word-mode c))
(loop for c from ?a to ?z do (add-hyper-char-to-ace-jump-word-mode c))
(loop for c from ?Å to ?ø do (add-hyper-char-to-ace-jump-word-mode c))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; remove emacs' ability to interactive with git.  This was done because accessing remote git repo through sshfs caused major lag. 
(delete 'Git vc-handled-backends)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; http://blog.printf.net/articles/tag/emacs
(defun find-tag-at-point ()
  "*Find tag whose name contains TAGNAME.
  Identical to `find-tag' but does not prompt for 
  tag when called interactively;  instead, uses 
  tag around or before point."
    (interactive)
      (find-tag (if current-prefix-arg
                    (find-tag-tag "Find tag: "))
                (find-tag (find-tag-default))))
(bind-key "<F-9>" 'find-tag-at-point)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; bookmarks http://www.gnu.org/software/emacs/manual/html_node/emacs/Bookmarks.html
; bookarmks+ http://www.emacswiki.org/emacs/BookmarkPlus
(use-package bookmark+
  :init
  (progn
    (bookmark-save-flag 1)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;_. load general settings

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; the modeline
(line-number-mode t)                     ; show line numbers
(column-number-mode t)                   ; show column numbers
(when (fboundp size-indication-mode)      
  (size-indication-mode t))              ; show file size (emacs 22+)
(display-time-mode 1)                    ; don't show the time
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; general settings
(menu-bar-mode t)                       ; don't show the menu 
(tool-bar-mode)                       ; don't show the toolbar
(icomplete-mode t)                       ; completion in minibuffer
(setq icomplete-prospects-height 2)      ; don't spam my minibuffer
(scroll-bar-mode nil)              
(set-scroll-bar-mode 'right)
(defalias 'yes-or-no-p 'y-or-n-p)        ; allow y for yes, n for no

(when (fboundp 'set-fringe-mode)         ; emacs22+ 
  (set-fringe-mode 1))                   ; space left of col1 in pixels

(transient-mark-mode t)                  ; make the current 'selection' visible
(delete-selection-mode t)                ; delete the selection with a keypress
(setq x-select-enable-clipboard t)       ; copy-paste should work ...
(setq interprogram-paste-function        ; ...with...
  'x-cut-buffer-or-selection-value)      ; ...other X clients

(setq search-highlight t                 ; highlight when searching... 
  query-replace-highlight t)             ; ...and replacing
(fset 'yes-or-no-p 'y-or-n-p)            ; enable y/n answers to yes/no 

(global-font-lock-mode t)                ; always do syntax highlighting 
;(when (require-maybe 'jit-lock)          ; enable JIT to make font-lock faster
;  (setq jit-lock-stealth-time 1))        ; new with emacs21

(set-language-environment "UTF-8")       ; prefer utf-8 for language settings
(set-input-method nil)                   ; no funky input for normal editing;

(setq completion-ignore-case t           ; ignore case when completing...
  read-file-name-completion-ignore-case t) ; ...filenames too

(put 'narrow-to-region 'disabled nil)    ; enable...
(put 'erase-buffer 'disabled nil)        ; ... useful things
(when (fboundp file-name-shadow-mode)    ; emacs22+
  (file-name-shadow-mode 1))             ; be smart about filenames in minbuffer

(setq inhibit-startup-message t         ; don't show ...    
      inhibit-startup-echo-area-message t) ; ... startup messages

(setq save-place-file "~/.emacs.d/.cache/saveplace") ;; keep my ~/ clean
(setq-default save-place t)                   ;; activate it for all buffers
(require 'saveplace)                          ;; get the package

(setq savehist-additional-variables    ;; also save...
        '(search-ring regexp-search-ring)    ;; ... my search entries
          savehist-file "~/.emacs.d/.cache/savehist") ;; keep my home clean
(savehist-mode t)                      ;; do customization before activate
(setq default-tab-width 4)            ; set tab-width
(setq-default tab-stop-list (list 4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108))
(setq-default indent-tabs-mode nil)

;; disabled that damm bell !
(setq bell-volume 0)
(setq sound-alist nil)
(setq ring-bell-function 'ignore)
(setq visible-bell t)


(setq auto-save-list-file-prefix "~/.emacs.d/.cache/auto-save-list/")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; cursor
(blink-cursor-mode 0)           ; don't blink cursor

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; File cache http://www.emacswiki.org/cgi-bin/wiki/FileNameCache
;; (eval-after-load
;;   "filecache"
;;   '(progn
;;      (message "Loading file cache...")
;;      (file-cache-add-directory "~/")
;;      (file-cache-add-directory-list (list "~/src" "~/" "~/work"))))
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; bookmarks
(setq bookmark-default-file "~/.emacs.d/.cache/bookmarks")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; set default font

(setq font-use-system-font t)

; windows
(if (string-match "windows" system-configuration)
 (set-default-font
   "-outline-Consolas-normal-r-normal-normal-*-*-*-*-*-*-*-*"))

; linux
(if (string-match "linux" system-configuration)
    (set-default-font "Anonymous Pro 10"))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; show-paren-mode
;; show a subtle blinking of the matching paren (the defaults are ugly)
;; http://www.emacswiki.org/cgi-bin/wiki/ShowParenMode
(when (fboundp 'show-paren-mode)
  (show-paren-mode t)
  (setq show-paren-style 'parenthesis))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  abbrevs (emacs will automagically expand abbreviations)
(setq abbrev-file-name                ; tell emacs where to read abbrev
      "~/.emacs.d/abbrev_defs.el")    ; definitions from...
(abbrev-mode t)                       ; enable abbrevs (abbreviations) ...
(setq default-abbrev-mode t
  save-abbrevs t)                     ; don't ask
(when (file-exists-p abbrev-file-name)
  (quietly-read-abbrev-file))         ;  don't tell
(add-hook 'kill-emacs-hook            ; write when ...
  'write-abbrev-file)                 ; ... exiting emacs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; backups  (emacs will write backups and number them)
(setq make-backup-files t ; do make backups
  backup-by-copying t ; and copy them ...
  backup-directory-alist '(("." . "~/.emacs.d/.backup/")) ; ... here
  version-control t
  kept-new-versions 2
  kept-old-versions 5
  delete-old-versions t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; time-stamps 
;; when there is a "Time-stamp: <>" in the first 10 lines of the file,
;; emacs will write time-stamp information there when saving the file.
(setq 
  time-stamp-active t          ; do enable time-stamps
  time-stamp-line-limit 10     ; check first 10 buffer lines for Time-stamp: <>
  time-stamp-format "%04y-%02m-%02d %02H:%02M:%02S (%u)") ; date format
(add-hook 'write-file-hooks 'time-stamp) ; update when saving
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; tramp, for remote access
(setq tramp-default-method "ssh"
      tramp-persistency-file-name "~/.emacs.d/.cache/tramp"
      tramp-verbose 10)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; safe locals; we mark these as 'safe', so emacs22+ won't give us annoying 
;; warnings
(setq safe-local-variable-values 
      (quote ((auto-recompile . t) 
              (outline-minor-mode . t) 
              auto-recompile outline-minor-mode)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; enable autopair mode
(autopair-global-mode)


;;;_. load custom-file
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

; switch to ~
(cd "~")

; http://ergoemacs.org/emacs/organize_your_dot_emacs.html
(defun byte-compile-current-buffer ()
  "`byte-compile' current buffer if it's emacs-lisp-mode and compiled file exists."
  (interactive)
  (when (and (eq major-mode 'emacs-lisp-mode)
             (file-exists-p (byte-compile-dest-file buffer-file-name)))
    (byte-compile-file buffer-file-name)))

(add-hook 'after-save-hook 'byte-compile-current-buffer)

;; Local Variables:
;;   mode: emacs-lisp
;;   mode: allout
;;   outline-regexp: "^;;;_\\([,. ]+\\)"
;; End:
