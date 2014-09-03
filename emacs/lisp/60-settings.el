
(use-package saveplace
  :init (progn
          (setq save-place-file user-save-place-file)
          (setq-default save-place t))) 

(setq savehist-additional-variables       ;; also save...
      '(search-ring regexp-search-ring)   ;; ... my search entries
      savehist-file emacs-savehist-file)  ;; keep my home clean
(savehist-mode t)                         ;; do customization before activate

;; disabled that damm bell !
(setq bell-volume 0)
(setq sound-alist nil)
(setq ring-bell-function 'ignore)
(setq visible-bell t)

;; cursor
(blink-cursor-mode 0)           ; don't blink cursor

(setq auto-save-list-file-prefix emacs-autosavelistfileprefix-dir)

(use-package setup_settings)
; Fill column indicator
(use-package fill-column-indicator
  :init
  (progn
    (setq fci-rule-character-color "#1c1c1c"
          fci-rule-color "#1c1c1c")))

;; Run at full power please
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)

(setq ispell-personal-dictionary "~/.emacs.d/aspell.dict")

 (setq tab-always-indent nil)
