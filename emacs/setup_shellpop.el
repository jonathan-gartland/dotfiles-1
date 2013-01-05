; http://www.emacswiki.org/emacs/ShellPop 
(use-package shell-pop
  :init (progn
          (shell-pop-set-internal-mode "multi-term")
          (shell-pop-set-internal-mode-shell "/bin/bash")
          (bind-key "<F-8>" 'shell-pop)))

; http://floss.zoomquiet.org/data/20110326155829/index.html
(use-package point-stack
  :init
  (progn
    (global-set-key '[(f5)] 'point-stack-push)
    (global-set-key '[(f6)] 'point-stack-pop)
    (global-set-key '[(f7)] 'point-stack-forward-stack-pop)))

