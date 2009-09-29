
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; wanderlust
(defconst wl-testing 't)
(when wl-testing 
    (add-to-list 'load-path "/usr/share/emacs/site-lisp/")
    (add-to-list 'load-path "/usr/share/emacs/site-lisp/apel")
    (add-to-list 'load-path "/usr/share/emacs/site-lisp/flim")
    (add-to-list 'load-path "/usr/share/emacs/site-lisp/semi")
    (add-to-list 'load-path "/usr/share/emacs/site-lisp/wl")

    ;; mel-b-ccl is buggy. use emacs built-in base64 decoder
    (setq mel-b-ccl-module nil
          base64-internal-decoding-limit nil)
    (require 'mel-b-el)
    (defalias 'base64-internal-decode-string 'base64-decode-string)

    (autoload 'wl "wl" "wanderlust" t)
    (autoload 'wl-draft "wl" "Write draft with Wanderlust." t)
    (autoload 'wl-other-frame "wl" "Wanderlust on new frame." t)
    (setq wl-icon-directory "/usr/share/pixmaps/wl/")
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

