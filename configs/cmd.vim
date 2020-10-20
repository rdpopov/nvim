
"nnoremap ; :
"sneak
let g:sneak#label = 1
set foldmethod=syntax

if has('autocmd')
    autocmd filetype python set expandtab
    autocmd filetype nim set expandtab
    "`autocmd BufNewFile,BufRead *.nim set filetype=nim
endif
" commands bound on f-s
"f1
"f3
noremap <F3> :Autoformat<CR>:retab<CR>
"noremap <c-A> :Ag

""make code tags for jumping
command! MakeTags !ctags -R
"hide highlights searches
nmap <silent> ,/ :nohlsearch<CR>
""esc terminal mode when in it
:tnoremap <Esc> <C-\><C-n>
""open small terminal window down

noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p
nmap <Leader>gm <Plug>(git-messenger)

noremap <leader>c :ContextToggleWindow<CR> 
