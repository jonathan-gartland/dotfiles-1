(use-package flx-ido
  :init
  (progn
    (bind-key "C-x C-i" 'ido-imenu)
    (ido-mode 1)
    (ido-everywhere 1)
    (flx-ido-mode 1)
    (setq ido-create-new-buffer (quote never))
    (setq ido-enable-flex-matching t)
    (setq ido-enable-last-directory-history nil)
    (setq ido-enable-regexp nil)
    (setq ido-max-directory-size 300000)
    (setq ido-max-file-prompt-width 0.1)
    (setq ido-use-filename-at-point (quote guess))
    (setq ido-use-url-at-point t)
    (setq ido-use-virtual-buffers t)
    ;; enable fuzzy matching
    (setq ido-enable-flex-matching t)
    ))

;(provide 'setup_ido)
