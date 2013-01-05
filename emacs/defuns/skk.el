(defun byte-recompile-emacsd ()
  "Byte-compilete all files in ~/.emacs.d"
  (byte-recompile-directory '~/.emacs.d' 0 t))

