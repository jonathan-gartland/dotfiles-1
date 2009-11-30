;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; python
(setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
(autoload 'python-mode "python-mode" "Python editing mode." t)

;(add-hook 'python-mode-hook (lambda () (

(autoload 'pymacs-load "pymacs" nil t)
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")

;; Initialize Rope
(pymacs-load "ropemacs" "rope-")
(setq ropemacs-enable-autoimport t)
(setq ropemacs-guess-project t)

;; Initialize company-mode
(add-hook 'python-mode-hook (lambda () 
                              (company-mode)
                              (progn
                                (set-variable 'py-indent-offset 4)
                                (set-variable 'py-smart-indentation nil)
                                (set-variable 'indent-tabs-mode nil))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Run pyflakes with flymake.
; From https://dev.launchpad.net/EmacsTips
(when (load "flymake" t)
  (defun flymake-pyflakes-init ()


	(let* ((temp-file (flymake-init-create-temp-buffer-copy 'flymake-create-temp-inplace))
			 (local-file (file-relative-name temp-file
											 (file-name-directory buffer-file-name))))
	  (list "pyflakes" (list local-file))))

  	(add-to-list 'flymake-allowed-file-name-masks '("\\.py\\'" flymake-pyflakes-init)))
(add-hook 'find-file-hook 'flymake-find-file-hook)

;; Work around bug in flymake that causes Emacs to hang when you open a
;; docstring.
(delete '(" *\\(\\[javac\\]\\)? *\\(\\([a-zA-Z]:\\)?[^:(\t\n]+\\)\:\\([0-9]+\\)\:[ \t\n]*\\(.+\\)" 
			2 4 nil 5) flymake-err-line-patterns)

;; And the same for the emacs-snapshot in Hardy ... spot the difference
(delete '(" *\\(\\[javac\\] *\\)?\\(\\([a-zA-Z]:\\)?[^:(        \n]+\\):\\([0-9]+\\):[  \n]*\\(.+\\)" 
			2 4 nil 5) flymake-err-line-patterns)
(delete '(" *\\(\\[javac\\] *\\)?\\(\\([a-zA-Z]:\\)?[^:(        \n]+\\):\\([0-9]+\\):[  \n]*\\(.+\\)" 
			2 4 nil 5) flymake-err-line-patterns)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ipython/emacs
(require 'ipython)
(setenv "PYMACS_PYTHON" "python2.6") 
(setq py-python-command-args '( "-colors" "Linux"))
(add-hook 'python-mode-hook '(lambda () (eldoc-mode 1)) t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(show-paren-mode 1)

;)))

