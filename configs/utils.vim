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
	let r = getreg('/')
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
	let r = getreg('/')
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
		let l:top = "\\%>'z"
		let l:bot = "\\%<']"
		let w:h = matchadd('IncSearch', l:top . a:cmdline . l:bot)
		exe "redraw"
		call matchdelete(w:h)
		return []
endfunction

let mapleader = ' '

nnoremap <silent> ss mz"zyiw :set opfunc=HighlightInMotion<CR>g@
vnoremap <silent> ss mz<ESC>:call HighlightInMotion("","'<","'>")<CR>

function! HighlightInMotion(type, ...)
	if a:0
		let l:t = input({'prompt':'Pattern: ','default':'','completion':"custom,CompletionForSearchAndReplaceToken",'highlight':'HighlightWhileTypingVisual'})
		if l:t == ""
			return
		endif
		set hlsearch
		call setreg("/", "\\%V" . l:t)
		exe "redraw"
	else
		let l:t = input({'prompt':'Pattern: ','default':'','completion':"custom,CompletionForSearchAndReplaceToken",'highlight':'HighlightWhileTypingMotion'})
		if l:t == ""
			call feedkeys("'z")
			return
		endif
		let l:top = "\\%>'z"
		let l:bot = "\\%<']"
		set hlsearch
		call setreg("/", l:top . l:t . l:bot)
		exe "redraw"
	endif
		call feedkeys("'z")
endfunction

function! DoForCountsImpl(count)
		" let l:count = a:count_fn()
		" ifwe have a \\%<'] suffix we are in substite pattern, we will remove
		" that as we dont knwo if the line count until the '] mark is changed,
		" which might change what exactly is changed, therefore we will just keep
		" the start and use number of matches to know when to stop.
		" let l:pattern = getreg('/')
		" 	let l:pattern = l:pattern[:-6]
		" endif
		" Also if input starts with a an '@' it would be treated as a kind of
		" macro not as text for substitution
		let l:get_command = input({'prompt':'Substitute search(start with @ for a command): ','default':'','completion':"custom,CompletionForSearchAndReplaceToken"})
		if l:get_comman[0] == '@'
			let l:get_command = l:get_command[1:]
			let l:get_command = "norm gn" . l:get_command
		else
			let l:get_command = "norm cgn" . l:get_command
		endif
		call feedkeys("'z".a:count.l:get_command)
endfunction
function! DoForCounts()
	if v:count == 0
		call DoForCountsImpl(searchcount())
	else
		call DoForCountsImpl(v:count1)
	endif
endfunction
" TODO: add a change next n occurances like in emacs - interactive
