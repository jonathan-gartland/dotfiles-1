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
    (loop for p in '(auctex wanderlust emacs-w3m magit slime swank-clojure pymacs rope ropemacs)
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
   csharp-mode
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
   js2-refactor
   json
   jump-char
   mapserver-mode
   mark-multiple
   markdown-mode
   monokai-theme
   notify
   package
   paredit
   point-stack
   python
   python-mode
   python-pep8
   quack
   rainbow-delimiters
   rebox2
   smart-tab
   sql
   sql-complete
   sqlplus
   swank-clojure
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
        skk-calfw.el
        skk-clojure.el
        skk-company.el
        skk-custom.el
        skk-eldoc.el
        skk-flymake.el
        ;; skk-flyspell.el
        skk-functions.el
        skk-general.el
        ;; ;skk-git.el 
        skk-ibuffer.el
        skk-icicles.el
        skk-ido.el
        skk-mk-project.el
        skk-mu4e.el
;        skk-sql.el
        skk-perl.el
        ;; ;skk-workgroups.el
        ;; ;skk-wanderlust-folders.el
        ;; skk-yasnippet.el
))

(autoload 'skk-clojure "skk-clojure.el" t)
(add-to-list 'auto-mode-alist '("\\.clj\\'" . clojure-mode))

(autoload 'skk-emacslisp-mode "skk-emacslisp-mode.el" t)
(add-to-list 'auto-mode-alist '("\\.el\\'" . emacs-lisp-mode))

(autoload 'skk-js2mode "skk-js2mode.el" t)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(autoload 'skk-makefilemode "skk-makefilemode.el" t)
(add-to-list 'auto-mode-alist '("\\Makefile\\'" . makefile-mode))

;(autoload 'skk-mu4e "skk-mu4e.el" t)

(autoload 'skk-org-mode "skk-org-mode.el" t)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

(autoload 'skk-scheme "skk-scheme.el" t)
(add-to-list 'auto-mode-alist '("\\.scm\\'" . geiser-install))

;; (autoload 'skk-perl "skk-perl.el" t)
;; (add-to-list 'auto-mode-alist '("\\.pl\\'" . cperl-mode))
;; (add-to-list 'auto-mode-alist '("\\.pm\\'" . cperl-mode))

;; (autoload 'skk-python "skk-python.el" t)
;; (add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))

(autoload 'skk-sql "skk-sql.el" t)

(autoload 'skk-textmode "skk-textmode.el" t)
(add-to-list 'auto-mode-alist '("\\.txt\\'" . text-mode))

(autoload 'skk-yasnippet "skk-yasnippet.el" t)

;; (autoload 'skk-git. "skk-git.el " t)
;; (autoload 'skk-workgroups "skk-workgroups.el" t)
;; (autoload 'skk-wanderlust-folders "skk-wanderlust-folders.el" t)


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

;; rest of your .emacs goes here
(message "My .emacs loaded in %ds" (destructuring-bind (hi lo ms) (current-time)
                           (- (+ hi lo) (+ (first *emacs-load-start*) (second *emacs-load-start*)))))
(switch-to-buffer "*Messages*")
