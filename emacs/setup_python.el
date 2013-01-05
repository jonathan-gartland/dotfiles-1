(use-package python)

(defconst python_mode_path (file-truename "~/.emacs.d/vendor/python-mode.el-6.1.0"))

(add-to-list 'load-path python_mode_path) 
(setq py-install-directory python_mode_path)
(require 'python-mode)

;; ;;;_. python
;; (use-package python-mode
;;  :mode ("\\.py$" . python-mode)
;;   :interpreter ("python" . python-mode)
;;   :init
;;   (progn
;;     ;; ; pymacs
;;     ;; (require 'pymacs)
;;     ;; (autoload 'pymacs-load "pymacs" nil t)
;;     ;; (autoload 'pymacs-eval "pymacs" nil t)
;;     ;; (autoload 'pymacs-apply "pymacs")
;;     ;; (autoload 'pymacs-call "pymacs")

;;     ;; ;; Initialize Rope
;;     ;; (pymacs-load "ropemacs" "rope-")
;;     ;; (setq ropemacs-enable-autoimport t)
;;     ;; (setq ropemacs-guess-project t)

;;     ;; Initialize company-mode
;;     (add-hook 'python-mode-hook (lambda () 
;;                                   (progn
;;                                     ;(company-mode)
;;                                     (set-variable 'py-indent-offset 4)
;;                                     (set-variable 'py-smart-indentation nil)
;;                                     (set-variable 'indent-tabs-mode nil)
;;                                     (show-paren-mode 1)
;;                                     (eldoc-mode 1))))

;;     ;(when (load "flymake" t)
;;     ;  (defun flymake-pychecker-init ()
;;     ;    (let* ((temp-file (flymake-init-create-temp-buffer-copy
;;     ;                       'flymake-create-temp-inplace))
;;     ;           (local-file (file-relative-name
;;     ;                        temp-file
;;     ;                        (file-name-directory buffer-file-name))))
;;     ;      (list "pychecker"  (list local-file))))
;;     ;  (add-to-list 'flymake-allowed-file-name-masks '("\\.py\\'" flymake-pychecker-init)))
;;     ;(add-hook 'find-file-hook 'flymake-find-file-hook)
;;     ))


;(provide 'setup_python)

