;;;_. org-mode
;(use-package org-mode
;  :init
;  (progn
;    ; org-mode http://orgmode.org/org.html
;    (add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
;    (setq org-log-done 'time)
;    ; Set to the location of your Org files on your local system
;    (setq org-directory "~/Projects/EPSCOR")
;    ;; Set to the name of the file where new notes will be stored
;    (setq org-mobile-inbox-for-pull "~/Projects/EPSCOR/flagged.org")
;    ;; Set to <your Dropbox root directory>/MobileOrg.
;    (setq org-mobile-directory "~/Dropbox/MobileOrg")))

(global-set-key [XF86Explorer] '(lambda () (interactive) 
                                    (switch-to-buffer (find-file "~/dot-files-forest/task/task.org"))))
