

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; autoload wanderlust
(autoload 'wl "wl" "wanderlust" t)
(autoload 'wl-draft "wl" "Write draft with Wanderlust." t)
(autoload 'wl-other-frame "wl" "Wanderlust on new frame." t)
(setq wl-icon-directory "~/.emacs.d/elisp/wanderlust/pixmaps/")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; autoload wanderlust
 (setq browse-url-browser-function 'w3m-browse-url)
 (autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
 ;; optional keyboard short-cut
 (global-set-key "\C-xm" 'browse-url-at-point)
 (setq w3m-use-cookies t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; load w3m
(require 'octet)
(octet-mime-setup)

(setq 
  elmo-maildir-folder-path "~/Maildir"          ;; where i store my mail

  wl-stay-folder-window t                       ;; show the folder pane (left)
  wl-folder-window-width 25                     ;; toggle on/off with 'i'
  
  ;; note: all below are dirs (Maildirs) under elmo-maildir-folder-path 
  ;; the '.'-prefix is for marking them as maildirs
  wl-fcc-force-as-read t               ;; mark sent messages as read 
  wl-default-folder ".MaildirInbox"           ;; my main inbox 
  wl-draft-folder ".Drafts"            ;; store drafts in 'postponed'
  wl-trash-folder ".Trash"             ;; put trash in 'trash'
  wl-spam-folder ".Junk"              ;; ...spam as well
  wl-queue-folder ".Queue"             ;; we don't use this

   ;; hide many fields from message buffers
  wl-message-ignored-field-list '("^.*:")
  wl-message-visible-field-list
  '("^\\(To\\|Cc\\):"

    "^Subject:"
    "^\\(From\\|Reply-To\\):"
    "^Organization:"
    "^Message-Id:"
    "^\\(Posted\\|Date\\):"
    )
  wl-message-sort-field-list
  '("^From"
    "^Organization:"
    "^X-Attribution:"
     "^Subject"
     "^Date"
     "^To"
     "^Cc"))

; enable ssl
(setq ssl-certificate-verification-policy 1)
(setq elmo-imap4-default-stream-type 'ssl)

;; Set mail-icon to be shown universally in the modeline.
(setq global-mode-string
      (cons
       '(wl-modeline-biff-status
         wl-modeline-biff-state-on
         wl-modeline-biff-state-off)
       global-mode-string))

;; Use wanderlust for default compose-mail
(if (boundp 'mail-user-agent)
    (setq mail-user-agent 'wl-user-agent))
(if (fboundp 'define-mail-user-agent)
    (define-mail-user-agent
      'wl-user-agent
      'wl-user-agent-compose
      'wl-draft-send
      'wl-draft-kill
      'mail-send-hook))


;; ----------------------------------------------------------------------------
;;; Summary

(setq wl-auto-select-next 'unread
      wl-summary-width nil
      wl-summary-weekday-name-lang "en"
      wl-summary-showto-folder-regexp ".Sent.*"
      ;;wl-summary-line-format "%n%T%P%M/%D(%W)%h:%m %t%[%17(%c %f%) %] %s"
      wl-summary-line-format "%T%P%M/%D(%W)%h:%m %[ %17f %]%[%1@%] %t%C%s"

      ;; Summary threads
      wl-thread-insert-opened t
      wl-thread-open-reading-thread t
     )


;;; Configure BBDB to manage Email addresses
(require 'bbdb-wl)
(bbdb-wl-setup)

(setq bbdb-use-pop-up t ;; Allow pop-ups
      bbdb-pop-up-target-lines 2
      bbdb/mail-auto-create-p t ;; auto collection
      bbdb-wl-ignore-folder-regexp "^@" ;; folders without auto collection
      bbdb-north-american-phone-numbers-p nil
      bbdb-auto-notes-alist '(("X-ML-Name" (".*$" ML 0)))
      bbdb-dwim-net-address-allow-redundancy t
      bbdb-file "~/.emacs.d/bbdb"
      ;; shows the name of bbdb in the summary

      ;; Not with wl-summary-showto-folder-regexp
      ;;wl-summary-from-function 'bbdb-wl-from-func
      ;; Use the default:
      wl-summary-from-function 'wl-summary-default-from

      ;; Using BBDB for pet names is OK
      wl-summary-get-petname-function 'bbdb-wl-get-petname
      )



;; ----------------------------------------------------------------------------
(setq 
    wl-draft-config-matchone t
    wl-draft-config-alist
    '(((string-match "work" wl-draft-parent-folder)
       ("From" . "Steven Knight <skk@sr.unh.edu>")
       (wl-envelope-from . "skk@sr.unh.edu")
       (wl-message-id-domain . "zathras.sr.unh.edu")
       ("Fcc" . "%Sent:skk@zathras.sr.unh.edu:993")
       (wl-smtp-posting-server . "localhost")
       (signature-file-name "~/.dotfiles/signature.work")
       (signature-insert-at-eof t)
       (signature-delete-blank-lines-at-eof t))
      ((string-match "personal" wl-draft-parent-folder)
       ("From" . "Steven Knight <steven.knight@unh.edu>")
       (wl-envelope-from . "skk@sr.unh.edu")
       (wl-message-id-domain . "unh.edu")
       ("Fcc" . "%Sent:knight@zathras.sr.unh.edu:993")
       (wl-smtp-posting-server . "localhost")
       (signature-file-name "~/.dotfiles/signature.personal")
       (signature-insert-at-eof t)
       (signature-delete-blank-lines-at-eof t))))
