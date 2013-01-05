;; ;; File cache http://www.emacswiki.org/cgi-bin/wiki/FileNameCache
;; (eval-after-load
;;   "filecache"
;;   '(progn
;;      (message "Loading file cache...")
;;      (file-cache-add-directory "~/")
;;      (file-cache-add-directory-list (list "~/src" "~/" "~/work"))))
