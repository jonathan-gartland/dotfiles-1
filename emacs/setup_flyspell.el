;;;_. flyspell
(use-package flyspell
  :init
  (progn
    (defun turn-on-flyspell ()
      "Force flyspell-mode on using a positive argument. For use in hooks."
      (interactive)
      (flyspell-mode 1))

    (when is-linux
      (add-hook 'fundamental-mode-hook 'turn-on-flyspell))))

;(provide 'setup_flyspell)
