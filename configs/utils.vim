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
		let rstr = trim(r,"\\|\<|\>")
		let res_list = uniq([trim(getreg("z"),"\t| "),"\\<".trim(getreg("z"),"\t| ")."\\>",r,rstr,empty_line,a:ArgLead])
		if len(res_list) == 2
			let res_list += [""]
		endif
		return join(res_list,"\n")
	endif
endfunction

function! CompletionForSearchAndReplaceTarget(ArgLead, CmdLine,...)
	let r = trim(getreg('/'),"\\%V")
	if r == ""
		return join([''],"\n")
	else
		let rstr = trim(r,"\\|\<|\>")
		let res_list = uniq([r,rstr,"<delete>",getreg("z"),a:ArgLead])
		if len(res_list) == 2
			let res_list += [""]
		endif
		return join(res_list,"\n")
	endif
endfunction

function! HighlightWhileTypingVisual(cmdline)
		let w:h = matchadd('IncSearch', "\\%V" . a:cmdline)
		exe "redraw"
		call matchdelete(w:h)
		return []
endfunction

function! HighlightWhileTypingMotion(cmdline)
		let l:top = "\\%>'["
		let l:bot = "\\%<']"
		let w:h = matchadd('IncSearch', l:top . a:cmdline . l:bot)
		exe "redraw"
		call matchdelete(w:h)
		return []
endfunction

let mapleader = ' '

nnoremap <silent> ss mz"zyiw :set opfunc=HighlightInMotion<CR>g@

function! HighlightInMotion(type, ...)
	let l:t = ""
	if a:0
		let l:t = input({'prompt':'Pattern: ','default':'','completion':"custom,CompletionForSearchAndReplaceToken",'highlight':'HighlightWhileTypingVisual'})
	else 
		let l:t = input({'prompt':'Pattern: ','default':'','completion':"custom,CompletionForSearchAndReplaceToken",'highlight':'HighlightWhileTypingMotion'})
	endif
	if l:t == ""
		return
	endif
	set hlsearch
	if !a:0
		call feedkeys("`[v`]\<esc>n")
	endif
	call setreg("/", "\\%V" . l:t)
	exe "redraw"
	call feedkeys("`z")
endfunction

function! DoForCountsImpl()
		let l:pattern = trim(getreg('/'),"\\%V")
		let l:target = input('Replace: ',"","custom,CompletionForSearchAndReplaceTarget")
		if l:target == ""
			call feedkeys("`z")
			return
		endif
		if l:target == "<delete>"
			let l:target = ""
		endif
		let l:cmd == ""
		if l:target[0] == '@'
			let l:cmd = "'<,'>g/" . getreg('z') . "/:norm " . l:target[1:]
		else
			let l:cmd = "'<,'>s/" . l:pattern ."/". l:target ."/g"
		endif
		call feedkeys("`z")
		exe l:cmd
endfunction

function! DoForCounts()
	if v:count == 0
		call DoForCountsImpl(searchcount()['total'])
	else
		call DoForCountsImpl(v:count1)
	endif
endfunction
 " nnoremap <silent> <leader>r <cmd>DoForCounts<CR>
nnoremap <silent> <leader>r call DoForCountsImpl()<CR>

" command! -count=0 -nargs=0 DoForCounts silent call DoForCounts(<f-args>)
" TODO: add a change next n occurances like in emacs - interactive
