;;; skk-general.el --- General Settings

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; the modeline
(line-number-mode t)                     ; show line numbers
(column-number-mode t)                   ; show column numbers
(when (fboundp size-indication-mode)      
  (size-indication-mode t))              ; show file size (emacs 22+)
(display-time-mode -1)                   ; don't show the time
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; general settings
(menu-bar-mode t)                       ; don't show the menu 
(tool-bar-mode nil)                       ; don't show the toolbar
(icomplete-mode t)                       ; completion in minibuffer
(setq icomplete-prospects-height 2)      ; don't spam my minibuffer
(scroll-bar-mode t)              
(set-scroll-bar-mode 'right)

(when (fboundp 'set-fringe-mode)         ; emacs22+ 
  (set-fringe-mode 1))                   ; space left of col1 in pixels

(transient-mark-mode t)                  ; make the current 'selection' visible
(delete-selection-mode t)                ; delete the selection with a keypress
(setq x-select-enable-clipboard t)       ; copy-paste should work ...
(setq interprogram-paste-function        ; ...with...
  'x-cut-buffer-or-selection-value)      ; ...other X clients

(setq search-highlight t                 ; highlight when searching... 
  query-replace-highlight t)             ; ...and replacing
(fset 'yes-or-no-p 'y-or-n-p)            ; enable y/n answers to yes/no 

(global-font-lock-mode t)                ; always do syntax highlighting 
(when (require-maybe 'jit-lock)          ; enable JIT to make font-lock faster
  (setq jit-lock-stealth-time 1))        ; new with emacs21

(set-language-environment "UTF-8")       ; prefer utf-8 for language settings
(set-input-method nil)                   ; no funky input for normal editing;

(setq completion-ignore-case t           ; ignore case when completing...
  read-file-name-completion-ignore-case t) ; ...filenames too

(put 'narrow-to-region 'disabled nil)    ; enable...
(put 'erase-buffer 'disabled nil)        ; ... useful things
(when (fboundp file-name-shadow-mode)    ; emacs22+
  (file-name-shadow-mode 1))             ; be smart about filenames in minbuffer

(setq inhibit-startup-message t          ; don't show ...    
  inhibit-startup-echo-area-message t)   ; ... startup messages

(setq save-place-file "~/.emacs.d/.cache/saveplace") ;; keep my ~/ clean
(setq-default save-place t)                   ;; activate it for all buffers
(require 'saveplace)                          ;; get the package

(setq savehist-additional-variables    ;; also save...
        '(search-ring regexp-search-ring)    ;; ... my search entries
          savehist-file "~/.emacs.d/.cache/savehist") ;; keep my home clean
(savehist-mode t)                      ;; do customization before activate
(setq default-tab-width 4)            ; set tab-width
(setq-default tab-stop-list (list 4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108))
(setq-default indent-tabs-mode nil)

;; disabled that damm bell !
(setq bell-volume 0)
(setq sound-alist nil)
(setq ring-bell-function 'ignore)
(setq visible-bell t)


(setq auto-save-list-file-prefix "~/.emacs.d/.cache/auto-save-list/")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; cursor
(blink-cursor-mode 0)           ; don't blink cursor

; http://www.emacswiki.org/cgi-bin/wiki/download/cursor-chg.el
(when (require-maybe 'cursor-chg)  ; Load this library
  (change-cursor-mode 1) ; On for overwrite/read-only/input mode
  (toggle-cursor-type-when-idle 1)
  (setq 
    curchg-default-cursor-color "Black"))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; File cache http://www.emacswiki.org/cgi-bin/wiki/FileNameCache
(eval-after-load
  "filecache"
  '(progn
     (message "Loading file cache...")
     (file-cache-add-directory "~/")
     (file-cache-add-directory-list (list "~/src" "~/" "~/work"))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; bookmarks
(setq bookmark-default-file "~/.emacs.d/.cache/bookmarks")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; set default font
; windows
(when djcb-win32-p
 (set-default-font
   "-outline-Consolas-normal-r-normal-normal-*-*-*-*-*-*-*-*"))
; linux
(when djcb-linux-p
  (set-default-font "Liberation Mono-10"))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; show-paren-mode
;; show a subtle blinking of the matching paren (the defaults are ugly)
;; http://www.emacswiki.org/cgi-bin/wiki/ShowParenMode
(when (fboundp 'show-paren-mode)
  (show-paren-mode t)
  (setq show-paren-style 'parenthesis))

;(add-hook 'python-mode-hook (lambda () (setq 
;    tab-width 4
;    py-indent-offset 4
;    indent-tabs-mode t
;    py-smart-indentation t
;    python-indent 4)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  abbrevs (emacs will automagically expand abbreviations)
(setq abbrev-file-name                ; tell emacs where to read abbrev
      "~/.emacs.d/abbrev_defs.el")    ; definitions from...
(abbrev-mode t)                       ; enable abbrevs (abbreviations) ...
(setq default-abbrev-mode t
  save-abbrevs t)                     ; don't ask
(when (file-exists-p abbrev-file-name)
  (quietly-read-abbrev-file))         ;  don't tell
(add-hook 'kill-emacs-hook            ; write when ...
  'write-abbrev-file)                 ; ... exiting emacs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; backups  (emacs will write backups and number them)
(setq make-backup-files t ; do make backups
  backup-by-copying t ; and copy them ...
  backup-directory-alist '(("." . "~/.emacs.d/.backup/")) ; ... here
  version-control t
  kept-new-versions 2
  kept-old-versions 5
  delete-old-versions t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; time-stamps 
;; when there is a "Time-stamp: <>" in the first 10 lines of the file,
;; emacs will write time-stamp information there when saving the file.
(setq 
  time-stamp-active t          ; do enable time-stamps
  time-stamp-line-limit 10     ; check first 10 buffer lines for Time-stamp: <>
  time-stamp-format "%04y-%02m-%02d %02H:%02M:%02S (%u)") ; date format
(add-hook 'write-file-hooks 'time-stamp) ; update when saving
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
;; recent files                                                                  
(when (require-maybe 'recentf)
  (setq recentf-save-file "~/.emacs.d/.cache/recent-files"
    recentf-max-saved-items 500                                            
    recentf-max-menu-items 60)
  (recentf-mode t))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; tramp, for remote access
(setq tramp-default-method "ssh")
(setq tramp-persistency-file-name "~/.emacs.d/.cache/tramp")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; safe locals; we mark these as 'safe', so emacs22+ won't give us annoying 
;; warnings
(setq safe-local-variable-values 
      (quote ((auto-recompile . t) 
              (outline-minor-mode . t) 
              auto-recompile outline-minor-mode)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; misc loading
;(when (require-maybe 'table)
;  (add-hook 'text-mode-hook 'table-recognize))
(when (require-maybe 'tabber))
;(when (require-maybe 'ide-skel))
(when (require-maybe 'pair-mode))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; rect-mark 
(when (require-maybe 'rect-mark)
  ;; some commands for rectangular selections;
  ;; http://www.emacswiki.org/cgi-bin/wiki/RectangleMark
  (define-key ctl-x-map "r\C-@" 'rm-set-mark)
  (define-key ctl-x-map [?r ?\C-\ ] 'rm-set-mark)
  (define-key ctl-x-map "r\C-x" 'rm-exchange-point-and-mark)
  (define-key ctl-x-map "r\C-w" 'rm-kill-region)
  (define-key ctl-x-map "r\M-w" 'rm-kill-ring-save)
  (define-key global-map [S-down-mouse-1] 'rm-mouse-drag-region)
  (autoload 'rm-set-mark "rect-mark"
    "Set mark for rectangle." t)
  (autoload 'rm-exchange-point-and-mark "rect-mark"
    "Exchange point and mark for rectangle." t)
  (autoload 'rm-kill-region "rect-mark"
    "Kill a rectangular region and save it in the kill ring." t)
  (autoload 'rm-kill-ring-save "rect-mark"
    "Copy a rectangular region to the kill ring." t)
  (autoload 'rm-mouse-drag-region "rect-mark"
    "Drag out a rectangular region with the mouse." t))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; redo 
(when (require-maybe 'redo))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; dtrt-indent minor mode
;; http://git.savannah.gnu.org/gitweb/?p=dtrt-indent.git;a=blob_plain;f=dtrt-indent.el;hb=HEAD
(when (require-maybe 'dtrt-indent)
 (dtrt-indent-mode 1))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; auto-install http://www.emacswiki.org/emacs/AutoInstall
(when (require-maybe 'auto-install))
(setq auto-install-directory "~/.emacs.d/elsip/auto-install/")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; http://emacs-fu.blogspot.com/2009/11/making-buffer-names-unique.html
(require 'uniquify) 
(setq 
  uniquify-buffer-name-style 'post-forward
  uniquify-separator ":")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; http://www.emacswiki.org/emacs/AutoInsertMode
(require 'autoinsert)
(auto-insert-mode)  ;;; Adds hook to find-files-hook
(setq auto-insert-directory "~/.emacs.d/templates/") ;;; Or use custom, *NOTE* Trailing slash important
(setq auto-insert-query nil) ;;; If you don't want to be prompted before insertion
(define-auto-insert "\.py" "template.py")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; http://emacs-fu.blogspot.com/2009/11/copying-lines-without-selecting-them.html
(defadvice kill-ring-save (before slick-copy activate compile) "When called
  interactively with no active region, copy a single line instead."
  (interactive (if mark-active (list (region-beginning) (region-end)) (message
  "Copied line") (list (line-beginning-position) (line-beginning-position
  2)))))

(defadvice kill-region (before slick-cut activate compile)
  "When called interactively with no active region, kill a single line instead."
  (interactive
    (if mark-active (list (region-beginning) (region-end))
      (list (line-beginning-position)
        (line-beginning-position 2)))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun byte-recompile-emacsd ()
  "Byte-compilete all files in ~/.emacs.d"
  (byte-recompile-directory '~/.emacs.d' 0 t))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Highlight mark
; http://lists.gnu.org/archive/html/help-gnu-emacs/2003-11/msg00328.html
; nice mark - shows mark as a highlighted 'cursor' so user 'always' 
; sees where the mark is. Especially nice for killing a region.
(defvar pg-mark-overlay nil
  "Overlay to show the position where the mark is") 
(make-variable-buffer-local 'pg-mark-overlay)

(put 'pg-mark-mark 'face 'secondary-selection)

(defvar pg-mark-old-position nil
  "The position the mark was at. To be able to compare with the
current position")

(defun pg-show-mark () 
  "Display an overlay where the mark is at. Should be hooked into 
activate-mark-hook" 
  (unless pg-mark-overlay 
    (setq pg-mark-overlay (make-overlay 0 0))
    (overlay-put pg-mark-overlay 'category 'pg-mark-mark))
  (let ((here (mark t)))
    (when here
      (move-overlay pg-mark-overlay here (1+ here)))))

(defadvice  exchange-point-and-mark (after pg-mark-exchange-point-and-mark)
  "Show visual marker"
  (pg-show-mark))

(ad-activate 'exchange-point-and-mark)
(add-hook 'activate-mark-hook 'pg-show-mark)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




(provide 'skk-general)
;;; skk-general.el ends here
