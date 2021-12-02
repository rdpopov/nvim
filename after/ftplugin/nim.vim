
setlocal include=^\\s*\\(from\\\|import\\|include\\)\\s
setlocal includeexpr=NimInclude(v:fname)
setlocal define=^\\s*\\\\(proc\\\|func\\)\\>

function! g:NimInclude(fname) abort
	if !empty(findfile(a:fname))
		return s:fname
	else
		return getcwd().'/'.findfile(a:fname.'.nim')
	endif
endfunction

