
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
noremap <F2> :QuickRun<CR>
noremap <F3> :Autoformat<CR>:retab<CR>

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
noremap <C-s> :execute "vsplit term://".$SHELL<CR>
" replace all occurances of word under cursor with user input 
nnoremap <M-x> :execute ":%s/".expand('<cword>')."/".input('replace <'.expand('<cword>').'> with: ')."/g"<CR>
nnoremap <M-t> :tabdo execute ":%s/".expand('<cword>')."/".input('replace <'.expand('<cword>').'> with: ')."/g"<CR>
nnoremap <M-b> :bufdo execute ":%s/".expand('<cword>')."/".input('replace <'.expand('<cword>').'> with: ')."/g"<CR>

" replace all occurances of word under cursor with user input interactively
nnoremap <C-x> :execute ":%s/".expand('<cword>')."/".input('replace <'.expand('<cword>').'> with: ')."/gc"<CR>
nnoremap <C-t> :tabdo execute ":%s/".expand('<cword>')."/".input('replace <'.expand('<cword>').'> with: ')."/gc"<CR>
nnoremap <C-b> :bufdo execute ":%s/".expand('<cword>')."/".input('replace <'.expand('<cword>').'> with: ')."/gc"<CR>
