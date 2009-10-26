(defun install-eat-sqlplus-junk ()
  "Install `comint-preoutput-filter-functions' if appropriate.
Add this function to `sql-interactive-mode-hook' in your .emacs:
\(add-hook 'sql-mode-hook 'install-eat-sqlplus-junk)"
  (if (string= (car (process-command (get-buffer-process sql-buffer)))
               sql-oracle-program)
      (add-to-list 'comint-preoutput-filter-functions
                   'eat-sqlplus-junk)))

(add-hook 'sql-interactive-mode-hook 'install-eat-sqlplus-junk)
