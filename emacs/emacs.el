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
                       ;; (:name color-theme-github :type elpa)
                       ;; (:name color-theme-dpaste :type elpa)
                       ;; (:name color-theme-emacs-revert-theme :type elpa)
		       ;; (:name color-theme-ir-black :type elpa)
                       ;; (:name color-theme-railscasts :type elpa)
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
		       ;; (:name color-theme-subdued :type elpa)
                       ;; (:name color-theme-gruber-darker :type elpa)
                       ;; (:name color-theme-wombat+ :type elpa)
                       ;; (:name color-theme-twilight :type elpa)
                       ;; (:name color-theme-active :type elpa)
                       ;; (:name color-theme-vim-insert-mode :type elpa)
                       (:name jump-char :type git 
                              :url "https://github.com/lewang/jump-char.git")

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

                       (:name csharp-mode :type http
                              :url "http://code.google.com/p/csharpmode/source/browse/trunk/csharp-mode.el")

                       (:name mapserver-mode :type http
                              :url "http://www.mobilegeographics.com/mapserver/mapserver-mode.el")
                       ))

(if (string-match "linux" system-configuration)
    (loop for p in '(auctex wanderlust emacs-w3m) ; magit magithub bbdb
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
   ;cmake-mode
   csv
   hexrgb
   csv-mode
   dictionary
   edit-server
;   egg
   google-maps
   google-weather
   geiser-git
   js2-mode ; TODO Added :after hook
   json
   markdown-mode
   mapserver-mode
   csharp-mode
   ace-jump-mode
   jump-char
   js2-refactor
   mark-multiple
   expand-region
  geiser 
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
   rebox2
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
;        skk-flymake.el
        skk-flyspell.el
        skk-functions.el
        skk-general.el
        ;skk-git.el 
        skk-ibuffer.el
        skk-icicles.el
        skk-ido.el
        skk-js2mode.el
        skk-makefilemode.el
        skk-mk-project.el
;        skk-flymake.el
        skk-mu4e.el
        skk-org-mode.el
        skk-scheme.el
        skk-perl.el
        ;skk-python.el
        skk-sql.el
        skk-textmode.el
        skk-workgroups.el
        ;skk-wanderlust-folders.el
        skk-yasnippet.el
))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun load-config (f)
  (load (concat "~/.emacs.d/init/" (symbol-name f))))
(mapcar 'load-config files-to-load)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (defconst etc-emacs-sitestart-path '("/etc/emacs/site-start.d")) ;; my elisp directories
;; (when (file-exists-p etc-emacs-sitestart-path)
;;  (mapcar '(lambda(p)
;;            (add-to-list 'load-path p) 
;;            (cd p) (normal-top-level-add-subdirs-to-load-path)) etc-emacs-sitestart-path-path))
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(autoload 'nxml "skk-xml" "nXml Mode" t)
; http://log4j-mode.sourceforge.net/
(autoload 'log4j-mode "log4j-mode" "Major mode for viewing log files." t)
(add-to-list 'auto-mode-alist '("\\.log\\'" . log4j-mode))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


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
