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
nnoremap <silent> ss "zyiw :set opfunc=ChangeInMotion<CR>g@
vnoremap <silent> ss <ESC>:call ChangeInMotion("","'<","'>")<CR>

function! CompletionForSearchAndReplaceToken(ArgLead, CmdLine,...)
	let empty_line = "^$"
	let r = getreg('/')
	if r == ""
		return join([''],"\n")
	else
		let rstr = trim(r,"\\|\<|\>")
		let res_list = uniq([r,rstr,empty_line,getreg("z"),a:ArgLead])
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
		let res_list = uniq([r,rstr,getreg("z"),a:ArgLead])
		if len(res_list) == 2
			let res_list += [""]
		endif
		return join(res_list,"\n")
	endif
endfunction

function! ChangeInMotion(type, ...)
	let l:cmd = ""
	if a:0  " Invoked from Visual mode, use '< and '> marks.
		let l:t = input('Replace: ',"","custom,CompletionForSearchAndReplaceToken")
		if l:t == ""
			return
		endif
		let l:target = input('Replace '. l:t . ' with: ',"","custom,CompletionForSearchAndReplaceTarget")
		if l:target == ""
			return
		endif
		let l:cmd =  "'<,'>s/\\%V" . l:t ."/". l:target ."/g" . @
	else
		let l:t = trim(getreg("z"),"\t| ")
		if l:t == ""
			let l:t = input('Replace: ',"","custom,CompletionForSearchAndReplaceToken")
		endif
		if l:t == ""
			return
		endif
		let l:target = input('Replace '. l:t . ' with: ',"","custom,CompletionForSearchAndReplace")
		if l:target == ""
			return
		endif
		" if a:type == 'line'
		" 	silent exe "normal! '[v']".@
		" elseif a:type == 'block'
		" 	silent exe "normal! '[\<C-V>']".@
		" else
		" 	silent exe "normal! '[v']" .@
		" endif
		let l:cmd = "'[,']s/" . l:t ."/". l:target ."/g"
	endif
		exe l:cmd
endfunction
