func! s:strfind(s,find,start)
            if type(a:find)==1
                    let l:i = a:start
                    while l:i<len(a:s)
                            if strpart(a:s,l:i,len(a:find))==a:find
                                    return l:i
                            endif
                            let l:i+=1
                    endwhile
                    return -1
            elseif type(a:find)==3
                    " a:find is a list
                    let l:i = a:start
                    while l:i<len(a:s)
                            let l:j=0
                            while l:j<len(a:find)
                                    if strpart(a:s,l:i,len(a:find[l:j]))==a:find[l:j]
                                            return [l:i,l:j]
                                    endif
                                    let l:j+=1
                            endwhile
                            let l:i+=1
                    endwhile
                    return [-1,-1]
            endif
    endfunc

    func! g:strreplace(s,find,replace)
            if len(a:find)==0
                    return a:s
            endif
            if type(a:find)==1 && type(a:replace)==1
                    let l:ret = a:s
                    let l:i = s:strfind(l:ret,a:find,0)
                    while l:i!=-1
                            let l:ret = strpart(l:ret,0,l:i).a:replace.strpart(l:ret,l:i+len(a:find))
                            let l:i = s:strfind(l:ret,a:find,l:i+len(a:replace))
                    endwhile
                    return l:ret
            elseif  type(a:find)==3 && type(a:replace)==3 && len(a:find)==len(a:replace)
                    let l:ret = a:s
                    let [l:i,l:j] = s:strfind(l:ret,a:find,0)
                    while l:i!=-1
                            let l:ret = strpart(l:ret,0,l:i).a:replace[l:j].strpart(l:ret,l:i+len(a:find[l:j]))
                            let [l:i,l:j] = s:strfind(l:ret,a:find,l:i+len(a:replace[l:j]))
                    endwhile
                    return l:ret
            endif

    endfunc

function! TrimLeft(s1)
     let l:szPart = substitute(a:s1, "^ *", "", "")
     return l:szPart
endfunction
function! TrimRight(s1)
     let l:szPart = substitute(l:szPart, " *$", "", "")
     return l:szPart
endfunction
function! Trim(s1)
     let l:szPart = substitute(a:s1, "^ *", "", "")
     let l:szPart = substitute(l:szPart, " *$", "", "")
     return l:szPart
endfunction
function! Trimmer(s1,s2)
     let l:szPart = substitute(a:s1,     a:s2,  "", "")
     let l:szPart = substitute(l:szPart, "^ *", "", "")
     let l:szPart = substitute(l:szPart, " *$", "", "")
     return l:szPart
endfunction
function! g:Pad(s,amt)
        return a:s . repeat(' ',a:amt - len(a:s))
endfunction
function! g:PrePad(s,amt,...)
        if a:0 > 0
             let char = a:1
        else
             let char = ' '
        endif
        return repeat(char,a:amt - len(a:s)) . a:s
endfunction

function! g:CenterPad(...)
        let l:n = (((g:LW-strlen(a:1)) / 2) + strlen(a:1)) - 0
        return g:PrePad(a:1, l:n)
endfunction
function! g:DQ(...)
    let l:sz = substitute(a:1, "<cr>", "", "g")
    let l:sz = substitute(l:sz, ":", "", "g")
    return "\'" . l:sz . "\'"
endfunction
function! g:RandomString()
    let l:szAlpha = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    let l:c = 1
    let l:szOut = ""
    while l:c <= 8
         let l:rrr = str2nr(matchstr(reltimestr(reltime()), '\v\.@<=\d+')[1:]) % 24 
         let l:szOut = l:szOut . l:szAlpha[rrr] 
         let l:c += 1
    endwhile 
    return l:szOut
endfunction
function! g:DeSpace()
     execute "%s/^     / /ge"
     execute "%s/^     / /ge"
     execute "%s/^     / /ge"
     execute "%s/^     / /ge"
     execute "%s/^     / /ge"

     execute "%s/^    / /ge"
     execute "%s/^    / /ge"
     execute "%s/^    / /ge"
     execute "%s/^    / /ge"
     execute "%s/^    / /ge"

     execute "%s/^   / /ge"
     execute "%s/^   / /ge"
     execute "%s/^   / /ge"
     execute "%s/^   / /ge"
     execute "%s/^   / /ge"

     execute "%s/^  / /ge"
     execute "%s/^  / /ge"
     execute "%s/^  / /ge"
     execute "%s/^  / /ge"
     execute "%s/^  / /ge"

     execute "%s/^ //ge"
endfunction
