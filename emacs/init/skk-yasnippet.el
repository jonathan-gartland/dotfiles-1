;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; yasnippet
(when (require-maybe 'yasnippet)

  ; Initialize Yasnippet
  (yas/initialize)
  (setq yas/use-menu 'abbreviate)

  (yas/global-mode 1)

  ;set yas/root-directory as a list, to allow for adding user snippets 
  (setq yas/root-directory '(
                           "~/.emacs.d/snippets"
                           "~/.emacs.d/el-get/yasnippet/snippets"))

  ;; Map `yas/load-directory' to every element
  (mapc 'yas/load-directory yas/root-directory))
