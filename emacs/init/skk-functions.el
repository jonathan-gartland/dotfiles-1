;;; skk-functions.el --- Misc. Functions

;; Copyright (C) 2009  skk

;; Author: skk <skk@localhost.localdomain>
;; Keywords: 

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; 

;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; compilation; if compilation is successful, autoclose the compilation win
;; http://www.emacswiki.org/cgi-bin/wiki/ModeCompile
;; TODO: don't hide when there are warnings either (not just errors)
(setq compilation-window-height 12)
(setq compilation-finish-functions 'compile-autoclose)
(defun compile-autoclose (buffer string)
  (cond ((and (string-match "finished" string)
           (not (string-match "warning" string)))
          (message "Build maybe successful: closing window.")
          (run-with-timer 2 nil                      
            'delete-window              
            (get-buffer-window buffer t)))
    (t (message "Compilation exited abnormally: %s" string))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun djcb-count-words (&optional begin end)
  "if there's a region, count words between BEGIN and END; otherwise in buffer" 
  (interactive "r")
  (let ((b (if mark-active begin (point-min)))
      (e (if mark-active end (point-max))))
    (message "Word count: %s" (how-many "\\w+" b e))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; number-lines and line-numbers
(defun number-lines-region (start end &optional beg)
      (interactive "*r\np")
      (let* ((lines (count-lines start end))
             (from (or beg 1))
             (to (+ lines (1- from)))
             (numbers (number-sequence from to))
             (width (max (length (int-to-string lines))
                         (length (int-to-string from)))))
        (if (= start (point))
            (setq numbers (reverse numbers)))
        (goto-char start)
        (dolist (n numbers)
          (beginning-of-line)
          (save-match-data
            (if (looking-at " *-?[0-9]+\\. ")
                (replace-match "")))
          (insert (format (concat "%" (int-to-string width) "d. ") n))
          (forward-line))))

(require 'linum)
(global-linum-mode 1) 		; enable display of line-numbers to left of buffer
(setq linum-format "%d ") 	; update linum's format
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




(provide 'skk-functions)
;;; skk-functions.el ends here
