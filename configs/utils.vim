function! Redir(cmd)
    if a:cmd =~ '^!'
        execute "let output = system('" . substitute(a:cmd, '^!', '', '') . "')"
    else
        redir => output
        execute a:cmd
        redir END
    endif
    tabnew
    setlocal nobuflisted buftype=nofile bufhidden=wipe noswapfile
    call setline(1, split(output, "\n"))
    put! = a:cmd
    " put = '----'
endfunction

xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
function! ExecuteMacroOverVisualRange()
    echo "@".getcmdline()
    execute ":'<,'>normal @".nr2char(getchar())
endfunction

function! VBlockNorm()
    execute ":'<,'>normal ". input("norm ")
endfunction
command! -nargs=1 Redir silent call Redir(<f-args>)
command! BufOnly execute '%bdelete|edit #|normal `"'
nnoremap <leader>yf :call system("xclip -i -selection clipboard", expand("%:p"))<CR>

function! g:LToggle() abort
    let buffer_count_before = len(filter(range(1, bufnr('$')), 'bufwinnr(v:val) != -1'))
    " Location list can't be closed if there's cursor in it, so we need 
    " to call lclose twice to move cursor to the main pane
    silent! lclose
    silent! lclose

    if len(filter(range(1, bufnr('$')), 'bufwinnr(v:val) != -1')) == buffer_count_before
        execute "silent! lopen 10 "
    endif
endfunction
function! RemoveQFItem()
    let curqfidx = line('.') - 1
    let qfall = getqflist()
    call remove(qfall, curqfidx)
    call setqflist(qfall, 'r')
    execute curqfidx + 1 . "cfirst"
    :copen
endfunction
:command! RemoveQFItem :call RemoveQFItem()
" Use map <buffer> to only map dd in the quickfix window. Requires +localmap
autocmd FileType qf map <buffer> dd :RemoveQFItem<cr>

if executable('rg') 
    set grepprg=rg\ --vimgrep\ --hidden\ --glob\ '!.git/'
endif

function! CompletionForSearchAndReplaceToken(ArgLead, CmdLine,...)
    let empty_line = "^$"
    let r = trim(getreg('/'),"\\%V")
    if r == ""
        return join([''],"\n")
    else
        let l:rstr = trim(r,"\<|\>")
        let l:res_list = uniq([rstr,"\\<".rstr."\\>","\\w\\+","\\d\\+"])
        if len(res_list) == 2
            let l:res_list += [""]
        endif
        return join(l:res_list,"\n")
    endif
endfunction

function! CompletionForSearchAndReplaceTarget(ArgLead, CmdLine,...)
    let r = trim(getreg('/'),"\\%V")
    if r == ""
        return join([''],"\n")
    else
        let l:rstr = r "trim(r,"\<|\>")
        let l:res_list = uniq([r,rstr,"<delete>",a:ArgLead])
        if len(l:res_list) == 2
            let l:res_list += [""]
        endif
        return join(l:res_list,"\n")
    endif
endfunction

function! HighlightWhileTypingVisual(cmdline)
    let w:h = matchadd('IncSearch', "\\%V" . a:cmdline)
    exe "redraw"
    call matchdelete(w:h)
    return []
endfunction

function! HighlightWhileReplace(cmdline)
    " if a:cmdline[0] != '@'
    let l:pattern = trim(getreg('/'),"\%V")
    " exe "'<,'>s/" . l:pattern . "/".a:cmdline. "/g"
    call ComplexRepalce(a:cmdline)
    exe "redraw"
    exe ":undo!"
    " endif
    return []
endfunction

let mapleader = ' '

nnoremap <silent> s mz:set opfunc=HighlightInMotion<CR>g@

function! HighlightInMotion(type, ...)
    let l:t = ""
    execute "norm `]v`[\<esc>"
    let l:t = input({'prompt':'Pattern: ','default':'','completion':"custom,CompletionForSearchAndReplaceToken",'highlight':'HighlightWhileTypingVisual'})
    if l:t == ""
        execute ":norm `z"
        return
    endif
    set hlsearch
    call setreg("/", "\\%V" . l:t)
    exe "redraw"
    execute ":norm `z"
endfunction

function ComplexRepalce(target)
    if a:target == "<delete>"
        let a:target = ""
    endif
    if a:target[0] == '@'
        if len(a:target) > 2
            exe "g/" . getreg('/')  . "/:norm " . a:target[1:]
        endif
    else
        if line("'<") == line("'>") " if marks are on the same line, the '> wont be adjusted so it wiull bew broken or lines change
            exe ':norm gv"xy'
            let l:pattern = getreg('/')
            if l:pattern[:2] == "\\%V"
                let l:pattern = l:pattern[3:]
            endif
            let l:res = substitute(getreg('x') , l:pattern , a:target , 'g')
            call setreg('x',l:res)
            exe ':norm gv"_d"xp'
        else
            let l:pattern = trim(getreg('/'),"\%V")
            exe "'<,'>s/" . l:pattern . "/".a:target. "/g"
        endif
    endif
endfunction

function! DoForCountsImpl(prompt)
    let l:target = input({'prompt':a:prompt,'default':'','completion':"custom,CompletionForSearchAndReplaceTarget",'highlight':'HighlightWhileReplace'})
    if l:target == ""
        execute ":norm `z"
        return
    endif
    call ComplexRepalce(l:target)
    execute ":norm `z"
endfunction

function! SimpleReplace()
    call DoForCountsImpl('Replace: ')
endfunction

nnoremap <silent> <leader>r mz:call SimpleReplace()<CR>
