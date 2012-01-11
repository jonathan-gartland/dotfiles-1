;;; skk-colortheme.el --- ColorTheme

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

(when (require 'color-theme)
  (require 'color-theme-github)
  (require 'color-theme-dpaste)
  (require 'color-theme-emacs-revert-theme)
  (require 'color-theme-ir-black)
  (require 'color-theme-railscasts)
  (require 'color-theme-solarized)
  (require 'color-theme-tango)
  (require 'color-theme-tangotango)
  (require 'color-theme-sanityinc-solarized)
  (require 'color-theme-actress)
  (require 'color-theme-dg)
  (require 'color-theme-complexity) 
  (require 'color-theme-wombat)
                                        ;(require 'color-theme-wombat+)
                                        ;(require 'color-theme-twilight)
                                        ;(require 'color-theme-zenburn)
                                        ;(require 'color-theme-active)
                                        ;(color-theme-sanityinc-solarized-dark)
  (require 'color-theme-vim-insert-mode)
  (require 'zenburn)
  (color-theme-zenburn)
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; http://emacs-fu.blogspot.com/2009/03/color-theming.html#c8118197870582055840
(defvar after-make-console-frame-hooks '()
  "Hooks to run after creating a new TTY frame")

(defvar after-make-window-system-frame-hooks '()
  "Hooks to run after creating a new window-system frame")

(defun run-after-make-frame-hooks (frame)
  "Selectively run either `after-make-console-frame-hooks' or
`after-make-window-system-frame-hooks'"
  (select-frame frame)
  (run-hooks (if window-system-version
                 'after-make-window-system-frame-hooks
               'after-make-console-frame-hooks)))

(add-hook 'after-make-frame-functions 'run-after-make-frame-hooks)
(add-hook 'after-init-hook
          (lambda ()
            (run-after-make-frame-hooks (selected-frame))))

(set-variable 'color-theme-is-global nil)
(add-hook 'after-make-window-system-frame-hooks 'zenburn)
(add-hook 'after-make-console-frame-hooks 'zenburn);
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(provide 'skk-colortheme)
;;; skk-colortheme.el ends here
