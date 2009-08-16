" Vim syntax file
" Language: fish shell script file
" Creator: Fernando Canizo <conan@lugmen.org.ar>
" Last Change: 2007 Oct 2
" Version: 1
" URL: http://muriandre.homelinux.org/~conan/vim/fish.vim

syntax case match

" clear syntax if version 5.x and exit if syntax was already loaded
if version < 600
	syntax clear
elseif exists("b:current_syntax")
	finish
endif

syntax keyword fishTodo contained TODO FIX FIXME XXX BUG
syntax match fishComment "^#.*" contains=fishTodo
syntax match fishComment "\s#.*"ms=s+1 contains=fishTodo

syntax region fishString start=+"+ skip=+\\\\\|\\"+ end=+"+ oneline
syntax region fishString start=+'+ skip=+\\\\\|\\'+ end=+'+ oneline

" 'contains' is a fish keyword, how can I put it here?
syntax keyword fishKeyword alias and begin bg bind block break builtin case cd commandline command complete continue count dirh dirs else end eval exec exit fg fishd fish_pager fish for functions function help if isatty jobs math mimedb nextd not open or popd prevd psub pushd random read return save_function set_color set . status switch trap type ulimit umask vared while

" Define the default highlighting.
" Only used when an item doesn't have highlighting yet
highlight def link fishComment Comment
highlight def link fishTodo Todo
highlight def link fishString String
highlight def link fishKeyword Keyword

let b:current_syntax = "fish"
