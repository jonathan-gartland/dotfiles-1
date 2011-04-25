;;; skk-workgroups.el --- 


(require 'workgroups)
(workgroups-mode 1)
(setq wg-switch-on-load nil) ; don't auto switch to the first workgroup
(wg-load "~/.emacs.d/init/.workgroups")

(provide 'skk-workgroups)
;;; skk-workgroups.el ends here
