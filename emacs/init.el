;; No splash screen please ... jeez
(setq inhibit-startup-message t)
(setq is-mac (equal system-type 'darwin))
(setq is-linux (equal system-type 'gnu/linux))
(setq is-windows-nt (equal system-type 'windows-nt))

(require 'cask (expand-file-name "~/.cask/cask.el"))
(cask-initialize)
(require 'pallet)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

; common lisp goodies, loop
(require 'cl)

;; Functions (load all files in defuns-dir)
(setq defuns-dir (expand-file-name "lisp/defuns" user-emacs-directory))
(dolist (file (directory-files defuns-dir t "\\w+"))
  (when (file-regular-p file)
    (load file)))

(require 'use-package)

;(setq use-package-verbose t)
(setq use-package-minimum-reported-time t)

(mapc 'load (directory-files (concat user-emacs-directory "lisp") t "^[0-9]+.*\.el$"))

(setq custom-file (expand-file-name "lisp/100-custom.el" user-emacs-directory))

(add-hook 'after-init-hook (lambda ()
			     (setq initial-scratch-message
                 (message "Startup time: %s" (emacs-init-time)))))
