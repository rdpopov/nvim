setlocal include=^\\s*\\(from\\\|import\\\|include\\)\\s
setlocal includeexpr=NimInclude(v:fname)
setlocal define=^\\(proc\\\|func\\\|const\\\|macro\\\|\\s\\+\\zs\\k*\\ze.*=.*object\\)

function! g:NimInclude(fname) abort
	if !empty(findfile(a:fname))
		return a:fname
	else
		return getcwd().'/'.findfile(a:fname.'.nim')
	endif
endfunction
