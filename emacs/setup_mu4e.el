;;; setup_mu4e.el --- 

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

;;; Commentary:

;; 

;;; Code:

(use-package mu4e
  :init
  (progn 
    (visual-line-mode)

    ;; Only needed if your maildir is _not_ ~/Maildir
    (setq 
     mu4e-maildir "/home/skk/Maildir"
     
     ; set mu4e as mail-user-agent
     mail-user-agent 'mu4e-user-agent
     
     mu4e-update-interval 15

     ;; when you want to use some external command for text->html conversion,
     ;; i.e., the 'html2text' program
     mu4e-html2text-command "html2text"
     
     ;; the headers to show in the headers list -- a pair of the field + its
     ;; width, with `nil' meaning 'unlimited' (better only use that for
     ;; the last field. These are the defaults:
     mu4e-headers-fields
     '( (:date          .  25)
        (:flags         .   5)
        (:from          .  20)
        (:to             . 20)
        (:subject       .  nil))
     
     ;; program to get mail; alternatives are 'fetchmail', 'getmail'
     ;; isync or your own shellscript. called when 'U' is pressed in
     ;; main view
     mu4e-get-mail-command "true"

     ;; enable verbose/debug 
     mu4e-debug t
     
     message-send-mail-function 'message-send-mail-with-sendmail

     message-citation-line-format "On %a, %b %d %Y at %r, %N wrote:"

     message-citation-line-function (quote message-insert-formatted-citation-line)

     ;; general emacs mail settings; used when composing e-mail
     mu4e-reply-to-address "skk@sr.unh.edu"
     user-mail-address "skk@sr.unh.edu"
     user-full-name  "Steven Knight"

     ;; below are the defaults; if they do not exist yet, mu4e will offer to
     ;; create them
     mu4e-sent-folder   "/Sent"
     mu4e-drafts-folder "/Drafts"
     mu4e-trash-folder  "/Trash")

    (setq mu4e-use-fancy-chars t
        mu4e-headers-draft-mark     '("D" . "⚒ ")  ; draft
        mu4e-headers-seen-mark      '("S" . "☑ ")  ; seen
        mu4e-headers-unseen-mark    '("u" . "☐ ")  ; unseen
        mu4e-headers-flagged-mark   '("F" . "⚵ ")  ; flagged
        mu4e-headers-new-mark       '("N" . "✉ ")  ; new
        mu4e-headers-replied-mark   '("R" . "↵ ")  ; replied
        mu4e-headers-passed-mark    '("P" . "⇉ ")  ; passed
        mu4e-headers-encrypted-mark '("x" . "⚷ ")  ; encrypted
        mu4e-headers-signed-mark    '("s" . "✍ ")) ; signed
    
    (setq mu4e-bookmarks (list))
    (add-to-list 'mu4e-bookmarks
                 '("flag:unread AND NOT maildir:/Sent AND NOT flag:trashed AND NOT maildir:/Junk"
                   "Unread messages" ?u))
    (add-to-list 'mu4e-bookmarks
                 '("date:today..now AND NOT maildir:/Sent AND NOT flag:trashed AND NOT maildir:/Junk AND NOT maildir:/Trash AND NOT maildir:/Root AND NOT maildir:/Home/Trash"
                   "Today's messages" ?t))
    (add-to-list 'mu4e-bookmarks
                 '("date:7d..now AND NOT maildir:/Sent AND NOT flag:trashed AND NOT maildir:/Junk AND NOT maildir:/Trash AND NOT maildir:/Root AND NOT maildir:/Home/Trash"
                   "Last 7 days"?w))
    (add-to-list 'mu4e-bookmarks '("flag:unread" "Unread messages (ALL)" ?U))
    (add-to-list 'mu4e-bookmarks '("date:today..now" "Today's messages (ALL)" ?T))
    (add-to-list 'mu4e-bookmarks '("date:7d..now" "Last 7 days (ALL)" ?W))
    (global-set-key [XF86Mail] 'mu4e))
)

;(use-package org-mu4e
;  :progn
;  (setq org-mu4e-convert-to-html t))

;(setq mu4e-compose-complete-only-person t)
;(setq mu4e-compose-complete-ignore-address-regexp t)

;(provide 'setup_mu4e)

