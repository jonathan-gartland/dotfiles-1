;;; skk-textmode.el --- 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; text-mode
(defun djcb-text-mode-hook ()
  (interactive)
  (set-fill-column 78)                    ; lines are 78 chars long ...         
  (auto-fill-mode t)                      ; ... and wrapped around automagically
  (set-input-method "latin-1-prefix")     ; make " + e => ë etc.
  
  (when (require-maybe 'filladapt) ; do the intelligent wrapping of lines,...
    (filladapt-mode t))) ; ... (bullets, numbering) if
                                        ; available
(add-hook 'text-mode-hook 'djcb-text-mode-hook)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; text-mode
(defun djcb-text-mode-hook ()
  (interactive)
  (set-fill-column 78)                    ; lines are 78 chars long ...         
  (auto-fill-mode t)                      ; ... and wrapped around automagically
  (set-input-method "latin-1-prefix")     ; make " + e => ë etc.
  
  (when (require-maybe 'filladapt) ; do the intelligent wrapping of lines,...
    (filladapt-mode t))) ; ... (bullets, numbering) if
                                        ; available
(add-hook 'text-mode-hook 'djcb-text-mode-hook)



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

;;; Code:
;; 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; text-mode
(defun djcb-text-mode-hook ()
  (interactive)
  (set-fill-column 78)                    ; lines are 78 chars long ...         
  (auto-fill-mode t)                      ; ... and wrapped around automagically
  (set-input-method "latin-1-prefix")     ; make " + e => ë etc.
  
  (when (require-maybe 'filladapt) ; do the intelligent wrapping of lines,...
    (filladapt-mode t))) ; ... (bullets, numbering) if
                                        ; available
(add-hook 'text-mode-hook 'djcb-text-mode-hook)



(provide 'skk-textmode)
;;; skk-textmode.el ends here
