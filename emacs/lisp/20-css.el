; http://blog.gabrielsaldana.org/easy-css-editing-with-emacs/
; CSS and Rainbow modes 
(defun all-css-modes() (css-mode) (rainbow-mode)) 

;; Load both major and minor modes in one call based on file type 
(add-to-list 'auto-mode-alist '("\\.css$" . all-css-modes)) 

