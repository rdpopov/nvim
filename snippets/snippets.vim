" inoremap <leader><leader> <Esc>/<++><Enter>"_c4l
" ";Insert mode go to next checkpoint <++>
" nnoremap <leader><leader> <Esc>/<++><Enter>"_c4l
" ";Normal mode go to next checkpoint <++>

nnoremap ,ma :execute ":-1read $HOME/.config/nvim/snippets/".&filetype."/main"<CR>
";Language specific snippet for main
nnoremap ,fu :execute ":-1read $HOME/.config/nvim/snippets/".&filetype."/func"<CR>
";Language specific snippet for function definition
nnoremap ,st :execute ":-1read $HOME/.config/nvim/snippets/".&filetype."/strc"<CR>
";Language specific snippet for struct(class)
nnoremap ,cl :execute ":-1read $HOME/.config/nvim/snippets/".&filetype."/clas"<CR>
";Language specific snippet for class
nnoremap ,zb :execute ":-1read $HOME/.config/nvim/snippets/".&filetype."/dbpr"<CR>
";Language specific snippet for debug print
