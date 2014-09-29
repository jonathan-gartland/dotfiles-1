;; robe - https://github.com/dgutov/robe
(use-package robe
  :init
  (progn
    (push 'company-robe company-backends)
))

;; Ruby - https://github.com/zenspider/enhanced-ruby-mode
(use-package enh-ruby-mode 
  :init
  (progn
    (add-hook 'enh-ruby-mode-hook 'robe-mode)
    (add-to-list 'ac-modes 'enh-ruby-mode)
    (setq robe-turn-on-eldoc t)
    (inf-ruby-minor-mode +1)

    (add-to-list 'auto-mode-alist '("\\.rake$" . enh-ruby-mode))
    (add-to-list 'auto-mode-alist '("\\.watchr$" . enh-ruby-mode))
    (add-to-list 'auto-mode-alist '("Rakefile$" . enh-ruby-mode))
    (add-to-list 'auto-mode-alist '("\\.gemspec$" . enh-ruby-mode))
    (add-to-list 'auto-mode-alist '("\\.ru$" . enh-ruby-mode))
    (add-to-list 'auto-mode-alist '("Gemfile" . enh-ruby-mode))
    (add-to-list 'auto-mode-alist '("capfile" . enh-ruby-mode))
    (add-to-list 'auto-mode-alist '("\\.erb$" . rhtml-mode))
)

;; inf-ruby - https://github.com/nonsequitur/inf-ruby  
(use-package  inf-ruby
  :init
  (progn
    (add-hook 'inf-ruby-mode-hook 'ac-inf-ruby-enable)
    (add-to-list 'ac-modes 'inf-ruby-mode))
    (define-key inf-ruby-mode-map (kbd "TAB") 'auto-complete)
))


