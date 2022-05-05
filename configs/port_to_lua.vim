
" -- navigation
function! g:Grep(var)
	execute 'grep -srnw --binary-files=without-match --exclude-dir=.git --exclude-dir=.ccls-cache . -e ' . a:var
	copen()
endfunction

function! g:Clone()
	execute 'mksession! ~/.sesh.vim'
	execute '!xfce4-terminal -e 'nvim -S ~/.sesh.vim' --maximize --title=NVIM-tmp'
endfunction

function! g:ManPagesArg()
	let p = ""
	try
		let sec = input('Sections: ')
		if len(sec) != 0
			let p = 'sections={"'.join(split(sec,' '),'","').'"}'
		endif
	endtry
	execute ':Telescope man_pages '.p
endfunction

" -- lsp
function! g:ToggleDiagn()
    if get(getloclist(0, {'winid':0}), 'winid', 0)
        lclose
    else
		lua vim.diagnostic.setloclist()
    endif
endfunction

function! g:OpenLspConfHelp()
 execute ":vsplit "."$HOME/.config/nvim/plugged/nvim-lspconfig/CONFIG.md"
endfunction

function! g:Scope() 
	if &ft == "nim"
		return ''
	endif
	let res = nvim_treesitter#statusline({'indicator_size':100, 'separator':"|"})
	if res == v:null
		return ''
	else
		try
			let res = split(split(nvim_treesitter#statusline({'indicator_size':100, 'separator':"|"}),'(')[0],' ')[1]
			if len(res) > 0
				return res
			else
				return ''
			endif
		catch
			return ''
		endtry
	endif
	return ''
endfunction
