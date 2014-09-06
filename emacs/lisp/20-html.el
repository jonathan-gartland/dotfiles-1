; http://web-mode.org/
(use-package web-mode
             :init
             (progn
               (setq web-mode-ac-sources-alist
                     '(("css" . (ac-source-css-property))
                       ("html" . (ac-source-words-in-buffer ac-source-abbrev))))
                     
               (add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
               (add-to-list 'auto-mode-alist '("\\.css" . web-mode))
               (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
               
               ; https://github.com/smihica/emmet-mode
               (add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
               (add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.
               ))
