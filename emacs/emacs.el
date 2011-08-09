                                        ; -*-mode: Emacs-Lisp; outline-minor-mode:t-*- 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; emacs.el file based on http://www.djcbsoftware.nl/dot-emacs.html
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; system type
(defconst djcb-win32-p (eq system-type 'windows-nt) "Are we on Windows?")
(defconst djcb-linux-p (or (eq system-type 'gnu/linux) (eq system-type 'linux))
  "Are we running on a GNU/Linux system?")
(defconst djcb-console-p (eq (symbol-value 'window-system) nil) 
  "Are we in a console?")
(defconst djcb-machine (system-name))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defconst elisp-path '("~/.emacs.d/elisp/")) ;; my elisp directories
(mapcar '(lambda(p)
           (add-to-list 'load-path p) 
           (cd p) (normal-top-level-add-subdirs-to-load-path)) elisp-path)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defconst elpa-path '("~/.emacs.d/elpa/")) ;; my elpa directories
(mapcar '(lambda(p)
           (add-to-list 'load-path p) 
           (cd p) (normal-top-level-add-subdirs-to-load-path)) elpa-path)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; load various module

(setq files-to-load
      '(
        skk-autocomplete.el
        skk-clojure.el
        skk-colortheme.el
        skk-company.el
        skk-custom.el
        skk-emacslisp-mode.el
        skk-flyspell.el
        skk-functions.el
        skk-general.el
        skk-git.el 
        skk-ibuffer.el
        skk-icicles.el
        skk-ido.el
        skk-js2mode.el
        skk-makefilemode.el
        skk-mk-project.el
        skk-org-mode.el
        skk-perl.el
        skk-python.el
        skk-sql.el
        skk-textmode.el
        skk-workgroups.el
        ;skk-wanderlust-folders.el
        skk-yasnippet.el
))

(defun load-config (f)
    (load (concat "~/.emacs.d/init/" (symbol-name f))))
(mapcar 'load-config files-to-load)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; http://www.newartisans.com/2007/10/a-regular-expression-ide-for-emacs.html
(load "regex-tool" t)    ; load regex-tool if it's available
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defconst autoload-path '("~/.emacs.d/autoload/"))
(mapcar '(lambda(p)
           (add-to-list 'load-path p) 
           (cd p) (normal-top-level-add-subdirs-to-load-path)) autoload-path)

; Idea from http://andreasjacobsen.com/2009/01/07/elisp-best-practices/
(autoload 'ack "skk-ack" "grep replacement" t)
(autoload 'c-sharp "skk-c-sharp" "C# Mode" t)
(autoload 'nxml "skk-xml" "nXml Mode" t)
;(autoload 'org-mode "skk-org-mode" "org mode" t)
(autoload 'ahg "skk-mercurial" "mercurial" t)
(autoload 'flyspell-mode "skk-flyspell" "flyspell" t)
(autoload 'wl "skk-wanderlust" "wanderlust" t)
;(autoload 'auto-complete-mode "skk-auto-complete" "auto-complete" t)
;(autoload 'python-mode "skk-python" "python-mode" t)
(autoload 'company-mode "company" nil t)

; http://log4j-mode.sourceforge.net/
(autoload 'log4j-mode "log4j-mode" "Major mode for viewing log files." t)
(add-to-list 'auto-mode-alist '("\\.log\\'" . log4j-mode))

; http://www.emacswiki.org/emacs/CsvMode
(add-to-list 'auto-mode-alist '("\\.[Cc][Ss][Vv]\\'" . csv-mode))
(autoload 'csv-mode "csv-mode" "Major mode for editing comma-separated value files." t)

; http://www.mobilegeographics.com/mapserver/mapserver-mode.el
(autoload 'mapserver-mode "mapserver-mode" "Mode for editing UMN MapServer files." t)
(add-to-list 'auto-mode-alist '("\\.map\\'" . mapserver-mode))

; js2-mode
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(autoload 'espresso-mode "espresso")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; enable midnight mode
(require 'midnight)
(add-to-list 'clean-buffer-list-kill-buffer-names
             "*Pymacs*"
             "trace.log")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ; open user-init-file on startup
;; (add-hook 'emacs-startup-hook (lambda () (find-file-noselect user-init-file)))
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; change directory to $PWD or ~
(if (getenv "PWD")
    (cd (getenv "PWD"))
  (cd "~"))

(eval-after-load "sql"
  '(load-library "sql-indent"))

