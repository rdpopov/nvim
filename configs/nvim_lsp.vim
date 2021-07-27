inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
set pumheight=16
nnoremap <leader>d <cmd>lua vim.lsp.diagnostic.set_loclist()<CR>


nnoremap gD <Cmd>lua vim.lsp.buf.declaration()<CR> 
nnoremap gd <Cmd>lua vim.lsp.buf.definition()<CR> 
nnoremap K <Cmd>lua vim.lsp.buf.hover()<CR> 
nnoremap \\rn <cmd>lua vim.lsp.buf.rename()<CR> 
nnoremap \\ca <cmd>lua vim.lsp.buf.code_action()<CR> 
nnoremap gr <cmd>lua vim.lsp.buf.references()<CR> 
nnoremap \\e <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR> 
nnoremap [d <cmd>lua vim.lsp.diagnostic.goto_prev()<CR> 
nnoremap ]d <cmd>lua vim.lsp.diagnostic.goto_next()<CR> 

source $HOME/.config/nvim/configs/vista.vim

lua require('lsp_conf')
lua require('compe_conf')
lua require('fzf-lsp')
lua require('treesitter_conf')
