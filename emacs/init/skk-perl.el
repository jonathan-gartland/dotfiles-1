;;; skk-perl.el --- 

; prefer cperl-mode
(defalias 'perl-mode 'cperl-mode)
(setq cperl-indent-level 4)

(defun cperl-indent4 ()
 (setq cperl-indent-level 4))

(defun cperl-indent2 ()
 (setq cperl-indent-level 2)
)

;; (defun flymake-perl-init ()
;;   (let* ((temp-file (flymake-init-create-temp-buffer-copy
;;                      'flymake-create-temp-inplace))
;;      	 (local-file (file-relative-name
;;                       temp-file
;;                       (file-name-directory buffer-file-name))))
;;     (list "/usr/local/bin/perl_syntax_checker_emacs.sh" (list " " local-file))))

;; (setq flymake-log-level 5)

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

(provide 'skk-perl)
;;; skk-perl.el ends here
