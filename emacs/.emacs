(require 'cl)
(package-initialize)

(setq org-confirm-babel-evaluate nil)

(org-babel-load-file (expand-file-name "skkemacs.org"
                                       (file-name-directory (file-truename load-file-name))))

