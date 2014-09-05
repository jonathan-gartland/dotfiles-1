;; (elpy-enable)

;; (require 'jedi)

;; (add-hook 'python-mode-hook 'jedi:setup)
;; (setq jedi:complete-on-dot t)
;; (setq jedi:setup_keys t)


(use-package ely
  :init
  (progn
    (elpy-enable)))

(use-package jedi
:init
(progn
  (add-hook 'python-mode-hook 'jedi:setup)
  (setq jedi:complete-on-dot t)
  (setq jedi:setup_keys t)))


(provide 'setup_python)
