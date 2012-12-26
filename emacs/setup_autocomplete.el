(use-package auto-complete-config
  :init 
  (progn
    (add-to-list 'load-path "~/.emacs.d/el-get/auto-complete")
    (require 'auto-complete-config)
    (ac-config-default)
    (setq ac-comphist-file  "~/.emacs.d/.cache/ac-comphist.dat")))
;(provide 'setup_autocomplete)
