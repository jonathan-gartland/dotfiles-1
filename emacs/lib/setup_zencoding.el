; http://www.emacswiki.org/emacs/ZenCoding
(use-package zencoding-mode
  :init
  (progn
    (add-hook 'sgml-mode-hook 'zencoding-mode) ;; Auto-start on any markup modes
    (add-hook 'cperl-mode-hook 'zencoding-mode) ;; Auto-start on any markup modes
    ))
