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

(defvar electrify-return-match
  "[\]}\)\"]"
  "If this regexp matches the text after the cursor, do an \"electric\"
  return.")

(defun electrify-return-if-match (arg)
  "If the text after the cursor matches `electrify-return-match' then
  open and indent an empty line between the cursor and the text.  Move the
  cursor to the new line."
  (interactive "P")
  (let ((case-fold-search nil))
    (if (looking-at electrify-return-match)
        (save-excursion (newline-and-indent)))
    (newline arg)
    (indent-according-to-mode)))

;; Using local-set-key in a mode-hook is a better idea.
(global-set-key (kbd "RET") 'electrify-return-if-match)


(eval-after-load "sepia"
  '(progn
     (setq cperl-indent-level 4)

     (defun cperl-indent4 ()
       (setq cperl-indent-level 4))

     (defun cperl-indent2 ()
       (setq cperl-indent-level 2))

     (defun my-cperl-eldoc-documentation-function ()
       "Return meaningful doc string for `eldoc-mode'."
       (car
        (let ((cperl-message-on-help-error nil))
          (cperl-get-help))))

     (add-hook 'sepia-mode-hook
               (lambda ()
                 ;; (set (make-local-variable) 'rebox-style-loop '(525))
                 ;; (set (make-local-variable 'rebox-min-fill-column) 40)
                 (set (make-local-variable 'eldoc-documentation-function)
                      'my-cperl-eldoc-documentation-function)

                 (turn-on-eldoc-mode)
                 (local-set-key (kbd "RET") 'electrify-return-if-match)
                 (eldoc-add-command 'electrify-return-if-match)
                 (show-paren-mode t)
                 ))))

(provide 'skk-perl)
; skk-perl.el ends here
