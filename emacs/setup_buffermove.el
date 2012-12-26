(use-package buffer-move
  :init
  (progn
    ;; Swap buffers: M-<up> etc.
    (bind-key "M-<up>" 'buf-move-up)
    (bind-key "M-<down>" 'buf-move-down)
    (bind-key "M-<right>" 'buf-move-right)
    (bind-key "M-<left>" 'buf-move-left)))
;(provide 'setup_buffermove)
