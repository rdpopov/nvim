inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
set pumheight=16
nnoremap <leader>d <cmd>lua vim.lsp.diagnostic.set_loclist()<CR>

source $HOME/.config/nvim/configs/vista.vim

lua require('lsp_conf')
lua require('compe_conf')
lua require('lsputils')
lua require('treesitter_conf')
