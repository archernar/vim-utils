function! g:FileExists(...)
        let l:ret = 0
        if !empty(glob(a:1))
            let l:ret = 1
        endif 
        return l:ret
endfunction
function! g:GotoWindow(...)
         exe a:1 . "wincmd w"
endfunction
function! g:WOW()
        for l:l in range(1, winnr('$'))
                    echom l:l
        endfor
"         echom "wow"
"         let l:c = 1
"         while l:c <= 10 
"             if (bufexists(l:c))
"                 let readable = filereadable(bufname(l:c))
"                 echo bufname(l:c) . " is " . (readable ? "" : "not ") . "a readable file."
"             endif
"             let l:c += 1
"         endwhile 
" 
"         let l:list = map(range(1, winnr('$')), '[v:val, bufname(winbufnr(v:val))]')
"         let l:list = range(1, winnr('$'))
"         for l:l in l:list
"                  echom l:l . "  -  " .  bufname(winbufnr(l:l))
"         endfor
endfunction
