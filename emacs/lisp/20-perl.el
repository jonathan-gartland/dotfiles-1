(defalias 'perl-mode 'cperl-mode)
(setq cperl-hairy t)

(defun my-cperl-eldoc-documentation-function ()
  "Return meaningful doc string for `eldoc-mode'."
  (car
   (let ((cperl-message-on-help-error nil))
     (cperl-get-help))))

(set (make-local-variable 'eldoc-documentation-function)
     'my-cperl-eldoc-documentation-function)
(setq cperl-indent-level 4)
(turn-on-eldoc-mode)
(local-set-key (kbd "RET") 'electrify-return-if-match)
(eldoc-add-command 'electrify-return-if-match)
(show-paren-mode t)
