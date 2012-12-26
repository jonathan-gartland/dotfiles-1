 
(use-package hide-region
  :init 
  (progn
    (bind-key "C-c h r" 'hide-region-hide)
    (bind-key "C-c h u" 'hide-region-hide)))

;(provide 'setup_hideregion)

