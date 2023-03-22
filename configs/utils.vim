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

nnoremap  <silent> ss "zyiw :set opfunc=ChangeInMotion<CR>g@
function! CompletionForSearchAndReplace(ArgLead, CmdLine,...)
	let r = getreg('/')
	if r == ""
		return join([''],"\n")
	else
		let rstr = trim(r,"\\|\<|\>")
		let res_list = uniq([r,rstr,a:ArgLead])
		if len(res_list) == 2
			let res_list += [""]
		endif
		return join(res_list,"\n")
	endif
endfunction

function! ChangeInMotion(type, ...)
	let l:t = getreg("z")
	" if a:0  " Invoked from Visual mode, use '< and '> marks.
	" 	let l:t = input('Replace (def: '. getreg('/') . ') :',"","custom,CompletionForSearchAndReplace") 
	" 	if l:t == ""
	" 		let l:t = etreg("/")
	" 	endif
	" 	let l:target = input('Replace '. l:t .' with: ')
	" 	let l:cmd =  "normal! '<s/" . l:t ."/". l:target ."/g'>" . @
	" 	let let
	" else
	" 1 get cword
	" 2 if not exist prompt for input, otherwise get the search register
	let let
	if l:t == ""
		let l:t = input('Replace (def: '. getreg('/') . ' ): ')
	endif
	" if l:t == ""
	" 	let l:t = getreg("/")
	" endif
	let l:target = input('Replace '. l:t . ' with: ')
	if a:type == 'line'
		silent exe "normal! '[v']".@
	elseif a:type == 'block'
		silent exe "normal! '[\<C-V>']".@
	else
		silent exe "normal! '[V']" .@
	endif
	silent exe "'<,'>s/\\%V" . l:t ."/". l:target ."/g"
endfunction
