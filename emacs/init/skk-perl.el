;;; skk-perl.el --- 

; prefer cperl-mode
(defalias 'perl-mode 'cperl-mode)
(setq cperl-indent-level 4)

(defun cperl-indent4 ()
 (setq cperl-indent-level 4)
)

(defun cperl-indent2 ()
 (setq cperl-indent-level 2)
)

(defun my-cperl-eldoc-documentation-function ()
      "Return meaningful doc string for `eldoc-mode'."
      (car
       (let ((cperl-message-on-help-error nil))
         (cperl-get-help))))


(add-hook 'cperl-mode-hook
          (lambda ()
            (set (make-local-variable 'eldoc-documentation-function)
                 'my-cperl-eldoc-documentation-function)))

;; (defun flymake-perl-init ()
;;   (let* ((temp-file (flymake-init-create-temp-buffer-copy
;;                      'flymake-create-temp-inplace))
;;      	 (local-file (file-relative-name
;;                       temp-file
;;                       (file-name-directory buffer-file-name))))
;;     (list "/sshfs/lithium/usr/local/bin/perl_syntax_checker.pl" (list " " local-file))))

(setq flymake-log-level 10)

;; (setq flymake-allowed-file-name-masks nil)

;; (setq flymake-allowed-file-name-masks
;;       (cons '(".+\\.pm$"
;;               flymake-perl-init
;;               flymake-simple-cleanup
;;               flymake-get-real-file-name)
;;             flymake-allowed-file-name-masks))

;; (setq flymake-err-line-patterns nil)
;; (setq flymake-err-line-patterns
;;        (cons '("\\(.*\\) at \\([^ \n]+\\) line \\([0-9]+\\)[,.\n]"
;;                2 3 nil 1)
;;              flymake-err-line-patterns))

;; (add-hook 'cperl-mode-hook
;;           '(lambda ()
;;              (yas/minor-mode-on)
;;              (setq yas/mode-symbol 'perl-mode)))

(defun flymake-perl-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-inplace))
     	 (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
    (list perl-command (list perl-dbg-flags temp-file))))

;; (setq flymake-allowed-file-name-masks
;;       (cons '(".+\\pm$"
;;               flymake-perl-init
;;               flymake-simple-cleanup
;;               flymake-get-real-file-name)))

;; (setq flymake-err-line-patterns
;;       (cons '("\\(.*\\) at \\([^ \n]+\\) line \\([0-9]+\\)[,.\n]"
;;               2 3 nil 1)
;;             flymake-err-line-patterns))


(provide 'skk-perl)
;;; skk-perl.el ends here


