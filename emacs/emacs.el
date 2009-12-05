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
(defconst djcb-machine (substring (shell-command-to-string "hostname") 0 -1))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defconst elisp-path '("~/.emacs.d/elisp/")) ;; my elisp directories
(mapcar '(lambda(p)
           (add-to-list 'load-path p) 
           (cd p) (normal-top-level-add-subdirs-to-load-path)) elisp-path)
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
        skk-colortheme.el
        skk-company.el
        skk-custom.el
        skk-flyspell.el
        skk-functions.el
        skk-general.el
        ;skk-gitconfigmode.el
        skk-icicles.el
        skk-makefilemode.el
        skk-python.el
        skk-sql.el
        skk-textmode.el
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
(autoload 'org-mode "skk-org-mode" "org-mode" t)
(autoload 'git-emacs "skk-git" "git-emacs mode" t)
(autoload 'ahg "skk-mercurial" "mercurial" t)
(autoload 'flyspell-mode "skk-flyspell" "flyspell" t)
(autoload 'wl "skk-wanderlust" "wanderlust" t)
;(autoload 'auto-complete-mode "skk-auto-complete" "auto-complete" t)
;(autoload 'company-mode "skk-company" "company" t)
;(autoload 'python-mode "skk-python" "python-mode" t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; change directory to home
(cd "~/")
