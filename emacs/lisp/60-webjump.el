
(require 'webjump)
(bind-key "C-x g" 'webjump)

;Additional sites:
; http://www.neilvandyke.org/webjump/webjump-plus.el
; https://github.com/renard/webjump-plus-plus/blob/master/webjumps%2B%2B.el

(defconst webjump-sites `(
    
    ("ArchLinux Package DB" .
     [simple-query
      "www.archlinux.org"
      "https://www.archlinux.org/packages/?q="
      ""])
    
    ("ArchLinux Wiki" .
     [simple-query
      "www.archlinux.org"
      "https://wiki.archlinux.org/index.php?title=Special%3ASearchs&go=Go&search="
      ""
      ])

    ("EmacsWiki Search" .
     [simple-query
      "http://www.emacswiki.org/"
      "https://www.google.com/webhp?sourceid=chrome-instant&ion=1&ie=UTF-8#hl=en&tbo=d&sclient=psy-ab&oq=site:www.emacswiki.org+perl&gs_l=hp.3...48751.65133.0.65250.48.38.8.0.0.3.159.2888.30j8.38.0.les%3B..0.0...1c.1.G5mFj_DsuOo&pbx=1&bav=on.2,or.r_gc.r_pw.r_cp.r_qf.&bvm=bv.1357316858,d.dmg&fp=e9777ac6c6d6384b&ion=1&biw=956&bih=1068&q=site:www.emacswiki.org+"
      ""])
    
    ("Google" .
     [simple-query "www.google.com" "www.google.com/search?q=" ""])
    
    ("Wikipedia" .
     [simple-query "www.wikipedia.orrg" "http://www.wikipedia.org/wiki/%s" ""])
    
    ("Acronym Finder" .
     [simple-queyr "http://www.acronymfinder.com/%s.html"  "http://www.acronymfinder.com/%s.html" ""])
    
    ("GitHub". 
     [simple-query "http://github.com" "https://github.com/search?q=%s" ""])
    ))


(setq webjump-sites (append '(webjump-sites)))
