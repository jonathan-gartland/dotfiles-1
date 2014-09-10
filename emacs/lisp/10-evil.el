; https://gitorious.org/evil/pages/Home
; https://github.com/timcharper/evil-surround
(use-package evil-surround
  :init (global-evil-surround-mode 1))

; https://github.com/cofi/evil-leader
(use-package evil-leader
  :init
  (progn
    (evil-leader/set-leader "\\")
    (global-evil-leader-mode 1)))

; https://github.com/redguardtoo/evil-matchit
(use-package evil-matchit
  :init (global-evil-matchit-mode 1))

; https://gitorious.org/evil
(use-package evil
  :config
  (progn
    (evil-mode 1)
    (setq evil-insert-state-cursor '("#d13a82" hbar))))

(defconst evil-nerd-commenter-path (expand-file-name (substitute-in-file-name "$HOME/src/evil-nerd-commenter")))
(if (file-directory-p evil-nerd-commenter-path)
    (add-to-list 'load-path evil-nerd-commenter-path)
  (message "Unable to add evil-nerd-commenter %s to load-path" evil-nerd-commenter-path))

; https://github.com/redguardtoo/evil-nerd-commenter
(use-package evil-nerd-commenter
  :init
  (progn
    (evil-leader/set-key
      "ci" 'evilnc-comment-or-uncomment-lines
      "cl" 'evilnc-quick-comment-or-uncomment-to-the-line
      "ll" 'evilnc-quick-comment-or-uncomment-to-the-line
      "cc" 'evilnc-copy-and-comment-lines
      "cp" 'evilnc-comment-or-uncomment-paragraphs
      "cr" 'comment-or-uncomment-region
      "cv" 'evilnc-toggle-invert-comment-line-by-line)))

