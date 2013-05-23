; http://www.emacswiki.org/emacs/ZenCoding
;(use-package zencoding-mode
;  :init
;  (progn
;    (add-hook 'sgml-mode-hook 'zencoding-mode) ;; Auto-start on any markup modes
;    (add-hook 'cperl-mode-hook 'zencoding-mode) ;; Auto-start on any markup modes
;    ))

(defun --setup-simplezen ()
  (set (make-local-variable 'yas/fallback-behavior)
       '(apply simplezen-expand-or-indent-for-tab)))

(use-package simplezen
  :init (progn
          (add-hook 'html-mode-hook '--setup-simplezen)
          (bind-key "TAB" 'simplezen-expand-or-indent-for-tab)))
