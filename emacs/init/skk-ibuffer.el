;;; skk-ibuffer.el 

(require 'ibuffer) 
(setq ibuffer-saved-filter-groups
  (quote (("default"      
            ("erma-skk"
             (filename . "/web/erma-skk"))
            ("nh-wetlands-mapper-dev"
             (filename . "/web/nh-wetlands-mapper-dev"))
            ("Housing"
             (filename . "/web/housing"))
            ("Emacs Config"
             (filename . "~/.emacs.d/"))
            ("Programming" ;; prog stuff not already in MyProjectX
              (or
                (mode . c-mode)
                (mode . perl-mode)
                (mode . python-mode)
                (mode . emacs-lisp-mode)
                ;; etc
                ))
            ))))


(add-hook 'ibuffer-mode-hook
  (lambda ()
    (ibuffer-switch-to-saved-filter-groups "default")))

(global-set-key (kbd "C-x C-b") 'ibuffer)

(provide 'skk-ibuffer)
;;; skk-ibuffer.el ends here
