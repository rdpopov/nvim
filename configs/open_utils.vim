function! g:Prepend(inp,cmd)
    let res = []
    if (len(a:inp) == 0  || a:cmd == "")
        return res
    else
        for i in a:inp
            let res = res + [a:cmd . " " . i]
        endfor
        return res
    endif
endfunction

function! g:GetTextInVisualSelection(...)
    " stolen form here https://stackoverflow.com/questions/1533565/how-to-get-visually-selected-text-in-vimscript
    " form stackoverflow user: xolox

    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
    let lines = getline(line_start, line_end)
    if len(lines) == 0
        return ''
    endif
    let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
    let lines[0] = lines[0][column_start - 1:]
    if a:0 == 1
        return join(lines, a:1) . "\n"
    elseif a:0 == 2
        return join(Prepend(lines,a:2), a:1 ) . "\n"
    else
        return join(lines, "\n")
    endif
endfunction

function! g:OpenInBrowser()
    let cmd = GetTextInVisualSelection(";",g:prefered_browser)
    silent execute ":!". cmd
endfunction

function! g:ExecInTerminal()
    let cmd = GetTextInVisualSelection(";")
    execute ":vsplit term://" . cmd
endfunction

function! g:SudoExecInTerminal()
    let cmd = GetTextInVisualSelection(";","sudo")
    execute ":vsplit term://" . cmd 
endfunction
