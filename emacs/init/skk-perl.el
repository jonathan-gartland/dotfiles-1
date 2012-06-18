;;; skk-perl.el --- 


;; ; prefer cperl-mode
;; (defalias 'perl-mode 'cperl-mode)

;; (eval-after-load "cperl"
;;   '(progn
;;      (setq cperl-indent-level 4)

;;      (defun cperl-indent4 ()
;;        (setq cperl-indent-level 4))

;;      (defun cperl-indent2 ()
;;        (setq cperl-indent-level 2))

;;      (defun my-cperl-eldoc-documentation-function ()
;;        "Return meaningful doc string for `eldoc-mode'."
;;        (car
;;         (let ((cperl-message-on-help-error nil))
;;           (cperl-get-help))))

;;      (add-hook 'cperl-mode-hook
;;                (lambda ()
;;                  (set (make-local-variable) 'rebox-style-loop '(525))
;;                  (set (make-local-variable 'rebox-min-fill-column) 40)
;;                  (set (make-local-variable 'eldoc-documentation-function)
;;                       'my-cperl-eldoc-documentation-function)))))


(defconst sepia-path (file-truename "~/.emacs.d/elisp/Sepia-0.992_01"))
(add-to-list 'load-path sepia-path)
(setq sepia-perl5lib (list (expand-file-name (concat sepia-path "/lib"))))
(defalias 'perl-mode 'sepia-mode)
(require 'sepia)

(provide 'skk-perl)
;;; skk-perl.el ends here

