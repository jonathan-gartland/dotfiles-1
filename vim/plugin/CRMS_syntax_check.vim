" performs CRMS syntax checking on the current buffer
" ~/.csc-file   -- is a copy of the currect buffer
" ~/.csc-errors -- is a buffer containing the errors
function! CRMS_syntax_check()
    if ( bufloaded( bufname("~/.csc-errors") ) != 0)
      bdelete! ~/.csc-errors
    endif

    "write! /net/home/rcc/skk/.csc-file
    write! ~/.csc-file

    if ( bufloaded( bufname("~/.csc-file") ) != 0)
      bdelete! ~/.csc-file
    endif

    let cmd = "bash -c '~/workspace/build/geronimo_ant EAR ~/.csc-file > ~/.csc-errors 2>&1'"

    let r = system( cmd )
    if ( v:shell_error != 1 )
        "split /net/home/rcc/skk/.csc-errors
	split ~/.csc-errors
        wincmd j
    else
	    let	l:currentbuffer=bufname("%")
		redraw
	    echohl Search
		echo l:currentbuffer." : Syntax is OK"
		echohl None
    endif
endfunction
