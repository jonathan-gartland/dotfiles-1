; https://gitorious.org/evil/pages/Home
; https://github.com/timcharper/evil-surround
(use-package evil-surround
  :init (global-evil-surround-mode 1))

; https://github.com/cofi/evil-leader
(use-package evil-leader
  :init (global-evil-leader-mode 1))

; https://github.com/redguardtoo/evil-matchit
(use-package evil-matchit
  :init (global-evil-matchit-mode 1))

(use-package evil
  :config
  (progn
    (evil-mode 1)
    (setq evil-insert-state-cursor '("#d13a82" hbar))))

