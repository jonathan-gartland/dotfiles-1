;;;_. org-mode
(use-package org-mode
  :init
  (progn
    ; org-mode http://orgmode.org/org.html
    (add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
    (setq org-log-done 'time)
    ;; Set to <your Dropbox root directory>/MobileOrg.
    (setq org-mobile-directory "~/Dropbox/MobileOrg")

    ;; org-mode colors
    (setq org-todo-keyword-faces '(
        ("INPR" . (:foreground "yellow" :weight bold))
        ("DONE" . (:foreground "green" :weight bold))
        ("IMPEDED" . (:foreground "red" :weight bold))))))
