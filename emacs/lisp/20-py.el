;; (elpy-enable)

;; (require 'jedi)

;; (add-hook 'python-mode-hook 'jedi:setup)
;; (setq jedi:complete-on-dot t)
;; (setq jedi:setup_keys t)

(use-package elpy
  :init
  (progn
    (elpy-enable)))

(use-package jedi
:init
(progn
    (bind-key "C-c /" 'jedi:get-in-function-call)
    ;; Don't let tooltip show up automatically
    (setq jedi:get-in-function-call-delay 10000000)
    ;; Start completion at method dot
    (setq jedi:complete-on-dot t)
    (setq jedi:setup_keys t)

    (add-hook 'python-mode-hook 'jedi:setup)))


(provide 'setup_python)
