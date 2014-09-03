(use-package smex
  :init
  (progn
    (setq smex-save-file emacs-smexsavefile-file)
    (bind-key "M-x" 'smex)
    (bind-key "M-X" 'smex-major-mode-commands)))
