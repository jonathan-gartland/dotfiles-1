; http://emacsrocks.com/e10.html

;; Push mark when using ido-imenu
(defvar push-mark-before-goto-char nil)

(defadvice goto-char (before push-mark-first activate)
  (when push-mark-before-goto-char
    (push-mark)))

; https://gist.github.com/2360578
(defun ido-imenu ()
  "Update the imenu index and then use ido to select a symbol to navigate to.
Symbols matching the text at point are put first in the completion list."
  (interactive)
  (imenu--make-index-alist)
  (let ((name-and-pos '())
        (symbol-names '()))
    (flet ((addsymbols (symbol-list)
                       (when (listp symbol-list)
                         (dolist (symbol symbol-list)
                           (let ((name nil) (position nil))
                             (cond
                              ((and (listp symbol) (imenu--subalist-p symbol))
                               (addsymbols symbol))

                              ((listp symbol)
                               (setq name (car symbol))
                               (setq position (cdr symbol)))

                              ((stringp symbol)
                               (setq name symbol)
                               (setq position (get-text-property 1 'org-imenu-marker symbol))))

                             (unless (or (null position) (null name))
                               (add-to-list 'symbol-names name)
                               (add-to-list 'name-and-pos (cons name position))))))))
      (addsymbols imenu--index-alist))
    ;; If there are matching symbols at point, put them at the beginning of `symbol-names'.
    (let ((symbol-at-point (thing-at-point 'symbol)))
      (when symbol-at-point
        (let* ((regexp (concat (regexp-quote symbol-at-point) "$"))
               (matching-symbols (delq nil (mapcar (lambda (symbol)
                                                     (if (string-match regexp symbol) symbol))
                                                   symbol-names))))
          (when matching-symbols
            (sort matching-symbols (lambda (a b) (> (length a) (length b))))
            (mapc (lambda (symbol) (setq symbol-names (cons symbol (delete symbol symbol-names))))
                  matching-symbols)))))
    (let* ((selected-symbol (ido-completing-read "Symbol? " symbol-names))
           (position (cdr (assoc selected-symbol name-and-pos))))
      (goto-char position))))


;;;_. Emacs Rocks

;;;_. Emacs Rocks 04
; http://www.emacswiki.org/emacs/IyGoToChar
; iy-go-to-char - like f in Vim
(use-package jump-char
  :init
  (progn
    (bind-key "M-m" 'jump-char-forward)
    (bind-key "M-M" 'jump-char-backward)

    ;; Remap old M-m to M-i (better mnemonic for back-to-indentation)
    ;; We lose tab-to-tab-stop, which is no big loss in my use cases.
    (bind-key "M-i" 'back-to-indentation)))

;;;_. Emacs Rocks 04
;; Expand region (increases selected region by semantic units)
(use-package expand-region
  :init
  (progn
    (bind-key "C-=" 'er/expand-region)))

;;;_. Emacs Rocks 10
; http://www.emacswiki.org/emacs/AceJump
(use-package ace-jump-mode
  :init
  (progn
    (bind-key "C-c " 'ace-jump-mode)))

;; Push mark when using ido-imenu

(defvar push-mark-before-goto-char nil)

(defadvice goto-char (before push-mark-first activate)
  (when push-mark-before-goto-char
    (push-mark)))

(defun add-hyper-char-to-ace-jump-word-mode (c)
  (define-key global-map
    (read-kbd-macro (concat "H-" (string c)))
    `(lambda ()
       (interactive)
       (setq ace-jump-query-char ,c)
       (setq ace-jump-current-mode 'ace-jump-word-mode)
       (ace-jump-do (concat "\\b"
                            (regexp-quote (make-string 1 ,c)))))))

(loop for c from ?0 to ?9 do (add-hyper-char-to-ace-jump-word-mode c))
(loop for c from ?A to ?Z do (add-hyper-char-to-ace-jump-word-mode c))
(loop for c from ?a to ?z do (add-hyper-char-to-ace-jump-word-mode c))
(loop for c from ?Å to ?ø do (add-hyper-char-to-ace-jump-word-mode c))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
