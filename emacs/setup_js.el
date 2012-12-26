(use-package js2-mode
  :init
  (progn
    (setq yas-extra-modes 'javascript-mode)))

;;;_. js2
;; (use-package js2-mode
;;   :init
;;   (progn
;;     ; These three functions came from http://mihai.bazon.net/projects/editing-javascript-with-emacs-js2-mode
;;     (defun skk-js2-indent-function ()
;;       (interactive)
;;       (save-restriction
;;         (widen)
;;         (let* ((inhibit-point-motion-hooks t)
;;                (parse-status (save-excursion (syntax-ppss (point-at-bol))))
;;                (offset (- (current-column) (current-indentation)))
;;                (indentation (espresso--proper-indentation parse-status))
;;                node)

;;           (save-excursion

;;             ;; I like to indent case and labels to half of the tab width
;;             (back-to-indentation)
;;             (if (looking-at "case\\s-")
;;                 (setq indentation (+ indentation (/ espresso-indent-level 2))))

;;             ;; consecutive declarations in a var statement are nice if
;;             ;; properly aligned, i.e:
;;             ;;
;;             ;; var foo = "bar",
;;             ;;     bar = "foo";
;;             (setq node (js2-node-at-point))
;;             (when (and node
;;                        (= js2-NAME (js2-node-type node))
;;                        (= js2-VAR (js2-node-type (js2-node-parent node))))
;;               (setq indentation (+ 4 indentation))))

;;           (indent-line-to indentation)
;;           (when (> offset 0) (forward-char offset)))))


;;     (defun skk-indent-sexp ()
;;       (interactive)
;;       (save-restriction
;;         (save-excursion
;;           (widen)
;;           (let* ((inhibit-point-motion-hooks t)
;;                  (parse-status (syntax-ppss (point)))
;;                  (beg (nth 1 parse-status))
;;                  (end-marker (make-marker))
;;                  (end (progn (goto-char beg) (forward-list) (point)))
;;                  (ovl (make-overlay beg end)))
;;             (set-marker end-marker end)
;;             (overlay-put ovl 'face 'highlight)
;;             (goto-char beg)
;;             (while (< (point) (marker-position end-marker))
;;               ;; don't reindent blank lines so we don't set the "buffer
;;               ;; modified" property for nothing
;;               (beginning-of-line)
;;               (unless (looking-at "\\s-*$")
;;                 (indent-according-to-mode))
;;               (forward-line))
;;             (run-with-timer 0.5 nil '(lambda(ovl)
;;                                        (delete-overlay ovl)) ovl)))))


;;     (defun skk-js2-mode-hook ()
;;       (require 'espresso)
;;       (setq js2-basic-offset 4)
;;       (setq espresso-indent-level 4
;;             indent-tabs-mode nil
;;             c-basic-offset 4)
;;       (c-toggle-auto-state 0)
;;       (c-toggle-hungry-state 1)
;;       (set (make-local-variable 'indent-line-function) 'skk-js2-indent-function)
;;       (define-key js2-mode-map [(meta control |)] 'cperl-lineup)
;;       (define-key js2-mode-map [(meta control \;)] 
;;         '(lambda()
;;            (interactive)
;;            (insert "/* -----[ ")
;;            (save-excursion
;;              (insert " ]----- */"))
;;            ))
;;       (define-key js2-mode-map [(return)] 'newline-and-indent)
;;       (define-key js2-mode-map [(backspace)] 'c-electric-backspace)
;;       (define-key js2-mode-map [(control d)] 'c-electric-delete-forward)
;;       (define-key js2-mode-map [(control meta q)] 'skk-indent-sexp)
;;       (if (featurep 'js2-highlight-vars)
;;           (js2-highlight-vars-mode))
;;       (message "SKK JS2 hook"))

;;     (add-hook 'js2-mode-hook 'skk-js2-mode-hook)


;;     (setq-default js2-allow-rhino-new-expr-initializer nil)
;;     (setq-default js2-auto-indent-p nil)
;;     (setq-default js2-enter-indents-newline nil)
;;     (setq-default js2-global-externs '("module" "require" "jQuery" "$" "_" "buster" "sinon" "assert" "refute" "setTimeout" "clearTimeout" "setInterval" "clearInterval" "location" "__dirname"))
;;     (setq-default js2-idle-timer-delay 0.1)
;;     (setq-default js2-indent-on-enter-key nil)
;;     (setq-default js2-mirror-mode nil)
;;     (setq-default js2-strict-inconsistent-return-warning nil)
;;     (setq-default js2-auto-indent-p t)
;;     (setq-default js2-rebind-eol-bol-keys nil)
;;     (setq-default js2-include-rhino-externs nil)
;;     (setq-default js2-include-gears-externs nil)

;;                                         ;(require 'js2-mode)

;;     (define-key js2-mode-map (kbd "C-c RET jt") 'jump-to-test-file)
;;     (define-key js2-mode-map (kbd "C-c RET ot") 'jump-to-test-file-other-window)
;;     (define-key js2-mode-map (kbd "C-c RET js") 'jump-to-source-file)
;;     (define-key js2-mode-map (kbd "C-c RET os") 'jump-to-source-file-other-window)
;;     (define-key js2-mode-map (kbd "C-c RET jo") 'jump-between-source-and-test-files)
;;     (define-key js2-mode-map (kbd "C-c RET oo") 'jump-between-source-and-test-files-other-window)

;;     (defun js2-hide-test-functions ()
;;       (interactive)
;;       (save-excursion
;;         (goto-char (point-min))
;;         (ignore-errors
;;           (while (re-search-forward "\"[^\"]+\": function (")
;;             (js2-mode-hide-element)))))

;;     (define-key js2-mode-map (kbd "C-c t") 'js2-hide-test-functions)

;;     ;; js2-mode steals TAB, let's steal it back for yasnippet
;;     (defun js2-tab-properly ()
;;       (interactive)
;;       (let ((yas/fallback-behavior 'return-nil))
;;         (unless (yas/expand)
;;           (indent-for-tab-command)
;;           (if (looking-back "^\s*")
;;               (back-to-indentation)))))

;;     (define-key js2-mode-map (kbd "TAB") 'js2-tab-properly)

;;     ;; Use lambda for anonymous functions
;;     (font-lock-add-keywords
;;      'js2-mode `(("\\(function\\) *("
;;                   (0 (progn (compose-region (match-beginning 1)
;;                                             (match-end 1) "\u0192")
;;                             nil)))))

;;     ;; Use right arrow for return in one-line functions
;;     (font-lock-add-keywords
;;      'js2-mode `(("function *([^)]*) *{ *\\(return\\) "
;;                   (0 (progn (compose-region (match-beginning 1)
;;                                             (match-end 1) "\u2190")
;;                             nil)))))))
;; ;;;_. powerline
;; (use-package powerline
;;   :init (progn
;;           (powerline-default)))

;;;_. js2-refactor
(use-package js2-refactor)

;(provide 'setup_js)

