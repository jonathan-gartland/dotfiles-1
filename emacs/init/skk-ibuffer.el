;;; skk-ibuffer.el 

(require 'ibuffer) 
(setq ibuffer-saved-filter-groups
  (quote (("default"      
            ("ERMA"
              (filename . "ERMA/"))
            ("Housing"
             (filename . "/web/housing"))
            ("Programming" ;; prog stuff not already in MyProjectX
              (or
                (mode . c-mode)
                (mode . perl-mode)
                (mode . python-mode)
                (mode . emacs-lisp-mode)
                ;; etc
                )) 
            ("ERC"   (mode . erc-mode))))))

(add-hook 'ibuffer-mode-hook
  (lambda ()
    (ibuffer-switch-to-saved-filter-groups "default")))

(global-set-key (kbd "C-x C-b") 'ibuffer)

(provide 'skk-ibuffer)
;;; skk-ibuffer.el ends here
