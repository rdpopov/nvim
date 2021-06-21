if (has("termguicolors"))
  set termguicolors
endif

colorscheme ayu

set laststatus=2
set noshowmode
" functions needed for statusline
function! LspError() abort
  let sl = ''
  try
		if luaeval('not vim.tbl_isempty(vim.lsp.buf_get_clients(0))')
  	  let sl = luaeval("vim.lsp.diagnostic.get_count(0, [[Error]])")
  	endif
  catch
		let sl = ''
  endtry
  return sl
endfunction

function! LspWarn() abort
  let sl = ''
  try
		if luaeval('not vim.tbl_isempty(vim.lsp.buf_get_clients(0))')
  	  let sl.=luaeval("vim.lsp.diagnostic.get_count(0, [[Warning]])")
  	endif
  catch
		let sl = ''
  endtry
  return sl
endfunction

function! GitStatus()
	try
		let [a,m,r] = GitGutterGetHunkSummary()
		return printf('+%d ~%d -%d', a, m, r)
	catch
		return printf('')
	endtry
endfunction

