; http://nschum.de/src/emacs/company-mode/
(autoload 'company-mode "company" nil t)
(setq company-minimum-prefix-length 1)

;(require 'pysmell)
;(add-hook 'python-mode-hook (lambda () (pysmell-mode 1)))

;(require 'company-ropemacs) ; needs pymacs
(require 'company-abbrev)
(require 'company-css)
(require 'company-elisp)
(require 'company-etags)
(require 'company-ispell)
(require 'company-files)
(require 'company-nxml)

(defun indent-or-complete ()
    (interactive)
    (if (looking-at "\\_>")
        (company-complete-common)
      (indent-according-to-mode)))


(setq company-show-numbers nil)
(dolist (hook (list
               'emacs-lisp-mode-hook
               'lisp-mode-hook
               'lisp-interaction-mode-hook
               ; 'cperl-mode-hook
               ; 'quack-mode-hook
               ;'c-mode-hook
               ;'c++-mode-hook
               ;'java-mode-hook
               'sh-mode-hook
               ))
  (add-hook hook 'company-mode))


(global-set-key "\t" 'indent-or-complete)
