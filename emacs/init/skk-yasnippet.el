;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; yasnippet
(when (require-maybe 'yasnippet))
; Initialize Yasnippet
(yas/initialize)
(setq yas/use-menu 'abbreviate)

;set yas/root-directory as a list, to allow for adding user snippets 
(setq yas/root-directory '("~/.emacs.d/elisp/yasnippet-0.6.1c"))

;; Map `yas/load-directory' to every element
(mapc 'yas/load-directory yas/root-directory)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
