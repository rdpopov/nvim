" Contents: Keybinds that i have  all in one place
"
" I have a thing that indexes them and puts them in a menu
" with descruiption for help, its pretty nifty

"Leader key, any place there is <Leader> substitute for this
" currnetly it is the \ symbol
" -- Leader Key
map  <Space> <Leader>
" -- Procedure to make ctags
command! -bang -nargs=* MakeTags !ctags -R --exclude=.git --exclude=.ccls-cache --exclude=test
"	-- Commands  that are sometimes uesd 
noremap <F2> :QuickRun<CR>
noremap <F3> :Autoformat<CR>:retab<CR>
nnoremap <F4> :Cheat
nnoremap <F5> :HowIn
"	-- Language Switch
inoremap <Leader>l <Esc>:call CycleLanguagesUp()<CR>a
nnoremap <Leader>l :call CycleLanguagesUp()<CR>
"	-- Search Remaps
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
nmap <silent> ,/ :nohlsearch<CR>
"	-- Terminal Remaps
inoremap <C-w> <Esc><C-w>
tnoremap <C-w> <Esc><C-w>
tnoremap <Esc> <C-\><C-n>
noremap <C-s> :execute "vsplit term://".$SHELL<CR>
"	-- Connect system clipboard with vim's registers , without cloberring my own
"	yank register
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p
"	-- Window managment might remove them. I Should make my own managment thingy
nnoremap <C-h> :call ResizeWith('h')<CR>
nnoremap <C-j> :call ResizeWith('j')<CR>
nnoremap <C-k> :call ResizeWith('k')<CR>
nnoremap <C-l> :call ResizeWith('l')<CR>

nnoremap <M-h> :wincmd h<CR>
nnoremap <M-j> :wincmd j<CR>
nnoremap <M-k> :wincmd k<CR>
nnoremap <M-l> :wincmd l<CR>
nnoremap <M-;> :tabNext <CR>
"	-- For make integration
noremap <leader><ESC> :cclose<CR>
nnoremap <leader>x :make <cr>
function! g:QfToggle()
 for winnr in range(1, winnr('$'))
  if getwinvar(winnr, '&syntax') == 'qf'
   cclose
   return
  endif
 endfor
 copen
endfunction
nnoremap <leader>c :call QfToggle()<cr>
"nnoremap <C-d> :execute ":%s/".expand('<cword>')."/".input('replace <'.expand('<cword>').'> with: ')."/gc"<CR>
"nnoremap <C-t> :tabdo execute ":%s/".expand('<cword>')."/".input('replace <'.expand('<cword>').'> with: ')."/gc"<CR>
"nnoremap <C-b> :bufdo execute ":%s/".expand('<cword>')."/".input('replace <'.expand('<cword>').'> with: ')."/gc"<CR>
"	-- Text managment
nnoremap Y y$
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap <silent> <leader>u :UndotreeToggle<cr>
nnoremap <silent> <C-t> :Vista!!<CR>
nnoremap <silent> <leader>s :call ToggleLocalSpelling()<CR>
"	-- Obsolete actially
vnoremap <M-b> :call OpenInBrowser()<cr>
vnoremap <M-t> :call ExecInTerminal()<cr>
vnoremap <M-T> :call SudoExecInTerminal()<cr>
"	-- Session managment and managment in general
command! Erc :e $MYVIMRC | lcd %:p:h
nnoremap <F6> :mksession!<CR>
nnoremap <F7> :!echo -e "let g:auto_session= v:true\nlet g:use_ripgrep = v:true" > localrc.vim <CR><CR>
nnoremap <leader>w :source Session.vim<CR>
nnoremap <silent><F9> :Erc<CR>
nnoremap <F12> :source $MYVIMRC<CR>
" -- Git commands
nnoremap <leader>] :GitGutterNextHunk<CR>
nnoremap <leader>[ :GitGutterPrevHunk<CR>
nnoremap <leader>A :GitGutterPreviewHunk<CR>
nnoremap <leader>D :GitGutterQuickFix<CR>
