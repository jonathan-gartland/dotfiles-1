(setq is-mac (equal system-type 'darwin))
(setq is-linux (equal system-type 'gnu/linux))
(setq is-windows-nt (equal system-type 'windows-nt))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Install packages cider and clojure-mode manually from
; melpa-stable to ensure version match between cider and cider-nrepl.
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/") t)
(package-refresh-contents)
(package-initialize)

(unless (package-installed-p 'cider)
  (package-install 'cider))

(unless (package-installed-p 'clojure-mode)
  (package-install 'clojure-mode))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'cask (expand-file-name "~/.cask/cask.el"))
(cask-initialize)
(require 'pallet)

; common lisp goodies
(require 'cl)

; load use-package
(require 'use-package)

; Load setup/init files
(mapc 'load (directory-files (expand-file-name "lisp" user-emacs-directory) t "^[a-zA-Z0-9-]+\.el$"))

; Load defuns
(mapc 'load (directory-files (expand-file-name "lisp/defuns" user-emacs-directory) t "^.*\.el$"))

; set custom-file
(setq custom-file (expand-file-name "lisp/99-custom.el" user-emacs-directory))

(add-hook 'after-init-hook (lambda ()
                             (setq initial-scratch-message
                                   (message "Startup time: %s" (emacs-init-time)))))
