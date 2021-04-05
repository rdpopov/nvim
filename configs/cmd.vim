" Contents: Keybinds that i have  all in one place
" I have a thing that indexes them and puts them in a menu
" with descruiption for help, its pretty nifty

"Leader key, any place there is <Leader> substitute for this
" currnetly it is the \ symbol
let mapleader = "\\"
if has('autocmd')
    autocmd filetype python set expandtab
    autocmd filetype nim set expandtab
    "`autocmd BufNewFile,BufRead *.nim set filetype=nim
endif
" Finds all keybinds written in a predetermined format and puts them in a
" quickfix list
function! g:Help_bind()
    cexpr system("$HOME/.config/nvim/.find.sh")
    copen
endfunction

function! g:OpenLspConfHelp()
    execute ":vsplit "."$HOME/.config/nvim/plugged/nvim-lspconfig/CONFIG.md"
endfunction

inoremap <Leader>l <Esc>:call CycleLanguagesUp()<CR>a
";Cycle input language for Insert mode up, Search for CycleLanguagesDown for opposite 
nnoremap <Leader>l :call CycleLanguagesUp()<CR>
";Cycle input language for Insert mode up, Search for CycleLanguagesDown for opposite 
nnoremap <F10> :call Help_bind()<CR>
";Open window with all the user defined binfigs 
nmap <silent> ,/ :nohlsearch<CR>
";Clear search selection  
nnoremap <C-n> :Lexplore<CR>
";Execute a search and replace in current file w/ conform
""esc terminal mode when in it
:tnoremap <Esc> <C-\><C-n>
";Use Esc key to clear modes in terminal
noremap <Leader>y "*y
";Yank into system clipboard (might not work)
noremap <Leader>p "*p
";Paste from system clipboard (might not work)
noremap <Leader>Y "+y
";Yank into system clipboard (might not work)
noremap <Leader>P "+p
";Paste from system clipboard (might not work)

"Window managment
nnoremap <C-h> :call ResizeWith('h')<CR>
";Resize window left
nnoremap <C-j> :call ResizeWith('j')<CR>
";Resize window down
nnoremap <C-k> :call ResizeWith('k')<CR>
";Resize window up
nnoremap <C-l> :call ResizeWith('l')<CR>
";Resize window right
nnoremap <M-h> :wincmd h<CR>
";go to window left
nnoremap <M-j> :wincmd j<CR>
";go to window down
nnoremap <M-k> :wincmd k<CR>
";go to window up
nnoremap <M-l> :wincmd l<CR>
";go to window right

noremap <C-s> :execute "vsplit term://".$SHELL<CR>
";Cteate a terminal in Vertical Split

" replace all occurances of word under cursor with user input interactively
nnoremap <C-d> :execute ":%s/".expand('<cword>')."/".input('replace <'.expand('<cword>').'> with: ')."/gc"<CR>
";Execute a search and replace in current file w/ conform
nnoremap <C-t> :tabdo execute ":%s/".expand('<cword>')."/".input('replace <'.expand('<cword>').'> with: ')."/gc"<CR>
";Execute a search and replace in all tabs w/ conform
nnoremap <C-b> :bufdo execute ":%s/".expand('<cword>')."/".input('replace <'.expand('<cword>').'> with: ')."/gc"<CR>
";Execute a search and replace in all buffers w/ conform

nnoremap <F9> :e $MYVIMRC<CR> 
";open vimrc
nnoremap <F12> :source $MYVIMRC<CR> 
";Resource Config

vnoremap <M-b> :call OpenInBrowser()<cr>
"; Open thing in visual selection in a browser
vnoremap <M-t> :call ExecInTerminal()<cr>
"; Execute thing in vuisual selection in terminal
vnoremap <M-T> :call SudoExecInTerminal()<cr>
"; Execute thing in visual selection in terminal w/ sudo
nnoremap <silent> <leader>e :norm<C-Y>,<cr>
"; write around word 
nnoremap <silent> sa :call Around(input("Surround With: "))<CR>
