let s:pairs = { "(" : {"o": "( ", "c":" )"},
            \")" : {"o": "(", "c":")"},
            \"["  : {"o": "[ ", "c":" ]"},
            \"]"  : {"o": "[", "c":"]"},
            \"{"  : {"o": "{ ", "c":" }"},
            \"}"  : {"o": "{", "c":"}"},
            \"\'" : {"o": "\'", "c":"\'"},
            \"<"  : {"o": "< ", "c":" >"},
            \">"  : {"o": "<", "c":">"},
            \"/"  : {"o": "/ ", "c":"/"},
            \}
function Is_html_tag(str) "checks if something is htm tag
    let l:tag_test   = matchstr(a:str,"\<.*\>")
    if !empty(l:tag_test)
        let l:has_fields = matchstr(a:str,"\<[a-zA-Z0-9]* .*\>")
        if !empty(l:has_fields)
            let l:tag = matchstr(a:str,"<[a-zA-Z0-9]* ")[1:]
            return {"o":a:str,"c":"</". l:tag .">"}
        else
            return {"o":a:str,"c":"</". a:str[1:]}
        endif
    else
        return {}
    endif
endfunction

function Around(str) "only for normal mode, will have another for visual
    let l:col = col('.')
    let l:is_tag = Is_html_tag(a:str)
    if l:col > 1
        if getline('.')[col('.') - 1] != ' ' && getline('.')[col('.') - 2] == ' '
            let l:go_to_start = "i"
        elseif getline('.')[col('.') - 1] == 'a'
            return
        else
            let l:go_to_start = "bi"
        endif
    else
        let l:go_to_start = "i"
    endif
    if !empty(l:is_tag)
        let l:beg = l:is_tag["o"]
        let l:end = l:is_tag["c"]
    elseif has_key(s:pairs,a:str)
        let l:beg = s:pairs[a:str]["o"]
        let l:end = s:pairs[a:str]["c"]
    else
        let l:beg = a:str
        let l:end = a:str
    endif
    exe ":norm ". l:go_to_start . l:beg . "\<Esc>ea" . l:end ."\<Esc>"
endfunction


function VAround(str) "only for normal mode, will have another for visual
    let l:col = col('.')
    let l:is_tag = Is_html_tag(a:str)
    if !empty(l:is_tag)
        let l:beg = l:is_tag["o"]
        let l:end = l:is_tag["c"]
    elseif has_key(s:pairs,a:str)
        let l:beg = s:pairs[a:str]["o"]
        let l:end = s:pairs[a:str]["c"]
    else
        let l:beg = a:str
        let l:end = a:str
    endif
    exe ":'<i".l:beg."\<Esc>'>a".l:end."\<Esc>"
endfunction

function VBAround(str) "only for normal mode, will have another for visual
    let l:col = col('.')
    let l:is_tag = Is_html_tag(a:str)
    if !empty(l:is_tag)
        let l:beg = l:is_tag["o"]
        let l:end = l:is_tag["c"]
    elseif has_key(s:pairs,a:str)
        let l:beg = s:pairs[a:str]["o"]
        let l:end = s:pairs[a:str]["c"]
    else
        let l:beg = a:str
        let l:end = a:str
    endif
    exe ":'<,'>s/\%V.*\%V./".l:beg."&".l:end."/"
endfunction
