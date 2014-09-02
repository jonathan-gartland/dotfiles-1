(elpy-enable)

(require 'jedi)

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
(setq jedi:setup_keys t)

(provide 'setup_python)
