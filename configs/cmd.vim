"nnoremap ; :
"sneak
let g:sneak#label = 1
if has('autocmd')
	autocmd filetype python set expandtab
	autocmd filetype nim set expandtab
	autocmd BufNewFile,BufRead *.nim set filetype=nim
endif
" commands bound on f-s
"f1
nnoremap <F2> :QuickRun<CR>
"f2
"f3
noremap <F3> :Autoformat<CR>
""make code tags for jumping
command! MakeTags !ctags -R
"hide highlights searches
nmap <silent> ,/ :nohlsearch<CR>
""esc terminal mode when in it
:tnoremap <Esc> <C-\><C-n>
""open small terminal window down
nnoremap ,tt :sp<bar>term<cr><c-w>J:resize10<cr>
