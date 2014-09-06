;; TODO check out traad https://github.com/abingham/traad
;; Traad is a client-server approach to use the rope Python refactory library.

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
    (add-hook 'python-mode-hook 'eldoc-mode)
    (add-hook 'python-mode-hook 'jedi:setup)))
