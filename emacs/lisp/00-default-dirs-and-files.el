;; TODO move lisp/00-default-dirs-and-files.el (or 02-settings.el ?)
(defconst emacs-persistence-directory (expand-file-name ".persistence" user-emacs-directory))
(defconst user-backup-dir (expand-file-name "backup" emacs-persistence-directory))
(defconst user-image-dired-dir (expand-file-name "image-dired" emacs-persistence-directory))

(defconst user-save-place-file (expand-file-name "places" emacs-persistence-directory))
(defconst emacs-autosavelistfileprefix-dir (expand-file-name "auto-save-list" emacs-persistence-directory))
(defconst emacs-tramp-dir (expand-file-name "tramp" emacs-persistence-directory))
(defconst emacs-ido-last-file (expand-file-name "ido-last" emacs-persistence-directory))
(defconst emacs-savehist-file (expand-file-name "savehist" emacs-persistence-directory))
(defconst emacs-recentfiles-file (expand-file-name "recent-files" emacs-persistence-directory))
(defconst emacs-smexsavefile-file (expand-file-name "smex-items" emacs-persistence-directory))

(defconst emacs-acomphistfile-file (expand-file-name "ac-comphist.dat" emacs-persistence-directory))
(defconst emacs-autocompletedict (expand-file-name "ac-dict" emacs-persistence-directory))
(defconst emacs-abbrevdefs-file (expand-file-name "abbrev_defs.el" emacs-persistence-directory))

(defconst user-projectile-cache-file (expand-file-name "projectile.cache" emacs-persistence-directory))
(defconst user-projectile-known-projects-file (expand-file-name "projectile-bookmarks.eld" emacs-persistence-directory))
(defconst user-graphene-geometry-file (expand-file-name "graphene-geometry" emacs-persistence-directory))

;; create required directories
(unless (file-directory-p emacs-persistence-directory)
    (make-directory emacs-persistence-directory t))

(unless (file-directory-p user-backup-dir)
  (make-directory user-backup-dir))

(unless (file-directory-p user-image-dired-dir)
  (make-directory user-image-dired-dir))

;(defconst emacs-saveplacefile-file (concat emacs-persistence-directory "/places"))
;(defconst emacs-autosavelistfileprefix-dir (concat emacs-persistence-directory "/auto-save-list"))
;(defconst emacs-tramp-dir (concat emacs-persistence-directory "/tramp"))
;(defconst emacs-ido-last-file (concat emacs-persistence-directory "/ido-last"))
;(defconst emacs-savehist-file (concat emacs-persistence-directory "/savehist"))
;(defconst emacs-recentfiles-file (concat emacs-persistence-directory "/recent-files"))
;(defconst emacs-smexsavefile-file (concat emacs-persistence-directory "/smex-items"))

;(defconst emacs-acomphistfile-file (concat emacs-persistence-directory "/ac-comphist.dat"))
;(defconst emacs-autocompletedict (concat emacs-persistence-directory "/ac-dict")
;(defconst emacs-abbrevdefs-file (concat emacs-persistence-directory "/abbrev_defs.el"))


