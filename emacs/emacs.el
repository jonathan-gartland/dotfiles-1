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


;; Local Variables:
;;   mode: emacs-lisp
;;   mode: allout
;;   outline-regexp: "^;;;_\\([,. ]+\\)"
;; End:

;;; emacs.el ends here

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; system type
(defconst djcb-linux-p (or (eq system-type 'gnu/linux) (eq system-type 'linux)
                           "Are we running on a GNU/Linux system?"))
(defconst djcb-console-p (eq (symbol-value 'window-system) nil) 
  "Are we in a console?")
(defconst djcb-machine (system-name))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(require 'cl)				; common lisp goodies, loop

(defvar *emacs-load-start* (current-time))


(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil t)
  (url-retrieve "https://raw.github.com/dimitri/el-get/master/el-get-install.el" 
                (lambda (s) 
                  (let (el-get-master-branch) (end-of-buffer) (eval-print-last-sexp)))))

(require 'el-get)
(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get/recipes")

;; now either el-get is `require'd already, or have been `load'ed by the
;; el-get installer.
                                        ;(el-get-emacswiki-refresh)
(setq el-get-sources '(
                       (:name hexrgb :type emacswiki)
                                        ;                       (:name flyspell :type elpa)
                       (:name flymake :type elpa)
                                        ;                       (:name bookmark :type emacswiki)
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
                       (:name iy-go-to-char :type elpa)

                       (:name monokai-theme :type elpa)

                       (:name jump-char :type git 
                              :url "https://github.com/lewang/jump-char.git")

                       (:name jshint-mode :type git 
                              :url "https://github.com/daleharvey/jshint-mode.git")

                       ;; (:name emacs-flymake :type git 
                       ;;        :url "https://github.com/illusori/emacs-flymake.git")
                       ;;

                                        ; ace-jump-mode
                       (:name ace-jump-mode :type git 
                              :url "git://github.com/winterTTr/ace-jump-mode.git")

                       ; js2-refactor
                       (:name js2-refactor :type git 
                              :url "https://github.com/magnars/js2-refactor.el.git")
                       
                       ; mark-multiple
                       (:name mark-multiple :type git
                              :url "https://github.com/magnars/mark-multiple.el.git")
                       
                       ; expand-region
                       (:name expand-region :type git
                              :url "git://github.com/magnars/expand-region.el.git")

                       (:name geiser-git :type git
                              :url "git://git.sv.gnu.org/geiser.git")

                       (:name mapserver-mode :type http
                              :url "http://www.mobilegeographics.com/mapserver/mapserver-mode.el")
                       ))

(if (string-match "linux" system-configuration)
    (loop for p in '(auctex emacs-w3m magit slime swank-clojure);  pymacs rope ropemacs
          do (add-to-list 'el-get-sources p)))

(setq my-el-get-packages  
      (append  
       '(
         ; cmake-mode
         ; color-theme-zenburn
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
         calfw
         clevercss
         clojure-mode
         color-theme-solarized
                                        ;color-theme
         cperl-mode ; TODO Add :after hook
         crontab-mode
         csv
         csv-mode
         dictionary
         durendal
         edit-server
         expand-region
         geiser-git
         google-maps
         google-weather
         helm
         hexrgb
         js2-mode ; TODO Added :after hook
         jshint-mode
         js2-refactor
         json
         jump-char
         lusty-explorer
         mapserver-mode
         mark-multiple
         markdown-mode
         monokai-theme
         notify
         package
         paredit
         point-stack
         ;; python
         python-mode
         ;; python-pep8
         quack
         rainbow-delimiters
         rebox2
         smart-tab
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
         tail
         workgroups
         xclip
         yasnippet
         zencoding-mode
         )

       (mapcar 'el-get-source-name el-get-sources)))
(el-get 'sync my-el-get-packages)

(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; require-maybe  (http://www.emacswiki.org/cgi-bin/wiki/LocateLibrary)
;; this is useful when this .emacs is used in an env where not all of the
;; other stuff is available
(defmacro require-maybe (feature &optional file)
  "*Try to require FEATURE, but don't signal an error if `require' fails."
  `(require ,feature ,file 'noerror)) 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; create required directories
(unless (file-directory-p "~/.emacs.d/.cache")
  (make-directory "~/.emacs.d/.cache")) 

(unless (file-directory-p "~/.emacs.d/.backup")
  (make-directory "~/.emacs.d/.backup")) 
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

;;;_. calfw
(use-package calfw-cal)
(use-package calfw-ical)
(use-package calfw
  :config 
  (progn 
    (cfw:open-ical-calendar "https://www.google.com/calendar/ical/02388ju54civ56dklbv8n8tihk%40group.calendar.google.com/private-7937a20b31137f5ab34376f3bfe7b4a0/basic.ics")
    (cfw:open-ical-calendar "https://www.google.com/calendar/ical/stevenknight1980%40gmail.com/private-8016020c8aaedfdd7a86000c09f786e9/basic.ics")))

;;;_. slime
(use-package slime
  slime-mode
  :init 
  (progn
    (autoload 'slime "slime" nil t)
    (slime-setup '(slime-repl))))

;;;_. clojure
(use-package clojure-mode
  :init 
  (progn
    (autoload 'clojure-mode "clojure-mode" nil t)))

;;;_. company-mode
(use-package company-mode
  :init
  (progn
    (setq company-minimum-prefix-length 1)
    (require 'company)
    (require 'company-abbrev)
    (require 'company-css)
    (require 'company-elisp)
    (require 'company-etags)
    (require 'company-ispell)
    (require 'company-files)
    (require 'company-nxml)

    (eval-after-load "company"
      (progn
        (defun indent-or-complete ()
          (interactive)
          (if (looking-at "\\_>")
              (company-complete-common)
            (indent-according-to-mode)))
        
        (setq company-show-numbers nil)
        (dolist (hook (list
                       'emacs-lisp-mode-hook
                       'lisp-mode-hook
                       'lisp-interaction-mode-hook
                       'sh-mode-hook))
          (add-hook hook 'company-mode))))
    ))

;;;_. eldoc
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)
(add-hook 'cperl-mode-hook 'turn-on-eldoc-mode)

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

;;;_. jshint-mode
(use-package jshint-mode
  :config
  '(progn
     (setq jshint-mode-location (expand-file-name "~/dot-files-forest/jshint-mode"))
     (require 'flymake-jshint)
     (add-hook 'javascript-mode-hook
               (lambda () (flymake-mode t)))))

;;;_. ibuffer
(require 'ibuffer) 
(require 'ibuf-ext)

(use-package ibuffer
  :config
  (progn 2
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
                     ))
                   ))))

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
    ))

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

;;;_. mk-project
(use-package mk-project
  :init
  (progn
    (global-set-key (kbd "C-c p c") 'project-compile)
    (global-set-key (kbd "C-c p l") 'project-load)
    (global-set-key (kbd "C-c p a") 'project-ack)
    (global-set-key (kbd "C-c p g") 'project-grep)
    (global-set-key (kbd "C-c p o") 'project-multi-occur)
    (global-set-key (kbd "C-c p u") 'project-unload)
    (global-set-key (kbd "C-c p f") 'project-find-file-ido)
    (global-set-key (kbd "C-c p i") 'project-index)
    (global-set-key (kbd "C-c p s") 'project-status)
    (global-set-key (kbd "C-c p h") 'project-home)
    (global-set-key (kbd "C-c p d") 'project-dired)
    (global-set-key (kbd "C-c p t") 'project-tags))

  :config
  (progn
    (project-def "Housing Development (SSHFS)"
                 '((basedir "/sshfs/lithium/web/housing")
                   (src-patterns ("*.js" " *.html" "*.pm" "*.css"))
                   (ignore-patterns ("*.png" "*.jpg" "*.gif" "*.gif.R"
                                     "*.PNG" "*.JPG" "*.GIF" "*.GIF.R" "*.mov" "*.pdf"
                                     "htdocs/ckeditor/*.*" "*.pkb" "*.pks"))
                   (tags-file "~/.emacs.d/.cache/housing-dev/TAGS")
                   (file-list-cache "~/.emacs.d/.cache/housing-dev/files")
                   (open-files-cache "~/.emacs.d/.cache/housing-dev/open-files")
                   (tags-file "~/.emacs.d/.cache/housing-dev/TAGS")
                   (vcs git)
                   (ack-args "--perl --js --html --css")
                   (compile-cmd nil)
                   (startup-hook (lambda ()
                                        ;                                 (setq flymake-perl-lib-dir "/sshfs/lithium/web/housing/perl")
                                        ;                                 (setq perl-command "/sshfs/lithium/net/home/rcc/skk/dot-files-forest/bin/perl_syntax_checker.pl")
                                   (setq cperl-indent-level 4)))
                   (shutdown-hook (lambda ()
                                    (setq tags-file-name nil)))))

    (project-def "EPSCOR Development (SSHFS)"
                 '((basedir "/sshfs/lithium/web/epscor")
                   (src-patterns ("*.js" " *.html" "*.pm" "*.css"))
                   (ignore-patterns nil)
                   (tags-file "~/.emacs.d/.cache/epscor-dev/TAGS")
                   (file-list-cache "~/.emacs.d/.cache/epscor-dev/files")
                   (open-files-cache "~/.emacs.d/.cache/epscor-dev/open-files")
                   (tags-file "~/.emacs.d/.cache/epscor-dev/TAGS")
                   (vcs git)
                   (ack-args "--perl --js --html --css")
                   (compile-cmd nil)
                   (startup-hook (lambda ()
                                        ;                                 (setq flymake-perl-lib-dir "/sshfs/lithium/web/epscor/perl")
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

;;;_. mu4e
(use-package mu4e
  :init
  (progn 

    (defconst mu4e-path (file-truename "~/local/share/emacs/site-lisp/mu4e/"))

    (if (file-accessible-directory-p mu4e-path)
        (progn
          (add-to-list 'load-path mu4e-path)
          (require 'mu4e)
          ;; happily, below settings are all /optional/

          ;; Only needed if your maildir is _not_ ~/Maildir
          (setq 
           mu4e-maildir "/home/skk/MaildirWork"

           ;; when you want to use some external command for text->html conversion,
           ;; i.e., the 'html2text' program
           mu4e-html2text-command "html2text"
           
           ;; the headers to show in the headers list -- a pair of the field + its
           ;; width, with `nil' meaning 'unlimited' (better only use that for
           ;; the last field. These are the defaults:
           mu4e-headers-fields
           '( (:date          .  25)
              (:flags         .   6)
              (:from          .  22)
              (:subject       .  nil))
           
           ;; program to get mail; alternatives are 'fetchmail', 'getmail'
           ;; isync or your own shellscript. called when 'U' is pressed in
           ;; main view
           mu4e-get-mail-command "offlineimap"

           ;; location of mu binary
           mu4e-mu-binary "/home/skk/local/bin/mu"

           ;; general emacs mail settings; used when composing e-mail
           mu4e-reply-to-address "skk@sr.unh.edu"
           user-mail-address "skk@sr.unh.edu"
           user-full-name  "Steven Knight"

           ;; these must start with a "/", and must exist
           ;; (i.e.. /home/user/Maildir/sent must exist)
           ;; you use e.g. 'mu mkdir' to make the Maildirs if they don't
           ;; already exist

           ;; below are the defaults; if they do not exist yet, mu4e will offer to
           ;; create them
           mu4e-sent-folder   "/Sent"
           mu4e-drafts-folder "/Drafts"
           mu4e-trash-folder  "/Trash")

          ;; sending mail
          (require 'smtpmail)
          (setq message-send-mail-function 'smtpmail-send-it
                starttls-use-gnutls t
                smtpmail-starttls-credentials '(("blackstar.sr.unh.edu" 587 (file-truename "~/.authinfo.gpg") (file-truename "~/.authinfo.gpg")))
                smtpmail-auth-credentials '(("blackstar.sr.unh.edu" 587 "skk@sr.unh.edu" nil))
                smtpmail-default-smtp-server "blackstar.sr.unh.edu"
                smtpmail-smtp-server "blackstar.sr.unh.edu"
                smtpmail-stream-type 'ssl
                smtpmail-smtp-service 587)
          ))

    ;; for the settings for outgoing mail consult the section 'Longer configuration'
    
    ))

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
                                  (company-mode)
                                  (progn
                                    (set-variable 'py-indent-offset 4)
                                    (set-variable 'py-smart-indentation nil)
                                    (set-variable 'indent-tabs-mode nil)
                                    (show-paren-mode 1)
                                    (eldoc-mode 1))))

    (when (load "flymake" t)
      (defun flymake-pychecker-init ()
        (let* ((temp-file (flymake-init-create-temp-buffer-copy
                           'flymake-create-temp-inplace))
               (local-file (file-relative-name
                            temp-file
                            (file-name-directory buffer-file-name))))
          (list "pychecker"  (list local-file))))
      (add-to-list 'flymake-allowed-file-name-masks '("\\.py\\'" flymake-pychecker-init)))
    (add-hook 'find-file-hook 'flymake-find-file-hook)))


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

;;;_. mercurial
(use-package ahg)

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
  :init
  (progn 

                                        ; Initialize Yasnippet
    (yas/initialize)
    (setq yas/use-menu 'abbreviate)

    (yas/global-mode 1)

                                        ;set yas/root-directory as a list, to allow for adding user snippets 
    (setq yas/root-directory '(
                               "~/.emacs.d/snippets"
                               "~/.emacs.d/el-get/yasnippet/snippets"))

    ;; Map `yas/load-directory' to every element
    (mapc 'yas/load-directory yas/root-directory)))

;;;_. add-hook
(add-hook 'emacs-lisp-mode-hook
          '(lambda () 
             (define-key emacs-lisp-mode-map (kbd "C-c C-r") 'eval-region)))

;;;_. git-emacs
(use-package git-emacs)
;;;_. gitconfig-emacs
(use-package gitconfig-mode)

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
;;;_. js2-refactor
(use-package js2-refactor)

;;;_. org-mode
(use-package org-mode
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

;;;_. workgroups
(use-package workgroups
  :init
  (progn
    (workgroups-mode 1)
    (setq wg-switch-on-load nil) ; don't auto switch to the first workgroup 
   (wg-load "~/.emacs.d/.workgroups")))

;;;_. load settings file
(defconst settings-file (file-truename "~/.emacs.d/settings.el"))
(load settings-file)

                                        ; change directory to $PWD or ~
(if (getenv "PWD")
    (cd (getenv "PWD"))
  (cd "~"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bookmark-save-flag nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; Local Variables:
;;   mode: emacs-lisp
;;   mode: allout
;;   outline-regexp: "^;;;_\\([,. ]+\\)"
;; End:
