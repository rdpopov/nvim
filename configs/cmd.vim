let g:sneak#label = 1
set foldmethod=syntax

if has('autocmd')
    autocmd filetype python set expandtab
    autocmd filetype nim set expandtab
    "`autocmd BufNewFile,BufRead *.nim set filetype=nim
endif
noremap <F2> :QuickRun<CR>
";Run current file
noremap <F3> :Autoformat<CR>:retab<CR>
";Format file 

function! g:Help_bind()
    cexpr system("$HOME/.config/nvim/.find.sh")
    copen
endfunction

nnoremap <F10> :call Help_bind()<CR>
nnoremap <F4> :Cheat 
";Open window with all the userdefined binfigs 
command! MakeTags !ctags -R
";Generate tags recursively
"hide highlights searches
nmap <silent> ,/ :nohlsearch<CR>
";Clear search selection  
""esc terminal mode when in it
:tnoremap <Esc> <C-\><C-n>
";Use Esc key to clear modes in terminal
""open small terminal window down
"saasadasd
noremap <Leader>y "*y
";Yank into system clipboard (might not work)
noremap <Leader>p "*p
";Paste from system clipboard (might not work)
noremap <Leader>Y "+y
";Yank into system clipboard (might not work)
noremap <Leader>P "+p
";Paste from system clipboard (might not work)

nmap <Leader>gm <Plug>(git-messenger)
";Toggle Git Messenger

noremap <leader>c :ContextToggleWindow<CR>
";Toggle function context
noremap <C-s> :execute "vsplit term://".$SHELL<CR>
";Cteate a terminal in Vertical Split
" replace all occurances of word under cursor with user input 
nnoremap <M-d> :execute ":%s/".expand('<cword>')."/".input('replace <'.expand('<cword>').'> with: ')."/g"<CR>
";Execute a search and replace in current file w/o conform
nnoremap <M-t> :tabdo execute ":%s/".expand('<cword>')."/".input('replace <'.expand('<cword>').'> with: ')."/g"<CR>
";Execute a search and replace in all tabs w/o conform
nnoremap <M-b> :bufdo execute ":%s/".expand('<cword>')."/".input('replace <'.expand('<cword>').'> with: ')."/g"<CR>
";Execute a search and replace in all buffers w/o conform

" replace all occurances of word under cursor with user input interactively
nnoremap <C-d> :execute ":%s/".expand('<cword>')."/".input('replace <'.expand('<cword>').'> with: ')."/gc"<CR>
";Execute a search and replace in current file w/ conform
nnoremap <C-t> :tabdo execute ":%s/".expand('<cword>')."/".input('replace <'.expand('<cword>').'> with: ')."/gc"<CR>
";Execute a search and replace in all tabs w/ conform
nnoremap <C-b> :bufdo execute ":%s/".expand('<cword>')."/".input('replace <'.expand('<cword>').'> with: ')."/gc"<CR>
";Execute a search and replace in all buffers w/ conform
nnoremap <F9> :e $MYVIMRC<CR> 
nnoremap <F12> :source $MYVIMRC<CR> 
";Resource Config
