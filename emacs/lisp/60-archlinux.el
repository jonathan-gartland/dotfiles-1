(use-package pkgbuild-mode
  :init
  (progn
    (add-to-list 'auto-mode-alist '("\\PKGBUILD$" . pkgbuild-mode))))
