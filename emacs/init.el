;; Turn off mouse interface early in startup to avoid momentary display
;; (if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
;; (if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
;; (if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; No splash screen please ... jeez
(setq inhibit-startup-message t)
(setq is-mac (equal system-type 'darwin))
(setq is-linux (equal system-type 'gnu/linux))
(setq is-windows-nt (equal system-type 'windows-nt))

; TODO replace with function/macro
(defconst emacsd-cache-dir (expand-file-name "~/.emacs.d/.cache/"))
(defconst emacsd-backup-dir (expand-file-name "~/.emacs.d/.backup/"))
(defconst emacsd-image-dired-dir (expand-file-name "~/.emacs.d/.cache/image-dired"))

;; create required directories
(unless (file-directory-p emacsd-cache-dir)
  (make-directory emacsd-cache-dir)) 

(unless (file-directory-p emacsd-backup-dir)
  (make-directory emacsd-backup-dir)) 

(unless (file-directory-p emacsd-image-dired-dir)
  (make-directory emacsd-image-dired-dir)) 

(setq image-dired-dir emacsd-image-dired-dir)


;; Set up load path
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(add-to-list 'load-path user-emacs-directory)
(add-to-list 'load-path (expand-file-name "~/dot-files-forest/use-package"))
(require 'use-package)
(require 'bind-key)
(defun sacha/package-install (package &optional repository)
  "Install PACKAGE if it has not yet been installed.
If REPOSITORY is specified, use that."
  (unless (package-installed-p package)
    (let ((package-archives (if repository
                                (list (assoc repository package-archives))
                              package-archives)))
    (package-install package))))
;; (use-package el-get
;;   :disabled t
;;   :commands (el-get
;;              ;; el-get-install
;;              ;; el-get-update
;;              ;; el-get-list-packages
;;              )
;;   :init
;;   (defvar el-get-sources nil)

;;   :config
;;   (defun el-get-read-status-file ()
;;     (mapcar #'(lambda (entry)
;;                 (cons (plist-get entry :symbol)
;;                       `(status "installed" recipe ,entry)))
;;             el-get-sources))

;;   (defalias 'el-get-init 'ignore
;;     "Don't use el-get for making packages available for use."))


; common lisp goodies, loop
(require 'cl)			

;; (unless (require 'el-get nil t)
;;    (url-retrieve "https://raw.github.com/dimitri/el-get/master/el-get-install.el" 
;;                  (lambda (s) 
;;                    (let (el-get-master-branch) (end-of-buffer) (eval-print-last-sexp)))))

;; (setq el-get-verbose t)
;; (require 'el-get)
;; (add-to-list 'el-get-recipe-path "~/.emacs.d/el-get/recipes")
;; (add-to-list 'el-get-recipe-path "~/.emacs.d/vendor/el-get-recipes")

;; now either el-get is `require'd already, or have been `load'ed by the
;; el-get installer.

;(el-get-emacswiki-refresh)

;; (setq el-get-sources '(
;; 		       (:name bookmark-plus :type github :pkgname "emacsmirror/bookmark-plus")
;;                        ;; (:name icicles :type emacswiki)
;;                        ;; (:name icicles-mac :type emacswiki)
;;                        ;; (:name icicles-face :type emacswiki)
;;                        ;; (:name icicles-opt :type emacswiki)
;;                        ;; (:name icicles-var :type emacswiki)
;;                        ;; (:name icicles-fn :type emacswiki)
;;                        ;; (:name icicles-mcmd :type emacswiki)
;;                        ;; (:name icicles-cmd1 :type emacswiki)
;;                        ;; (:name icicles-cmd2 :type emacswiki)
;;                        ;; (:name icicles-doc1 :type emacswiki)
;;                        ;; (:name icicles-doc2 :type emacswiki)
;;                        ;; (:name icicles-mode :type emacswiki)
;; ))

;; (if (string-match "linux" system-configuration)
;;     (loop for p in '(emacs-w3m magit swank-clojure) ;auctex pymacs rope ropemacs slime swank-clojure
;;           do (add-to-list 'el-get-sources p)))

;; (setq my-el-get-packages  
;;       (append  
;;        '(
;;          ace-jump-mode
;;          ack
;;          auto-complete
;;          auto-complete-css
;;          auto-complete-emacs-lisp
;;          auto-complete-etags
;;          auto-complete-extension
;;          auto-complete-yasnippet
;;          autopair
;;          base16-theme
;;          bookmark-plus
;;          ;; bookmark+-1
;;          ;; bookmark+-bmu
;;          ;; bookmark+-doc
;;          ;; bookmark+-key
;;          ;; bookmark+-mac
;;          ;; bookmark+-lit
;;          boxquote
;;          buffer-move
;;          ; breadcrumb
;;          calfw
;;          clevercss
;;          clojure-mode
;;          cperl-mode
;;          ;crontab-mode
;;          coffee-mode
;;          color-theme-solarized
;; ;         company
;;          csv
;;          csv-mode
;;          dtrt-indent
;; ;         dictionary
;; ;         dict
;;          durendal
;;          ;edit-server
;;          expand-region
;;          fill-column-indicator
;;          flymake-perlcritic
;;          flymake-cursor
;;          ;git-emacs
;;          ;gitconfig-mode
;;          ;git-modeline
;;          geiser
;; ;         google-maps
;; ;         google-weather
;;          haskell-mode
;;          helm
;;          hexview-mode
;; ;         hexrgb
;;          hide-region
;;          hl-line+
;;          idomenu
;;          js2-mode
;;          jshint-mode
;;          ;js2-refactorr 
;;          json
;;          jump-char        
;;          lua-mode
;;          lusty-explorer
;;          key-chord
;;          offlineimap
;;          mapserver-mode
;;          mark-multiple
;;          markdown-mode
;;          multiple-cursors
;;          multi-term
;;          shell-pop
;;          mk-project
;;          mu4e
;;          ;newsticker-notify
;;          nrepl
;;          notify
;;          ;org-mode
;;          package
;;          paredit
;;          point-stack
;; ;         powerline2
;; ;         python
;; ;         python-mode
;;          python_mode_fgallina
;;          pretty-symbols-mode
;;          pomodoro
;; ;; python-pep8
;;          quack
;;          rainbow-delimiters
;;          rainbow-mode
;; ;         redo
;;          rebox2
;;          rect-mark
;;          sinburn-theme
;;          smart-tab
;;          smex
;;          sql
;;          sql-complete
;;          sqlplus
;;          smooth-scrolling
;;          swank-clojure
;;          sunrise-commander
;;          sunrise-x-checkpoints
;;          sunrise-x-loop
;;          sunrise-x-mirror
;;          sunrise-x-modeline
;;          sunrise-x-tree
;;          ;tomorrow-night-paradise-theme
;;          tiling
;;          tail
;;          undo-tree
;;          xclip
;;          yasnippet
;;          whole-line-or-region
;;          zencoding-mode
;;          window-number
;;          workgroups)    
;;        (mapcar 'el-get-source-name el-get-sources)))

;; (el-get 'sync my-el-get-packages)

;(require 'package)

;; Add marmalade to package repos
;; (defun init-install-packages ())
(require 'package)
;(require 'melpa)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(setq url-http-attempt-keepalives nil)

(defvar packages
  '(
    ace-jump-mode
    ack
    ;; auto-complete
    ;; auto-complete-css
    ;; auto-complete-emacs-lisp
    ;; auto-complete-etags
    ;; auto-complete-extension
    ;; auto-complete-yasnippet
    ;autopair
    base16-theme
;    bookmark-plus
    boxquote
    buffer-move
;    clevercss
    clojure-mode
    cperl-mode
    coffee-mode
    color-theme-solarized
    csv-mode
    dtrt-indent
    durendal
    expand-region
    fill-column-indicator
    flymake-perlcritic
    flymake-cursor
    ;git-emacs
    ;gitconfig-mode
    ;git-modeline
    geiser
    haskell-mode
    hexrgb
    hl-line+
    idomenu
    js2-mode
    ;jshint-mode
    ;js2-refactor
    json
    jump-char        
    lua-mode
    ;lusty-explorer
    key-chord
    offlineimap
    mark-multiple
    markdown-mode
    multiple-cursors
    multi-term
    ;mk-project
    nrepl
    notify
    ;paredit
    graphene
    ;python_mode_fgallina
    pretty-symbols-mode
    pomodoro
    ; python-pep8
    quack
    rainbow-delimiters
    rainbow-mode
    rebox2
    rect-mark
    smart-tab
    smex
    sql
    smooth-scrolling
    sunrise-commander
    undo-tree
    xclip
    yasnippet
    whole-line-or-region
    zencoding-mode
    window-number
    window-number
    projectile
    yasnippet
    pretty-symbols-mode
    wgrep
    mode-compile
    magit pomodoro evil  solarized-theme)
  "A list of packages to ensure are installed at launch.")

(defun packages-installed-p ()
  (loop for p in packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

(unless (packages-installed-p)
  ;; check for new packages (package versions)
  (message "%s" "Emacs is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  ;; install the missing packages
  (dolist (p packages)
    (when (not (package-installed-p p))
      (package-install p))))

;(package-initialize)

;(unless (and (file-exists-p "~/.emacs.d/elpa/archives/marmalade")
;              (file-exists-p "~/.emacs.d/elpa/archives/gnu")
;             (file-exists-p "~/.emacs.d/elpa/archives/melpa"))
;  (package-refresh-contents))

;; (defun packages-install (&rest packages)
;;   (mapc (lambda (package)
;;           (let ((name (car package))
;;                 (repo (cdr package)))
;;             (when (not (package-installed-p name))
;;               (let ((package-archives (list repo)))
;;                 (package-initialize)
;;                 (package-install name)))))
;;         packages)
;;   (package-initialize)
;;   (delete-other-windows))

;; ; from https://github.com/MaskRay/dotemacs/blob/master/cofi-util.el
;; (defmacro require-and-exec (feature &optional &rest body)
;;   "Require the feature and execute body if it was successfull loaded."
;;   (declare (indent 1))
;;   `(if (require ,feature nil 'noerror)
;;        (progn ,@body)
;;      (message (format "%s not loaded" ,feature))))

;; (defmacro pour-lists (place &rest lists)
;;   "Append `LISTS' in front of list at `PLACE'."
;;   `(setq ,place (append ,@lists ,place)))

;; (require-and-exec 'package
;;   (package-initialize)
;;   (dolist (package '(
;;                      egg
;;                      graphene
;;                      ))
;;     (unless (package-installed-p package)
;;       (package-install package))))

;; ;; Install extensions if they're missing
;; (defun init--install-packages ()
;;   (packages-install
;;    (cons 'icicles melpa)
;;    (cons 'pomodoro melpa)
;;    (cons 'wgrep melpa)
;;    (cons 'flycheck melpa)
;;    (cons 'find-file-in-project melpa)
;;    (cons 'org melpa)
;;    (cons 'solarized-theme melpa)
;;    (cons 'projectile melpa)
;;    (cons 'helm melpa)
;;    (cons 'evil melpa)
;;    ))
;;    ;; (cons 'exec-path-from-shell melpa)
   ;; (cons 'magit melpa)
   ;; (cons 'paredit melpa)
   ;; (cons 'gist melpa)
   ;; (cons 'htmlize melpa)
   ;; (cons 'elisp-slime-nav melpa)
   ;; (cons 'elnode marmalade)
   ;; (cons 'slime-js marmalade)
   ;; (cons 'git-commit-mode melpa)
   ;; (cons 'gitconfig-mode melpa)
   ;; (cons 'gitignore-mode melpa)
   ;; (cons 'clojure-mode melpa)
   ;; (cons 'clojure-test-mode melpa)
   ;; (cons 'nrepl melpa)))
;; (defun init-install-packages ())
;; (condition-case nil
;;     (init-install-packages)
;;   (error
;;    (package-refresh-contents)
;;    (init-install-packages)))
;; (defun init-install-packages ())
;; (defun init-install-packages ())

;; Write backup files to own directory
(setq backup-directory-alist 
      `(("." . , emacsd-backup-dir)))

;; Make backups of files, even when they're in version control
(setq vc-make-backup-files t)

;; Save point position between sessions
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (concat emacsd-cache-dir "places"))

;; Lets start with a smattering of sanity
(require 'sane-defaults)

;; Map files to modes
(require 'mode-mappings)

;; allow loading of dash and s libraries 
(add-to-list 'load-path (expand-file-name "~/dot-files-forest/s.el"))
(add-to-list 'load-path (expand-file-name "~/dot-files-forest/dash.el"))

;; Functions (load all files in defuns-dir)
(setq defuns-dir (expand-file-name "defuns" user-emacs-directory))
(dolist (file (directory-files defuns-dir t "\\w+"))
  (when (file-regular-p file)
    (load file)))

;; ;; ;; Fill column indicator
(require 'fill-column-indicator)
(setq fci-rule-color "#111122")

(defconst vendor-load-path '("~/.emacs.d/vendor/")) ;; my elisp directories
(mapcar '(lambda(p)
           (add-to-list 'load-path p) 
           (cd p) (normal-top-level-add-subdirs-to-load-path)) vendor-load-path)

;; ;; Browse kill ring
;; (require 'browse-kill-ring)
;; (setq browse-kill-ring-quit-action 'save-and-restore)

;; Misc
;;(require 'appearance)
;; (require 'my-misc)

;; ;; Elisp go-to-definition with M-. and back again with M-,
;; (autoload 'elisp-slime-nav-mode "elisp-slime-nav")
;; (add-hook 'emacs-lisp-mode-hook (lambda () (elisp-slime-nav-mode t)))
;; (eval-after-load 'elisp-slime-nav '(diminish 'elisp-slime-nav-mode))

;; ;; Emacs server
(require 'server)
(unless (server-running-p)
  (server-start))

;; ;; Run at full power please
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)

;; ;; Diminish modeline clutter
;; (require 'diminish)
;; (diminish 'yas/minor-mode)

(when (file-exists-p user-emacs-directory)
  (mapc 'load (directory-files user-emacs-directory t "^setup_.*el$")))

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;(emacs-init-time)
