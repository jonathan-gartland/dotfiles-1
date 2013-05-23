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
(add-to-list 'load-path user-emacs-directory)
(add-to-list 'load-path (expand-file-name "~/dot-files-forest/use-package"))
(require 'use-package)
(require 'bind-key)

; common lisp goodies, loop
(require 'cl)			

;; Add marmalade to package repos
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(setq url-http-attempt-keepalives nil)

(defvar packages
  '(
    s
    dash

    ace-jump-mode
    pkgbuild-mode
    ack
    ack-and-a-half
    boxquote
    buffer-move
    clojure-mode
    cperl-mode
    coffee-mode
    color-theme-solarized
    csv-mode
    csharp-mode
    dtrt-indent
    durendal
    ess
    expand-region
    fill-column-indicator
    flymake-perlcritic
    flymake-cursor
    textmate
    gitignore-mode
    ;git-emacs
    gitconfig-mode
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
    nrepl
    notify
    graphene
    pretty-symbols-mode
    pomodoro
    quack
    rainbow-delimiters
    rainbow-mode
    rebox2
    rect-mark
    smart-tab
    smex
    sql
    smooth-scrolling
    undo-tree
    xclip
    yasnippet
    whole-line-or-region
    simplezen
    window-number
    window-number
    projectile
    yasnippet
    pretty-symbols-mode
    wgrep
    mode-compile
    magit
    pomodoro
    espresso-theme
    evil
    cyberpunk-theme
    underwater-theme
    smartparens
    soothe-theme
    solarized-theme)
  "A list of packages to ensure are installed at launch.")

(require 's)
(require 'dash)

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

;; ;; Emacs server
;; (require 'server)
;; (unless (server-running-p)
;;   (server-start))

;; Run at full power please
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)

;; ;; Diminish modeline clutter
;; (require 'diminish)
;; (diminish 'yas/minor-mode)

(when (file-exists-p (concat user-emacs-directory "lib"))
  (mapc 'load (directory-files (concat user-emacs-directory "lib") t "^setup_.*el$")))

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;(emacs-init-time)
