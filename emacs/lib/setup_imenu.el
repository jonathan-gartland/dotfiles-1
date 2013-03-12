; http://www.emacswiki.org/emacs/ImenuMode
(defun try-to-add-imenu ()
  (condition-case nil (imenu-add-to-menubar "Imenu") (error nil)))

(add-hook 'cperl-mode-hook 'try-to-add-imenu)
(add-hook 'python-mode-hook 'try-to-add-imenu)
(add-hook 'lisp-mode-hook 'try-to-add-imenu)
(add-hook 'js2-mode-hook 'try-to-add-imenu)

(bind-key "C-c =" 'imenu)
