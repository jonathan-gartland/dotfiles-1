(require 'cl)
(package-initialize)

(setq skkemacs-directory (file-name-directory (file-truename load-file-name)))
(setq org-confirm-babel-evaluate nil)

(org-babel-load-file (expand-file-name "skkemacs.org" skkemacs-directory))
