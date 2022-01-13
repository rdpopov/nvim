inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
set pumheight=16
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
lua require('cmp_conf')
lua require('treesitter_conf')
lua require('sniprun_conf')
lua require('aerial_conf')


lua << EOF
require('neogen').setup {
        enabled = true,
        input_after_comment = true,
    }
EOF


function! g:Scope() 
	let res =  nvim_treesitter#statusline({'indicator_size':100, 'separator':"|"})
	if res == v:null
		return ""
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
