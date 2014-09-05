
(defun short-hostname()
  (string-match "[0-9A-Za-z]+" system-name)
  (substring system-name (match-beginning 0) (match-end 0)))

;; Load configuration for this host only, ie ~/.emacs.d/lisp/hosts/$HOSTNAME.el if exist
(defconst local-host-file (downcase (concat 
                                      (concat user-emacs-directory (file-name-as-directory "/lisp/hosts"))
                                      (short-hostname)
                                      ".el")))

(if (file-exists-p local-host-file)
  (load-file local-host-file))

