; http://www.emacswiki.org/emacs/ModeCompile
 ;;mode-compile
(use-package mode-compile
  :init
  (progn
    (bind-key "\C-cc" 'mode-compile)
    (bind-key "\C-ck" 'mode-compile-kill)))
