inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
set pumheight=16
nnoremap <space>q <cmd>lua vim.lsp.diagnostic.set_loclist()<CR>

source $HOME/.config/nvim/configs/vista.vim

lua require('lsp_conf')
lua require('compe_conf')
lua require('navigator_conf')
lua require('treesitter_conf')
