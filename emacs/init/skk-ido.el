;;; skk-ido.el --- 

(when (require-maybe 'ido)
    (ido-mode t)
    (setq ido-enable-flex-matching t)) ;; enable fuzzy matching

(provide 'skk-ido)
;;; skk-ido.el ends here
