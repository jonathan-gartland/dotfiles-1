
" turn on omni-complete for java
set completefunc=javacomplete#Complete
set omnifunc=javacomplete#Complete 

" Set Compiler
"call javacomplete#SetCompiler( '/usr/bin/javac' )

" Set JVMLauncher
"call javacomplete#SetJVMLauncher( '/usr/bin/java' )

" Set classpath
"call javacomplete#AddClassPath( '/net/home/rcc/skk/workspace/destCRMS' )

" Set sourcepath
"call javacomplete#AddSourcePath( '/net/home/rcc/skk/workspace/CRMSWeb/src/' )

"inoremap <buffer> <C-X><C-U> <C-X><C-U><C-P>
"inoremap <buffer> <C-S-Space> <C-X><C-U><C-P>

" JavaImp.vim -- http://www.vim.org/scripts/script.php?script_id=325
let g:JavaImpPathSep = ':' 
let g:JavaImpPaths = '$HOME/workspace/BeanViewer/src:$HOME/workspace/CRMSAction/src:$HOME/workspace/CRMSModel/src:$HOME/workspace/CRMSTest/src:$HOME/workspace/CRMSWeb/src:' 
let g:JavaImpDataDir = expand("$HOME") . "/.vim/" . ".JavaImp"

" jcommenter.vim -- http://www.vim.org/scripts/script.php?script_id=20
let b:jcommenter_class_author='Steven Knight (skk@sr.unh.edu)'
let b:jcommenter_file_author='Steven Knight (skk@sr.unh.edu)'
source $HOME/.vim/plugin/jcommenter.vim
map <C-W> :call JCommentWriter()<CR> 

"set makeprg=jsl\ -nologo\ -nofilelisting\ -nosummary\ -nocontext\ -conf\ '$HOME/.jsl.conf'\ -process\ %
"set errorformat=%f(%l):\ %m
"make F11 call make for linting etc.
"inoremap <silent> <F11> <C-O>:make<CR>
"map <silent> <F11> :make<CR>


" Settings for errormarker http://www.vim.org/scripts/script.php?script_id=1861
let &errorformat='%f:%l:%c: %t%*[^:]:%m,%f:%l: %t%*[^:]:%m,' . &errorformat

let errormarker_erroricon = expand( '~/.vim/icon/error.png' )
let errormarker_warningicon = expand( '~/.vim/icon/warning.png' )

let &errorformat='%f:%l: %t%*[^:]:%m,' . &errorformat
let &errorformat='%f:%l:%c: %t%*[^:]:%m,' . &errorformat
let errormarker_warningtypes = 'wW'
