
(require 'hexrgb)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; icicles
(when (require-maybe 'icicles)
  (icy-mode 1))

; load highlight line, and set it to highlight line when idle
; hl-line+ requires icicles
(when (require-maybe 'hl-line+)
  (toggle-hl-line-when-idle 1)) ; Highlight only when idle
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; lacarte
(when (require-maybe 'lacarte)
    (global-set-key [?\M-`] 'lacarte-execute-menu-command))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
