; http://emacs-fu.blogspot.com/2009/11/making-buffer-names-unique.html
(use-package uniquify
  :init
  (progn
    (setq 
     uniquify-buffer-name-style 'post-forward
     uniquify-separator ":")))