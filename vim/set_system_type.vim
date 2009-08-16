
" Function used by vimrc to give vim_local's the type of system we're on.

" MySys should return: unix, windows or mac
fun! MySys()
  return "unix"
  "return "windows"
  "return "mac"
endfun

