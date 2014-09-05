(use-package buffer-move
  :init
  (progn
    (bind-key "C-S-<up>" 'buf-move-up)
    (bind-key "C-S-<down>" 'buf-move-down)
    (bind-key "C-S-<right>" 'buf-move-right)
    (bind-key "C-S-<left>" 'buf-move-left)
))
