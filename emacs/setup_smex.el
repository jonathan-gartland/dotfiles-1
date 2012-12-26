(use-package smex
  :init
  (progn
    (setq smex-save-file (expand-file-name "~/.emacs.d/.cache/smex-items"))
    (bind-key "M-x" 'smex)
    (bind-key "M-X" 'smex-major-mode-commands)
    (bind-key "C-c C-c M-x" 'smex-major-mode-commands)))
;(provide setup_smex)
