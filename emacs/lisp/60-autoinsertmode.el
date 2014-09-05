; http://www.emacswiki.org/emacs/AutoInsertMode
(use-package autoinsert
  :init
  (progn
    (auto-insert-mode 1)  ;;; Adds hook to find-files-hook
    (add-hook 'find-file-hook 'auto-insert)
    (setq auto-insert-directory "~/.emacs.d/templates/") ;;; Or use custom, *NOTE* Trailing slash important
    (setq auto-insert-query nil) ;;; If you don't want to be prompted before insertion
    (setq auto-insert-mode t)
    (setq auto-revert-interval 1)
    (define-auto-insert "\.py" "template.py")
    (define-auto-insert "\.pm" "template.pm")))
