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

(require 'cask (expand-file-name "~/.cask/cask.el"))
(cask-initialize)
(require 'pallet)

(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp"))

; common lisp goodies, loop
(require 'cl)

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
;(require 'sane-defaults)

;; Map files to modes
;(require 'mode-mappings)

;; Functions (load all files in defuns-dir)
(setq defuns-dir (expand-file-name "lisp/defuns" user-emacs-directory))
(dolist (file (directory-files defuns-dir t "\\w+"))
  (when (file-regular-p file)
    (load file)))

; Fill column indicator
(require 'fill-column-indicator)
(setq fci-rule-color "#111122")

;; Run at full power please
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)

; Diminish modeline clutter
;(require 'diminish)
;(diminish 'yas/minor-mode)

(require 'use-package)
;(mapc 'load (directory-files (concat user-emacs-directory "lib") t "^setup_.*el$"))

(mapc 'load (directory-files (concat user-emacs-directory "lisp") t "^[0-9]+.*\.el$"))

;; Keep emacs Custom-settings in separate file
;(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
;(load custom-file)

;(emacs-init-time)
