" *****************************************************************************************************
" 
" CTRL-W r	Rotate windows downwards/rightwards.  The first window becomes
" 		the second one, the second one becomes the third one, etc.
" 		The last window becomes the first window.  The cursor remains
" 		in the same window.
" 		This only works within the row or column of windows that the
" 		current window is in.
" 
" CTRL-W R	Rotate windows upwards/leftwards.  The second window becomes
" 		the first one, the third one becomes the second one, etc.  The
" 		first window becomes the last window.  The cursor remains in
" 		the same window.
" 		This only works within the row or column of windows that the
" 		current window is in.
" 
" CTRL-W x	Without count: Exchange current window with next one.  If there
" 		is no next window, exchange with previous window.
" 		With count: Exchange current window with Nth window (first
" 		window is 1).  The cursor is put in the other window.
" 		When vertical and horizontal window splits are mixed, the
" 		exchange is only done in the row or column of windows that the
" 		current window is in.
" 
" The following commands can be used to change the window layout.  For example,
" when there are two vertically split windows, CTRL-W K will change that in
" horizontally split windows.  CTRL-W H does it the other way around.
" 
" 						*CTRL-W_K*
" CTRL-W K	Move the current window to be at the very top, using the full
" 		width of the screen.  This works like closing the current
" 		window and then creating another one with ":topleft split",
" 		except that the current window contents is used for the new
" 		window.
" 
" 						*CTRL-W_J*
" CTRL-W J	Move the current window to be at the very bottom, using the
" 		full width of the screen.  This works like closing the current
" 		window and then creating another one with ":botright split",
" 		except that the current window contents is used for the new
" 		window.
" 
" 						*CTRL-W_H*
" CTRL-W H	Move the current window to be at the far left, using the
" 		full height of the screen.  This works like closing the
" 		current window and then creating another one with
" 		":vert topleft split", except that the current window contents
" 		is used for the new window.
" 		{not available when compiled without the |+vertsplit| feature}
" 
" 						*CTRL-W_L*
" CTRL-W L	Move the current window to be at the far right, using the full
" 		height of the screen.  This works like closing the
" 		current window and then creating another one with
" 		":vert botright split", except that the current window
" 		contents is used for the new window.
" 		{not available when compiled without the |+vertsplit| feature}
" 
" 						*CTRL-W_T*
" CTRL-W T	Move the current window to a new tab page.  This fails if
" 		there is only one window in the current tab page.
" 		When a count is specified the new tab page will be opened
" 		before the tab page with this index.  Otherwise it comes after
" 		the current tab page.
" 

function! g:NewWindow(...)
        " H is Left  L is Right  K is Top  J is Bottom
        vnew
        let l:sz = tolower(a:1)
        if (l:sz == "left")
             wincmd H
        endif
        if (l:sz == "right")
             wincmd L
        endif
        if (l:sz == "top")
             wincmd K
        endif
        if (l:sz == "bottom")
             wincmd J
        endif
        setlocal nobuflisted buftype=nofile bufhidden=wipe noswapfile
        nnoremap <silent> <buffer> q :close<cr>
        nnoremap <silent> <buffer> = :vertical resize +20<cr>
        nnoremap <silent> <buffer> + :vertical resize -20<cr>
        nnoremap <silent> <buffer> b :vertical resize +20<cr>
        nnoremap <silent> <buffer> s :vertical resize -20<cr>
        call cursor(1, 1)
        execute "vertical resize " . a:2
        if ( a:0 > 2)
            execute "nnoremap <silent> <buffer> " . a:3 . "<cr>"
        endif
        if ( a:0 > 3)
            execute "nnoremap <silent> <buffer> " . a:4 . "<cr>"
        endif
        if ( a:0 > 4)
            execute "nnoremap <silent> <buffer> " . a:5 . "<cr>"
        endif
endfunction
