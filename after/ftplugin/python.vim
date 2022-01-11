set shiftwidth=4 tabstop=4 softtabstop=4 noexpandtab autoindent smartindent
set colorcolumn=80
setlocal path=.,**
setlocal include=^\\s*\\(from\\\|import\\)\\s*\\zs\\(\\S\\+\\s\\{-}\\)*\\ze\\($\\\|\ as\\)
setlocal define=^\\s*\\\(def\\\|class\\\)\\>
setlocal includeexpr=PyInclude(v:fname)

function! PyInclude(fname)
	let parts = split(a:fname, ' import ')
	echo parts
	let l = parts[0]
	if len(parts) > 1
		let r = parts[1]
		echo r
		let joined = join([l, r]. '.')
		echo joined
		let fp = substitute(joined, '\.', '/', 'g') . '.py'
		echo fp
		let found = glob(fp, 1)
		echo "" found
		if len(found)
			return found
		endif
	endif
endfunction
