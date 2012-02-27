
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; system type
(defconst djcb-win32-p (eq system-type 'windows-nt) "Are we on Windows?")
(defconst djcb-linux-p (or (eq system-type 'gnu/linux) (eq system-type 'linux)
  "Are we running on a GNU/Linux system?"))
(defconst djcb-console-p (eq (symbol-value 'window-system) nil) 
  "Are we in a console?")
(defconst djcb-machine (system-name))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



(require 'cl)				; common lisp goodies, loop

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")


(unless (require 'el-get nil t)
  (url-retrieve "https://raw.github.com/dimitri/el-get/master/el-get-install.el" 
		(lambda (s) 
		  (let (el-get-master-branch) (end-of-buffer) (eval-print-last-sexp)))))

(require 'el-get)
(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get/recipes")

;; now either el-get is `require'd already, or have been `load'ed by the
;; el-get installer.

(setq el-get-sources '(
                       (:name hexrgb :type elpa)
;                       (:name flyspell :type elpa)
                       (:name flymake :type elpa)
;                       (:name bookmark :type emacswiki)
                       (:name tiling :type emacswiki)
                       (:name cursor-chg :type elpa)
                       (:name multi-term :type elpa)
                       (:name mk-project :type emacswiki)
                       (:name icicles :type emacswiki)
                       (:name icicles-mac :type emacswiki)
;                       (:name icicles-face :type emacswiki)
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
                       ;; (:name color-theme-github :type elpa)
                       ;; (:name color-theme-dpaste :type elpa)
                       ;; (:name color-theme-emacs-revert-theme :type elpa)
;                       (:name color-theme-ir-black :type elpa)
                       (:name color-theme-railscasts :type elpa)
                       ;; (:name color-theme-solarized :type elpa)
                       ;; (:name color-theme-tango :type elpa)
                       ;; (:name color-theme-tangotango :type elpa)
                       ;; (:name color-theme-sanityinc-solarized :type elpa)
                       ;; (:name color-theme-actress :type elpa)
                       ;; (:name color-theme-dg :type elpa)
                       ;; (:name color-theme-molokai :type elpa)
                       ;; (:name color-theme-cobalt :type elpa)
                       ;; (:name color-theme-complexity :type elpa)
                       ;; (:name color-theme-wombat :type elpa)
;                       (:name color-theme-subdued :type elpa)
                       (:name color-theme-gruber-darker :type elpa)
                       ;; (:name color-theme-wombat+ :type elpa)
                       ;; (:name color-theme-twilight :type elpa)
                       ;; (:name color-theme-active :type elpa)
                       ;; (:name color-theme-vim-insert-mode :type elpa)
                       (:name charp-mode :type http
                              :url "http://code.google.com/p/csharpmode/source/browse/trunk/csharp-mode.el")
                       (:name mapserver-mode :type http
                              :url "http://www.mobilegeographics.com/mapserver/mapserver-mode.el")
                       ))

(if (string-match "linux" system-configuration)
    (loop for p in '(auctex bbdb magit magithub pylookup wanderlust)
          do (add-to-list 'el-get-sources p)))

(setq my-el-get-packages  
      (append  
'(
   ack
   auto-complete
   auto-complete-clang
   auto-complete-css
   auto-complete-emacs-lisp
   auto-complete-etags
   auto-complete-extension
   auto-complete-yasnippet
;   bookmark+ ; HTTP 503 error
   boxquote
   color-theme
   ;; color-theme-almost-monokai
   ;; color-theme-chocolate-rain
   ;; color-theme-desert
   ;; color-theme-mac-classic
   ;; color-theme-railscasts
   ;; color-theme-sanityinc
   ;; color-theme-solarized
   ;; color-theme-subdued
   ;; color-theme-tango
   ;; color-theme-tango-2
   ;; color-theme-tomorrow
   ;; color-theme-twilight
   ;; color-theme-zen-and-art
   ;color-theme-zenburn
   cperl-mode ; TODO Add :after hook
   crontab-mode
   clevercss
   cmake-mode
   csv
   csv-mode
   dictionary
   edit-server
   egg
   google-maps
   google-weather

   js2-mode ; TODO Added :after hook
   json
   markdown-mode
   notify
   package
   paredit
   point-stack
;   pymacs
   python
   python-mode
   python-pep8
   quack
   rainbow-delimiters
   smart-tab
   tail
   xclip
   zencoding-mode
   yasnippet
   workgroups
)
(mapcar 'el-get-source-name el-get-sources)))

(el-get 'sync my-el-get-packages)

; Added marmalade-repo to package
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
(defconst elisp-path '("~/.emacs.d/elisp/")) ;; my elisp directories
(mapcar '(lambda(p)
           (add-to-list 'load-path p) 
           (cd p) (normal-top-level-add-subdirs-to-load-path)) elisp-path)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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
        skk-eldoc.el
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
        skk-mu4e.el
        skk-org-mode.el
        skk-scheme.el
        skk-perl.el
        ;skk-python.el
        skk-sql.el
        skk-textmode.el
        skk-workgroups.el
        ;skk-wanderlust-folders.el
	;skk-yasnippet.el
))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun load-config (f)
  (load (concat "~/.emacs.d/init/" (symbol-name f))))
(mapcar 'load-config files-to-load)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(autoload 'nxml "skk-xml" "nXml Mode" t)
; http://log4j-mode.sourceforge.net/
(autoload 'log4j-mode "log4j-mode" "Major mode for viewing log files." t)
(add-to-list 'auto-mode-alist '("\\.log\\'" . log4j-mode))


;; (autoload 'js2-mode "js2-mode" nil t)
;; (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
;; (autoload 'espresso-mode "espresso")
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ; http://tychoish.com/rhizome/persistent-emacs-daemons/
;;  (setq-default inhibit-startup-message 't
;;                initial-scratch-message 'nil
;;                save-place t
;;                scroll-bar-mode nil
;;                tool-bar-mode nil
;;                menu-bar-mode nil
;;                scroll-margin 0
;;                indent-tabs-mode nil
;;                flyspell-issue-message-flag 'nil
;;                size-indication-mode t
;;                scroll-conservatively 25
;;                scroll-preserve-screen-position 1
;;                cursor-in-non-selected-windows nil)

;; (setq default-frame-alist '((font-backend . "xft")
;;                              (font . "Inconsolata-10")
;;                              (vertical-scroll-bars . 0)
;;                              (menu-bar-lines . 0)
;;                              (tool-bar-lines . 0)))
;; (tool-bar-mode -1)
;; (scroll-bar-mode -1)
;; (menu-bar-mode 1)
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; change directory to $PWD or ~
(if (getenv "PWD")
    (cd (getenv "PWD"))
  (cd "~"))
