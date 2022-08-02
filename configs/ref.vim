" Contents: Something to hood include search and def search into with qflists
" As to take advanige of vim as an ide-ish thing

function g:ExecToList(exc,arg)
	redir => srch 
	silent exe a:exc
	redir END
	if len(srch) > 1
		call setloclist(0,[], a:arg, {'title': 'Search'})
		let tmp = split(srch,"\n")
		let crnt_file = ""
		for ln in tmp
				echo ln
			if !empty(glob(ln))
				let crnt_file = findfile(ln)
			else
				let line = matchstr(ln,'^ \{1,}\d\{1,}: \{1,}\d\{1,}')
				let ln_n = substitute(matchstr(line,':.*')[1:],' ','','g')
				let ent = {'filename':crnt_file,'lnum':ln_n,'text':ln[len(line):]}
				" debug print
				"echo ent
				call setloclist(0,[ent],'a')
			endif
		endfor
		lopen
	endif
endfunction


function g:IncRef()
	call ExecToList('ilist '.expand('<cword>'),'f')
endfunction

function g:IncFind()
	call ExecToList('isearch '.input("Look for: "),'f')
endfunction

function g:DefRef()
	call ExecToList('dlist '.expand('<cword>'),'f')
endfunction

function g:DefFind()
	call ExecToList('dsearch '.input("Look for: "),'f')
endfunction


command! MakeTags !ctags -R --exclude=.git --exclude=.ccls_cache --exclude=test
