

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; autoload wanderlust
(autoload 'wl "wl" "wanderlust" t)
(autoload 'wl-draft "wl" "Write draft with Wanderlust." t)
(autoload 'wl-other-frame "wl" "Wanderlust on new frame." t)
(setq wl-icon-directory "~/.emacs.d/elisp/wanderlust/pixmaps/")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; load w3m
(require 'octet)
(octet-mime-setup)

(setq 
  elmo-maildir-folder-path "~/Maildir"          ;; where i store my mail

  wl-stay-folder-window t                       ;; show the folder pane (left)
  wl-folder-window-width 25                     ;; toggle on/off with 'i'
  

  wl-smtp-posting-server "localhost"            ;; put the smtp server here
  wl-local-domain "zathras.sr.unh.edu"          ;; put something here...
  wl-message-id-domain "zathras.sr.unh.edu"     ;; ...
;  wl-from "Steven Knight <steven.knight@unh.edu>"                  ;; my From:


  ;; note: all below are dirs (Maildirs) under elmo-maildir-folder-path 
  ;; the '.'-prefix is for marking them as maildirs
  wl-fcc ".Sent"                       ;; sent msgs go to the "sent"-folder
  wl-fcc-force-as-read t               ;; mark sent messages as read 
  wl-default-folder ".MaildirInbox"           ;; my main inbox 
  wl-draft-folder ".Drafts"            ;; store drafts in 'postponed'
  wl-trash-folder ".Trash"             ;; put trash in 'trash'
  wl-spam-folder ".Junk"              ;; ...spam as well
  wl-queue-folder ".Queue"             ;; we don't use this

  ;; check this folder periodically, and update modeline
  wl-biff-check-folder-list '(".todo") ;; check every 180 seconds
                                       ;; (default: wl-biff-check-interval)

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
;;; Draft:
;elmo-imap4-default-server
(setq wl-draft-config-alist
      '(
       ((string-match ".*knight.*" user-login-name)
        ("From" . "Steven Knight <steven.knight@unh.edu>")
         (message wl-draft-parent-folder)
         (signature . "~/.signature"))

       ((string-match ".*skk.*" user-login-name)
         ("From" . "Steven Knight <skk@sr.unh.edu>")
         ("Organization" . "UNH-UNH")
         (message wl-draft-parent-folder)
         (signature . "~/.signature"))
       )

      wl-draft-reply-without-argument-list
      '(("Followup-To" .
         (("Mail-Followup-To" "Mail-Reply-To" "Reply-To") nil ("Followup-To")))
        ("Mail-Followup-To" .
         (("Mail-Followup-To") nil nil))
         ("Mail-Reply-To" .
         (("Mail-Reply-To" "Reply-To") nil nil))
        ("Reply-To" .
         (("Reply-To") nil nil))
        (wl-draft-self-reply-p . (("To") nil))
        ("From" . (("From") nil nil)))

      )

