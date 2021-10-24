inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
set pumheight=16
function! g:ToggleDiagn()
    if get(getloclist(0, {'winid':0}), 'winid', 0)
        lclose
    else
        lua vim.lsp.diagnostic.set_loclist()
    endif
endfunction

function! g:OpenLspConfHelp()
 execute ":vsplit "."$HOME/.config/nvim/plugged/nvim-lspconfig/CONFIG.md"
endfunction

hi link LspDiagnosticsDefaultError Error 
hi link LspDiagnosticsDefaultWarning Todo
hi link LspDiagnosticsDefaultInformation Normal 
hi link LspDiagnosticsDefaultHint Normal 


nnoremap <leader>d :call ToggleDiagn()<CR>
nnoremap gD <Cmd>lua vim.lsp.buf.declaration()<CR> 
nnoremap gd <Cmd>lua vim.lsp.buf.definition()<CR> 
nnoremap K <Cmd>lua vim.lsp.buf.hover()<CR> 
nnoremap rn <cmd>lua vim.lsp.buf.rename()<CR> 
nnoremap gca <cmd>lua vim.lsp.buf.code_action()<CR> 
nnoremap gr :Telescope lsp_references theme=get_ivy<CR> 
"nnoremap \\e <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR> 
nnoremap \\e :Telescope lsp_document_diagnostics<CR> 
nnoremap [d <cmd>lua vim.lsp.diagnostic.goto_prev()<CR> 
nnoremap ]d <cmd>lua vim.lsp.diagnostic.goto_next()<CR> 
source $HOME/.config/nvim/configs/vista.vim
lua require('cmp_conf')
lua require('treesitter_conf')

function! g:Scope() 
	let res = nvim_treesitter#statusline({'indicator_size':100, 'separator':"|"})
	if res == v:null
		return NearestMethodOrFunction()
	else
	  let res = split(nvim_treesitter#statusline({'indicator_size':100, 'separator':"|"}),'|')
		if len(res) > 0
			return NearestMethodOrFunction()
		else
			return ''
		endif
	endif
	return ''
endfunction
