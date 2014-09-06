(use-package js2-mode)
(use-package js2-refactor)

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-hook 'js2-mode-hook (lambda ()
                           (auto-fill-mode -1)))
