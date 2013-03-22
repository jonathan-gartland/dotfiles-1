(use-package textmate)

(add-hook 'text-mode-hook
          (lambda ()
            (interactive)
            (set-fill-column 78)                    ; lines are 78 chars long ...         
            (auto-fill-mode t)                      ; ... and wrapped around automagically
            ; (set-input-method "latin-1-prefix")     ; make " + e => ë etc.
            ; do the intelligent wrapping of lines
            (use-package filladapt
              :init (filladapt-mode t))))
