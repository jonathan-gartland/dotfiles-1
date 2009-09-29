;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ido makes completing buffers and finding files easier
;; http://www.emacswiki.org/cgi-bin/wiki/InteractivelyDoThings
(require 'ido) 
(ido-mode 'both)
(setq 
  ido-save-directory-list-file "~/.emacs.d/.cache/ido.last"
  ido-ignore-buffers ;; ignore these guys
  '("\\` " "^\*Mess" "^\*Back" ".*Completion" "^\*Ido")
  ido-work-directory-list '("~/" "~/Desktop" "~/Documents")
  ido-everywhere t            ; use for many file dialogs
  ido-case-fold  t            ; be case-insensitive
  ido-use-filename-at-point nil ; don't use filename at point (annoying)
  ido-use-url-at-point nil      ;  don't use url at point (annoying)
  ido-enable-flex-matching t  ; be flexible
  ido-max-prospects 4         ; don't spam my minibuffer
  ido-confirm-unique-completion t) ; wait for RET, even with unique completion

;; http://www.emacswiki.org/emacs/FileNameCache
(defun file-cache-ido-find-file (file)
  "Using ido, interactively open file from file cache'.
First select a file, matched using ido-switch-buffer against the contents
in `file-cache-alist'. If the file exist in more than one
directory, select directory. Lastly the file is opened."
  (interactive 
    (list (file-cache-ido-read "File: " 
            (mapcar (lambda (x) (car x)) file-cache-alist))))
  (let* ((record (assoc file file-cache-alist)))
    (find-file
     (expand-file-name
      file
      (if (= (length record) 2)
          (car (cdr record))
        (file-cache-ido-read
         (format "Find %s in dir: " file) (cdr record)))))))

(defun file-cache-ido-read (prompt choices)
  (let ((ido-make-buffer-list-hook
         (lambda ()
           (setq ido-temp-list choices))))
    (ido-read-buffer prompt)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
