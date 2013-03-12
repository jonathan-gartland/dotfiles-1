(use-package rect-mark
  :init
  (progn
    (bind-key "C-x r C-SPC" 'rm-set-mark)
    (bind-key "C-x r C-x" 'rm-exchange-point-and-mark)
    (bind-key "C-x r C-w" 'rm-kill-region)
    (bind-key "C-x r M-w" 'rm-kill-ring-save)

    (autoload 'rm-set-mark "rect-mark"
      "Set mark for rectangle." t)
    (autoload 'rm-exchange-point-and-mark "rect-mark"
      "Exchange point and mark for rectangle." t)
    (autoload 'rm-kill-region "rect-mark"
      "Kill a rectangular region and save it in the kill ring." t)
    (autoload 'rm-kill-ring-save "rect-mark"
      "Copy a rectangular region to the kill ring." t)))