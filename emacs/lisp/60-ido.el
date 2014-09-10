(use-package flx-ido
  :init
  (progn
    ;(bind-key "C-x C-i" 'ido-imenu)
    (flx-ido-mode 1)
    (ido-vertical-mode)
    (setq ido-use-faces nil)))
