;;;_. yasnippet
(use-package yasnippet
  :init
  (progn 
    ; Initialize Yasnippet
    (setq yas-snippet-dirs
	  '("~/.emacs.d/snippets"
	    "~/.emacs.d/el-get/yasnippet/snippets"))
    (yas-global-mode 1)))
