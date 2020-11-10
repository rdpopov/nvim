
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
noremap <F2> :QuickRun<CR>                        ;Run current file
noremap <F3> :Autoformat<CR>:retab<CR>            ;Format file 

function! g:Help_bind()
    cexpr system(" find $NVIM_CONFIG_ROOT/configs $NVIM_CONFIG_ROOT/snippets -type f -name "*.vim"|xargs grep -e"map .*<.*>.*;" -h|sed -e 's/<silent>//g' -e 's/.*map//g' -e 's/<buffer>//g' -e 's/:.*;/;/g' -e 's/ *;/ ;/g' -e 's/^ *//g' -e 's/<leader>/<\\>/gi' -e 's/<Plug>//gi' -e 's/(.*).*;/;/g' -e 's/".*;/;/g' -e 's/;/\t/g' ")
    copen
endfunction


""make code tags for jumping
command! MakeTags !ctags -R                       ;Generate tags recursively
"hide highlights searches
nmap <silent> ,/ :nohlsearch<CR>                  ;Clear search selection  
""esc terminal mode when in it
:tnoremap <Esc> <C-\><C-n>                        ;Use Esc key to clear modes in terminal
""open small terminal window down

noremap <Leader>y "*y                             ;Yank into system clipboard (might not work)
noremap <Leader>p "*p                             ;Paste from system clipboard (might not work)
noremap <Leader>Y "+y                             ;Yank into system clipboard (might not work)
noremap <Leader>P "+p                             ;Paste from system clipboard (might not work)

nmap <Leader>gm <Plug>(git-messenger)             ;Toggle Git Messenger

noremap <leader>c :ContextToggleWindow<CR>        ;Toggle function context
noremap <C-s> :execute "vsplit term://".$SHELL<CR> ;Cteate a terminal in Vertical Split
" replace all occurances of word under cursor with user input 
nnoremap <M-x> :execute ":%s/".expand('<cword>')."/".input('replace <'.expand('<cword>').'> with: ')."/g"<CR>       ;Execute a search and replace in current file w/o conform
nnoremap <M-t> :tabdo execute ":%s/".expand('<cword>')."/".input('replace <'.expand('<cword>').'> with: ')."/g"<CR> ;Execute a search and replace in all tabs w/o conform
nnoremap <M-b> :bufdo execute ":%s/".expand('<cword>')."/".input('replace <'.expand('<cword>').'> with: ')."/g"<CR> ;Execute a search and replace in all buffers w/o conform

" replace all occurances of word under cursor with user input interactively
nnoremap <C-x> :execute ":%s/".expand('<cword>')."/".input('replace <'.expand('<cword>').'> with: ')."/gc"<CR>          ;Execute a search and replace in current file w/ conform
nnoremap <C-t> :tabdo execute ":%s/".expand('<cword>')."/".input('replace <'.expand('<cword>').'> with: ')."/gc"<CR>    ;Execute a search and replace in all tabs w/ conform
nnoremap <C-b> :bufdo execute ":%s/".expand('<cword>')."/".input('replace <'.expand('<cword>').'> with: ')."/gc"<CR>    ;Execute a search and replace in all buffers w/ conform

nnoremap <F12> :source $MYVIMRC<CR> ;Resource Config

