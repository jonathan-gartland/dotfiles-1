(when djcb-linux-p

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; python
(setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
(autoload 'python-mode "python-mode" "Python editing mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

; pymacs
(require 'pymacs)
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
                                (set-variable 'indent-tabs-mode nil)
                                (show-paren-mode 1)
                                (eldoc-mode 1))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ; flymake
;; (when (load "flymake" t)
;;   (defun flymake-pychecker-init ()
;;     (let* ((temp-file (flymake-init-create-temp-buffer-copy
;;                        'flymake-create-temp-inplace))
;;            (local-file (file-relative-name
;;                         temp-file
;;                         (file-name-directory buffer-file-name))))
;;       (list "pychecker"  (list local-file))))
;; (add-to-list 'flymake-allowed-file-name-masks '("\\.py\\'" flymake-pychecker-init)))

;; (add-hook 'find-file-hook 'flymake-find-file-hook)
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ; ipython/emacs
;; (require 'ipython)
;; (setenv "PYMACS_PYTHON" "python2.6") 
;; (setq py-python-command-args '( "-colors" "Linux"))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
)
