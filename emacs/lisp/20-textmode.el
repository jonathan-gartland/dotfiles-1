(add-hook 'text-mode-hook
          (lambda ()
            (interactive)
            (set-fill-column 78)   ; lines are 78 chars long ...         
            (auto-fill-mode t)     ; ... and wrapped around automatically
            ))

(use-package filladapt
  :init (filladapt-mode t))
