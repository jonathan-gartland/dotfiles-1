(add-to-list 'load-path "/home/skk/local/share/emacs/site-lisp/mu4e")

(require 'mu4e)

;; happily, below settings are all /optional/

;; Only needed if your maildir is _not_ ~/Maildir
(setq mu4e-maildir "/home/skk/Maildir")

;; these must start with a "/", and must exist
;; (i.e.. /home/user/Maildir/sent must exist)
;; you use e.g. 'mu mkdir' to make the Maildirs if they don't
;; already exist

;; below are the defaults; if they do not exist yet, mu4e will offer to
;; create them
(setq mu4e-sent-folder   "/Sent")
(setq mu4e-drafts-folder "/Drafts")
(setq mu4e-trash-folder  "/Trash")

;; for the settings for outgoing mail consult the section 'Longer configuration'

(provide 'skk-mu4e)

