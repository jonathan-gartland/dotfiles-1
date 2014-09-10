(use-package hexrgb)
(use-package ack)
(use-package whole-line-or-region)
(use-package idomenu)
(use-package key-chord)
(use-package pomodoro)
(which-function-mode t)

(use-package project-explorer)

(use-package smart-mode-line
  :init
  (progn
    (add-hook 'after-init-hook 'sml/setup)))

(use-package indent-guide
  :init
  (progn
    (indent-guide-global-mode)))

(use-package fill-column-indicator
  :init
  (progn
    (setq fci-rule-character-color "#1c1c1c"
          fci-rule-color "#1c1c1c")))

(use-package saveplace
  :init (progn
          (setq save-place-file user-save-place-file)
          (setq-default save-place t))) 


; http://emacs-fu.blogspot.com/2011/01/setting-frame-title.html
(setq frame-title-format
  '("" invocation-name ": "(:eval (if (buffer-file-name)
                (abbreviate-file-name (buffer-file-name))
                  "%b"))))

; remove emacs' ability to interactive with git.  This was done
; because accessing remote git repo through sshfs caused major lag. 
(delete 'Git vc-handled-backends)

; http://blog.printf.net/articles/tag/emacs
(defun find-tag-at-point ()
  "*Find tag whose name contains TAGNAME.
  Identical to `find-tag' but does not prompt for 
  tag when called interactively;  instead, uses 
  tag around or before point."
    (interactive)
      (find-tag (if current-prefix-arg
                    (find-tag-tag "Find tag: "))
                (find-tag (find-tag-default))))
(bind-key "<F-9>" 'find-tag-at-point)

;; show-paren-mode
;; show a subtle blinking of the matching paren (the defaults are ugly)
;; http://www.emacswiki.org/cgi-bin/wiki/ShowParenMode
(show-paren-mode t)
(setq show-paren-style 'parenthesis)

;;  abbrevs (emacs will automagically expand abbreviations)
(setq abbrev-file-name                ; tell emacs where to read abbrev
      emacs-abbrevdefs-file)    ; definitions from...
(abbrev-mode t)                       ; enable abbrevs (abbreviations) ...
(when (file-exists-p abbrev-file-name)
  (quietly-read-abbrev-file))         ;  don't tell
(add-hook 'kill-emacs-hook            ; write when ...
  'write-abbrev-file)                 ; ... exiting emacs

;; backups  (emacs will write backups and number them)
(setq make-backup-files t ; do make backups
  backup-by-copying t ; and copy them ...
  version-control t
  vc-make-backup-files t
  kept-new-versions 2
  kept-old-versions 5
  delete-old-versions t)
(setq backup-directory-alist `((".*" . ,user-backup-dir)))

; tramp, for remote access
(setq tramp-default-method "ssh"
      tramp-persistency-file-name emacs-tramp-dir
      tramp-verbose 10)

;; safe locals; we mark these as 'safe', so emacs22+ won't give us annoying 
;; warnings
(setq safe-local-variable-values 
      (quote ((auto-recompile . t) 
              (outline-minor-mode . t) 
              auto-recompile outline-minor-mode)))

(setq image-dired-dir user-image-dired-dir)
(setq ido-save-directory-list-file emacs-ido-last-file)

(setq savehist-additional-variables       ;; also save...
      '(search-ring regexp-search-ring)   ;; ... my search entries
      savehist-file emacs-savehist-file)  ;; keep my home clean
(savehist-mode t)                         ;; do customization before activate

;; Run at full power please
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)

(setq ispell-personal-dictionary "~/.emacs.d/aspell.dict")

(setq tab-always-indent nil)

(use-package ample-zen-theme
  :init (load-theme 'ample-zen 1))

;; Highlight matching parentheses when the point is on them.
(show-paren-mode 1)

(when window-system
  (set-frame-font "monoOne 10")
  ; http://emacsredux.com/blog/2014/08/25/a-peek-at-emacs-24-dot-4-prettify-symbols-mode/
  (global-prettify-symbols-mode 1)
  (global-hl-line-mode 0))

; disabled that damm bell !
(setq bell-volume 0)
(setq sound-alist nil)
(setq ring-bell-function 'ignore)
(setq visible-bell nil)

