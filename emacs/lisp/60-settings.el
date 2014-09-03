;; ;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; ;; the modeline
;; (line-number-mode t)                     ; show line numbers
;; (column-number-mode t)                   ; show column numbers
;; (when (fboundp size-indication-mode)      
;;   (size-indication-mode t))              ; show file size (emacs 22+)
;; (display-time-mode 1)                    ; don't show the time
;; ;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; ;; general settings
;; ;; (menu-bar-mode t)                       ; don't show the menu 
;; ;; (tool-bar-mode nil)                       ; don't show the toolbar
;; ;; (icomplete-mode t)                       ; completion in minibuffer
;; ;; (setq icomplete-prospects-height 2)      ; don't spam my minibuffer
;; (scroll-bar-mode nil)              
;; (set-scroll-bar-mode 'right)
;; (defalias 'yes-or-no-p 'y-or-n-p)        ; allow y for yes, n for no

;; (when (fboundp 'set-fringe-mode)         ; emacs22+ 
;;   (set-fringe-mode 1))                   ; space left of col1 in pixels

;; ;; (transient-mark-mode t)                  ; make the current 'selection' visible
;; ;; (delete-selection-mode t)                ; delete the selection with a keypress
;; ;; (setq x-select-enable-clipboard t)       ; copy-paste should work ...
;; ;; (setq interprogram-paste-function        ; ...with...
;; ;;   'x-cut-buffer-or-selection-value)      ; ...other X clients

;; ;; (setq search-highlight t                 ; highlight when searching... 
;; ;;   query-replace-highlight t)             ; ...and replacing
;; ;; (fset 'yes-or-no-p 'y-or-n-p)            ; enable y/n answers to yes/no 

;; ;; (global-font-lock-mode t)                ; always do syntax highlighting 
;; ;; ;(when (require-maybe 'jit-lock)          ; enable JIT to make font-lock faster
;; ;; ;  (setq jit-lock-stealth-time 1))        ; new with emacs21

;; ;; (set-language-environment "UTF-8")       ; prefer utf-8 for language settings
;; ;; (set-input-method nil)                   ; no funky input for normal editing;

;; ;; (setq completion-ignore-case t           ; ignore case when completing...
;; ;;   read-file-name-completion-ignore-case t) ; ...filenames too

;; ;; (put 'narrow-to-region 'disabled nil)    ; enable...
;; ;; (put 'erase-buffer 'disabled nil)        ; ... useful things
;; ;; (when (fboundp file-name-shadow-mode)    ; emacs22+
;; ;;   (file-name-shadow-mode 1))             ; be smart about filenames in minbuffer

;; ;; (setq inhibit-startup-message t         ; don't show ...    
;; ;;       inhibit-startup-echo-area-message t) ; ... startup messages

;; ;; (setq save-place-file "~/.emacs.d/.cache/saveplace") ;; keep my ~/ clean
;; ;; (setq-default save-place t)                   ;; activate it for all buffers
;; ;; (require 'saveplace)                          ;; get the package

;; ;; (setq savehist-additional-variables    ;; also save...
;; ;;         '(search-ring regexp-search-ring)    ;; ... my search entries
;; ;;           savehist-file "~/.emacs.d/.cache/savehist") ;; keep my home clean
;; ;; (savehist-mode t)                      ;; do customization before activate
;; ;; (setq default-tab-width 4)            ; set tab-width
;; ;; (setq-default tab-stop-list (list 4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108))
;; ;; (setq-default indent-tabs-mode nil)

;; ;; disabled that damm bell !
;; (setq bell-volume 0)
;; (setq sound-alist nil)
;; (setq ring-bell-function 'ignore)
;; (setq visible-bell t)

;; ;; cursor
;; (blink-cursor-mode 0)           ; don't blink cursor

;; ;; (setq auto-save-list-file-prefix "~/.emacs.d/.cache/auto-save-list/")

;; ;; ;(provide 'setup_settings)

