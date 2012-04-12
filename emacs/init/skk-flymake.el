
(add-to-list 'load-path "~/.emacs.d/elisp/emacs-flymake")

;; Let's run 8 checks at once instead.
(setq flymake-max-parallel-syntax-checks 4)

;; Yes, I want my copies in the same dir as the original.
(setq flymake-run-in-place nil)

;; This lets me say where my temp dir is.
(setq temporary-file-directory "~/.emacs.d/.cache/")

;; I want to see at most the first 4 errors for a line.
(setq flymake-number-of-errors-to-display 4)

; set perl-lib-dir

;;; skk-flymake.el ends here
