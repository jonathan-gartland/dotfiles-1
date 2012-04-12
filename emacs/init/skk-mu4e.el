
(defconst mu4e-path (file-truename "~/local/share/emacs/site-lisp/mu4e/"))

(if (file-accessible-directory-p mu4e-path)
    '( (add-to-list 'load-path mu4e-path)
       (require 'mu4e)
       ;; happily, below settings are all /optional/

       ;; Only needed if your maildir is _not_ ~/Maildir
       (setq 
        mu4e-maildir "/home/skk/MaildirWork"

        ;; when you want to use some external command for text->html conversion,
        ;; i.e., the 'html2text' program
        mu4e-html2text-command "html2text"
     
        ;; the headers to show in the headers list -- a pair of the field + its
        ;; width, with `nil' meaning 'unlimited' (better only use that for
        ;; the last field. These are the defaults:
        mu4e-headers-fields
         '( (:date          .  25)
            (:flags         .   6)
            (:from          .  22)
            (:subject       .  nil))
     
        ;; program to get mail; alternatives are 'fetchmail', 'getmail'
        ;; isync or your own shellscript. called when 'U' is pressed in
        ;; main view
        mu4e-get-mail-command "offlineimap"

        ; location of mu binary
        mu4e-mu-binary "/home/skk/local/bin/mu"

        ;; general emacs mail settings; used when composing e-mail
        mu4e-reply-to-address "skk@sr.unh.edu"
        user-mail-address "skk@sr.unh.edu"
        user-full-name  "Steven Knight"

       ;; these must start with a "/", and must exist
       ;; (i.e.. /home/user/Maildir/sent must exist)
       ;; you use e.g. 'mu mkdir' to make the Maildirs if they don't
       ;; already exist

       ;; below are the defaults; if they do not exist yet, mu4e will offer to
       ;; create them
       setq mu4e-sent-folder   "/Sent"
       setq mu4e-drafts-folder "/Drafts"
       setq mu4e-trash-folder  "/Trash")

       ; sending mail
        (require 'smtpmail)
        (setq message-send-mail-function 'smtpmail-send-it
              starttls-use-gnutls t
              smtpmail-starttls-credentials '(("blackstar.sr.unh.edu" 587 (file-truename "~/.authinfo.gpg") (file-truename "~/.authinfo.gpg")))
              smtpmail-auth-credentials '(("blackstar.sr.unh.edu" 587 "skk@sr.unh.edu" nil))
              smtpmail-default-smtp-server "blackstar.sr.unh.edu"
              smtpmail-smtp-server "blackstar.sr.unh.edu"
              smtpmail-stream-type 'ssl
              smtpmail-smtp-service 587)

))
;; for the settings for outgoing mail consult the section 'Longer configuration'

(provide 'skk-mu4e)

