(use-package phi-rectangle
  :init
  (progn
    (bind-key "C-x r C-SPC" 'phi-rectangle-set-mark)
    (bind-key "C-x r C-x" 'phi-rectangle-exchange-point-and-mark)
    (bind-key "C-x r C-w" 'phi-rectangle-kill-region)
    (bind-key "C-x r M-w" 'phi-rectangle-kill-ring-save)

    (autoload 'phi-rectangle-set-mark "rect-mark"
      "Set mark for rectangle." t)
    (autoload 'phi-rectangle-exchange-point-and-mark "rect-mark"
      "Exchange point and mark for rectangle." t)
    (autoload 'phi-rectangle-kill-region "rect-mark"
      "Kill a rectangular region and save it in the kill ring." t)
    (autoload 'phi-rectangle-kill-ring-save "rect-mark"
      "Copy a rectangular region to the kill ring." t)))
