inoremap <leader><leader> <Esc>/<++><Enter>"_c4l
nnoremap <leader><leader> <Esc>/<++><Enter>"_c4l

nnoremap ,ma :execute ":-1read $HOME/.config/nvim/snippets/".&filetype."/main"<CR>
nnoremap ,fu :execute ":-1read $HOME/.config/nvim/snippets/".&filetype."/func"<CR>
nnoremap ,st :execute ":-1read $HOME/.config/nvim/snippets/".&filetype."/strc"<CR>
nnoremap ,cl :execute ":-1read $HOME/.config/nvim/snippets/".&filetype."/clas"<CR>
nnoremap ,zb :execute ":-1read $HOME/.config/nvim/snippets/".&filetype."/dbpr"<CR>
