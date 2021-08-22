function! Modified()
	return &modified ? '[+] ':''
endfunction

function! GitStatus()
	try
		let [a,m,r] = GitGutterGetHunkSummary()
		return printf('+%d ~%d -%d', a, m, r)
	catch
		return printf('')
	endtry
endfunction
