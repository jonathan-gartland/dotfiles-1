
;(require 'quack)
(require 'geiser-install)

;; (setq slime-lisp-implementations
;;       '((mit-scheme ("mit-scheme") :init mit-scheme-init)))

;; (defun mit-scheme-init (file encoding)
;;   (format "%S\n\n"
;; 	  `(begin
;; 	    (load-option 'format)
;; 	    (load-option 'sos)
;; 	    (eval 
;; 	     '(construct-normal-package-from-description
;; 	       (make-package-description '(swank) '(()) 
;; 					 (vector) (vector) (vector) false))
;; 	     (->environment '(package)))
;; 	    (load ,(expand-file-name 
;; 		    "~/.emacs.d/el-get/slime/contrib/swank-mit-scheme.scm" ; <-- insert your path
;; 		    slime-path)
;; 		  (->environment '(swank)))
;; 	    (eval '(start-swank ,file) (->environment '(swank))))))

;; (defun mit-scheme ()
;;   (interactive)
;;   (slime 'mit-scheme))

;; (defun find-mit-scheme-package ()
;;   (save-excursion
;;     (let ((case-fold-search t))
;;       (and (re-search-backward "^[;]+ package: \\((.+)\\).*$" nil t)
;; 	   (match-string-no-properties 1)))))

;; (setq slime-find-buffer-package-function 'find-mit-scheme-package)
;; (add-hook 'scheme-mode-hook (lambda () (slime-mode 1)))

(provide 'skk-scheme)
;;; skk-scheme.el ends here
