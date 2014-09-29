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
  :init 
  (progn
    (global-evil-matchit-mode 1)
    (evil-define-key 'normal evil-matchit-mode-map
      "%" 'evilmi-jump-items)
))

(defcustom dotemacs-evil-state-modes
  '(
    ;fundamental-mode
    text-mode
    prog-mode
    ;dired-mode
    ;comint-mode
    ;log-edit-mode
    ;compilation-mode
)
  "List of modes that should start up in Evil state."
  :type '(repeat (symbol))
  :group 'dotemacs)

; https://gitorious.org/evil
(use-package evil
  :init
  (progn
    (evil-mode 1)
    (setq evil-insert-state-cursor '("#d13a82" hbar))  ; TODO: Turn color into named variables
    (setq evil-search-module 'evil-search)
    (setq evil-magic 'very-magic)

    (defun my-enable-evil-mode ()
      (if (apply 'derived-mode-p dotemacs-evil-state-modes)
          (turn-on-evil-mode)
        ))
    (add-hook 'after-change-major-mode-hook 'my-enable-evil-mode)
    
    (defun my-evil-modeline-change (default-color)
      "changes the modeline color when the evil mode changes"
      (let ((color (cond ((evil-insert-state-p) '("#002233" . "#ffffff"))  ; TODO: Turn colors into named variables
                         ((evil-visual-state-p) '("#330022" . "#ffffff"))  ; TODO: Turn colors into named variables
                         ((evil-normal-state-p) default-color)
                         (t '("#821917" . "#ffffff")))))  ; TODO: Turn colors into named variables
        (set-face-background 'mode-line (car color))
        (set-face-foreground 'mode-line (cdr color))))

    (lexical-let ((default-color (cons (face-background 'mode-line)
                                       (face-foreground 'mode-line))))
      (add-hook 'post-command-hook (lambda () (my-evil-modeline-change default-color))))
))

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


(use-package evil-jumper
  :init
  (progn
    (setq evil-jumper-auto-center t)
    ; TODO (setq evil-jumper-file (concat dotemacs-cache-directory "evil-jumps"))
    (setq evil-jumper-auto-save-interval 3600)
))

(use-package evil-numbers)
(use-package evil-visualstar)
(use-package evil-indent-textobject)
(use-package evil-exchange
  :init
  (progn
    (evil-exchange-install)
))



