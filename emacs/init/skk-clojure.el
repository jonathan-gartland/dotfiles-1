;;; skk-clojure.el --- 

(when (require-maybe 'clojure-mode))
(when (require-maybe 'slime)

  ;; slime
  (eval-after-load "slime" 
    '(progn (slime-setup '(slime-repl))))

  (slime-setup))

(defun clojure-swank ()
  "Launch swank-clojure from users homedir/.lein/bin"
  (interactive)
  (let ((buffer (get-buffer-create "*clojure-swank*")))
    (flet ((display-buffer (buffer-or-name &optional not-this-window frame) nil))
          (bury-buffer buffer)
          (shell-command "~/.lein/bin/swank-clojure &" buffer))
    (set-process-filter (get-buffer-process buffer)
                        (lambda (process output)
                           (with-current-buffer "*clojure-swank*" (insert output))
                           (when (string-match "Connection opened on local port +\\([0-9]+\\)" output)
                             (slime-connect "localhost" (match-string 1 output))
                             (set-process-filter process nil))))
    (message "Starting swank.. ")))

(defun clojure-kill-swank ()
  "Kill swank process started by lein swank."
  (interactive)
  (let ((process (get-buffer-process "*clojure-swank*")))
    (when process
      (ignore-errors (slime-quit-lisp))
      (let ((timeout 10))
        (while (and (> timeout 0)
                    (eql 'run (process-status process)))
          (sit-for 1)
          (decf timeout)))
      (ignore-errors (kill-buffer "*clojure-swank*")))))

(durendal-enable)

(provide 'skk-clojure)
;;; skk-clojure.el ends here
