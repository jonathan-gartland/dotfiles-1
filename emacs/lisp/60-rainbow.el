; http://emacs-fu.blogspot.com/2011/05/toward-balanced-and-colorful-delimiters.html
(use-package rainbow-delimiters
  :init
  (progn
    (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)))

(use-package rainbow-mode)

