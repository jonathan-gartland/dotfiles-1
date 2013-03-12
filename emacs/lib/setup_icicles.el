;;; setup_icicles.el --- 

;(add-to-list 'load-path "~/.emacs.d/vendor/icicles")
;(require 'icicles)

;;_. lacarte
(use-package lacarte
  :config
  (progn
    (global-set-key [?\M-`] 'lacarte-execute-menu-command)))

(provide 'setup_icicles)
;;; setup_icicles.el ends here
