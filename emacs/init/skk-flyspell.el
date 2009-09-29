;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; flyspell
(require 'flyspell)
(autoload 'flyspell-mode "flyspell" "On-the-fly spelling checker." t)

(defun turn-on-flyspell ()
  "Force flyspell-mode on using a positive argument. For use in hooks."
  (interactive)
  (flyspell-mode 1))

(when djcb-linux-p
  (add-hook 'c++-mode-common-hook 'turn-on-flyspell)
  (add-hook 'c++-mode-hook 'turn-on-flyspell)
  (add-hook 'c-mode-common-hook 'turn-on-flyspell  )
  (add-hook 'emacs-lisp-mode-hook 'turn-on-flyspell)
  (add-hook 'fundamental-mode-hook 'turn-on-flyspell)
  (add-hook 'message-mode-hook 'turn-on-flyspell)
  (add-hook 'python-mode-hook 'turn-on-flyspell)
  (add-hook 'text-mode-hook 'turn-on-flyspell))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
