;;;_. flyspell
(use-package flyspell
  :init
  (progn
    (when is-linux
      (add-hook 'fundamental-mode-hook 
                (lambda () 
                  (flyspell-mode 1))))))

;(provide 'setup_flyspell)
