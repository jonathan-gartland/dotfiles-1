; http://www.emacswiki.org/emacs/tiling.el
(use-package tiling
  :init
  (progn
    ;; Windows related operations
    ;; Split & Resize
    (bind-key "C-x |" 'split-window-horizontally)
    (bind-key "C-x _" 'split-kfwindow-vertically)
    (bind-key "C-{" 'shrink-window-horizontally)
    (bind-key "C-}" 'enlarge-window-horizontally)
    (bind-key "C-^" 'enlarge-window-verticially)
    ;; Navgating: Windmove uses C-<up> etc.
    (bind-key "C-c <up>" '  windmove-up)
    (bind-key "C-c <down>" 'windmove-down)
    (bind-key "C-c <right>" 'windmove-right)
    (bind-key "C-c <left>" 'windmove-left)
    ;; Tile
    (bind-key "C-\\" 'tiling-cycle) ; accepts prefix number
    (bind-key "C-M-<up>" 'tiling-tile-up)
    (bind-key "C-M-<down>" 'tiling-tile-down)
    (bind-key "C-M-<right>" 'tiling-tile-right)
    (bind-key "C-M-<left>" 'tiling-tile-left)))
;(provide 'setup_tiling)

