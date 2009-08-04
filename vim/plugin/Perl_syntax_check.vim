" performs perl syntax checking on the current buffer
" ~/.psc-file   -- is a copy of the currect buffer
" ~/.psc-errors -- is a buffer containing the errors
function! Perl_syntax_check()
    if ( bufloaded( bufname("~/.psc-errors") ) != 0)
      bdelete! ~/.psc-errors
    endif

    "write! /net/home/rcc/skk/.psc-file
    write! ~/.psc-file

    if ( bufloaded( bufname("~/.psc-file") ) != 0)
      bdelete! ~/.psc-file
    endif

    let cmd = "bash -c '/usr/local/bin/perl_syntax_checker.pl ~/.psc-file > ~/.psc-errors 2>&1'"

    let r = system( cmd )
    if ( v:shell_error != 1 )
        "split /net/home/rcc/skk/.psc-errors
	split ~/.psc-errors
        wincmd j
    else
	    let	l:currentbuffer=bufname("%")
		redraw
	    echohl Search
		echo l:currentbuffer." : Syntax is OK"
		echohl None
    endif
endfunction
