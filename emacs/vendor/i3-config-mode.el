;;; i3-config-mode.el --- 

;; Copyright (C) 2012  Steven Knight

;; Author: Steven Knight <skk@sr.unh.edu>
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



(define-derived-mode i3-config-mode text-mode
                     "i3-config-mode" "Major mode for editing configuration files for i3 (http://i3wm.org/)."
                     
  (defvar i3-config-keywords
    '("set" "exec" "exec_alwyas" "bindsym" "bindcode" "font"
      "floating_modifier" "floating_minimum_size" "floating_maximum_size"
      "default_orientation" "workspace_layout" "new_window" "hide_edge_borders"
      "for_window" "assign" "workspace" "colorclass" "ipc-socket" "focus_follows_mouse"
      "popup_during_fullscreen" "force_focus_wrapping" "force_xinerama" "workspace_auto_back_and_forth")
    "i3 Config keywords")
  
  (defvar i3-config-types
  '()
  "i3 Config types.")

  (defvar i3-config-constants
    '()
    "i3 Config constants.")

  (defvar i3-config-events
    '()
    "i3 Config events.")

  (defvar i3-config-functions
    '()
    "i3 Config functions.")

  (defvar i3-config-keywords-regexp (regexp-opt i3-config-keywords 'words))
  (defvar i3-config-type-regexp (regexp-opt i3-config-types 'words))
  (defvar i3-config-constant-regexp (regexp-opt i3-config-constants 'words))
  (defvar i3-config-event-regexp (regexp-opt i3-config-events 'words))
  (defvar i3-config-functions-regexp (regexp-opt i3-config-functions 'words))


  (setq i3-config-font-lock-keywords
  `(
    (,i3-config-type-regexp . font-lock-type-face)
    (,i3-config-constant-regexp . font-lock-constant-face)
    (,i3-config-event-regexp . font-lock-builtin-face)
    (,i3-config-functions-regexp . font-lock-function-name-face)
    (,i3-config-keywords-regexp . font-lock-keyword-face)
    ;; note: order above matters.  
    ))
  
  ;; code for syntax highlighting
  (setq font-lock-defaults '((i3-config-font-lock-keywords)))

  ;; clear memory
  (setq i3-config-keywords nil)
  (setq i3-config-types nil)
  (setq i3-config-constants nil)
  (setq i3-config-events nil)
  (setq i3-config-functions nil))



(provide 'i3-config-mode)
