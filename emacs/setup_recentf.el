; http://www.masteringemacs.org/articles/2011/01/27/find-files-faster-recent-files-package/
(require 'recentf)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
;; recent files                                                                  

;; (defun ido-recentf-open ()
;;   "Use `ido-completing-read' to \\[find-file] a recent file"
;;   (interactive)
;;   (if (find-file (ido-completing-read "Find recent file: " recentf-list))
;;       (message "Opening file...")
;;     (message "Aborting")))

;; (use-package recentf
;;   :init
;;   (progn
;;     (bind-key "C-x C-r" 'ido-recentf-open)
;;     (setq recentf-save-file "~/.emacs.d/.cache/recent-files"
;;           recentf-max-saved-items 500                                            
;;           recentf-max-menu-items 60)
;;     (recentf-mode t)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

