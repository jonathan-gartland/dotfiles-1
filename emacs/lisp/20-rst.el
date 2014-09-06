(use-package rst
  :init
  (progn
    (add-to-list 'auto-mode-alist '("\\.rst$" . rst-mode))
    (add-to-list 'auto-mode-alist '("\\.rest$" . rst-mode))))
