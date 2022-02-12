" Contents: Keybinds that i have  all in one place
"
" I have a thing that indexes them and puts them in a menu
" with descruiption for help, its pretty nifty

"Leader key, any place there is <Leader> substitute for this
" currnetly it is the \ symbol
" -- Leader Key
map  <Space> <Leader>
" -- Procedure to make ctags
" command! -bang -nargs=* MakeTags !ctags -R --exclude=.git --exclude=.ccls-cache --exclude=test

noremap <F2> :QuickRun<CR>
noremap <F3> :Autoformat<CR>:retab<CR>
nnoremap <F4> :call Clone()<CR><CR>
nnoremap <F5> :HowIn

inoremap <Leader>l <Esc>:call CycleLanguagesUp()<CR>a
nnoremap <Leader>l :call CycleLanguagesUp()<CR>

vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
nmap <silent> ,/ :nohlsearch<CR>

tnoremap <Esc> <C-\><C-n>
inoremap <C-w> <Esc><C-w>
tmap <C-w> <Esc><C-w>
"  -- Terminal managment commands
nnoremap gT :tabclose <CR>
nnoremap <leader>ns :call OpenTerm(v:true)<cr>
nnoremap <silent><C-s> :call OpenTerm(v:false)<cr>
nnoremap <leader><C-s> :call CycleTerminal(1)<cr> 
"  -- Connect system clipboard with vim's registers , without cloberring my own
"  yank register
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p
"  -- Window managment might remove them. I Should make my own managment thingy
nnoremap <M-h> :call ResizeWith('h')<CR>
nnoremap <M-j> :call ResizeWith('j')<CR>
nnoremap <M-k> :call ResizeWith('k')<CR>
nnoremap <M-l> :call ResizeWith('l')<CR>
nnoremap <M-;> :tabNext <CR>
"  -- For make integration
" noremap <leader><ESC> :cclose<CR>
nnoremap <silent> <leader>x :Make <cr>

vnoremap <silent> <leader>x :SlimeSend<CR>
nnoremap <silent> <leader>X vip:SlimeSend<CR>

function! g:QfToggle()
 for winnr in range(1, winnr('$'))
  if getwinvar(winnr, '&syntax') == 'qf'
   cclose
   return
  endif
 endfor
 copen
 return
endfunction
nnoremap <leader>c :call QfToggle()<cr>
"nnoremap <C-d> :execute ":%s/".expand('<cword>')."/".input('replace <'.expand('<cword>').'> with: ')."/gc"<CR>
"nnoremap <C-t> :tabdo execute ":%s/".expand('<cword>')."/".input('replace <'.expand('<cword>').'> with: ')."/gc"<CR>
"nnoremap <C-b> :bufdo execute ":%s/".expand('<cword>')."/".input('replace <'.expand('<cword>').'> with: ')."/gc"<CR>
"  -- Text managment
nnoremap == vi{=<Esc>
nnoremap Y y$
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap <silent> <leader>u :UndotreeToggle<cr>
nnoremap <silent> <C-t> :AerialToggle<CR>
nnoremap <silent> <leader>s :call ToggleLocalSpelling()<CR>
nnoremap <leader>= 1z=
"    -- Obsolete actially
vnoremap <M-b> :call OpenInBrowser()<cr>
vnoremap <M-t> :call ExecInTerminal()<cr>
vnoremap <M-T> :call SudoExecInTerminal()<cr>
"    -- Session managment and managment in general
" command! Erc :e $MYVIMRC | lcd %:p:h
nnoremap <F6> :mksession!<CR>
nnoremap <F7> :!echo -e "let g:auto_session= v:true\nlet g:use_ripgrep = v:true" > localrc.vim <CR><CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>W :w
nnoremap <silent><F9> :Erc<CR>
nnoremap <F12> :source $MYVIMRC<CR>
" -- Git commands
if has("nvim")
	nnoremap <leader>] :Gitsigns next_hunk<CR>
	nnoremap <leader>[ :Gitsigns prev_hunk<CR>
	nnoremap <leader>A :Gitsigns preview_hunk<CR>
	nnoremap <leader>D :Gitsigns setqflist<CR>
	" -- writing
	nnoremap <F8> :Centerpad 50 <CR>
	nnoremap <silent> qq vip:s/ \+/ /ge<CR>vip:s/ , /, /ge<CR>vip:s/ \. /. /ge<CR>:nohlsearch<CR>vipgq<Esc>
	vnoremap <silent> qq <Esc>gvs/ \+/ /ge<CR>gv:s/ , /, /ge<CR>gv:s/ \. /. /ge<CR>:nohlsearch<CR>gvgq<Esc>
	" -- nvim-dap
	nnoremap <silent> <leader><F5> :lua require'dap'.continue()<CR>
	nnoremap <silent> <leader><F10> :lua require'dap'.step_over()<CR>
	nnoremap <silent> <leader><F11> :lua require'dap'.step_into()<CR>
	nnoremap <silent> <leader><F12> :lua require'dap'.step_out()<CR>
	nnoremap <silent> <leader><F4> :lua require'dap'.toggle_breakpoint()<CR>
	" telescope + nvim dap
	nnoremap <silent> <leader>S :Telescope dap frames<CR>
	nnoremap <silent> <leader>B :Telescope dap list_brakpoints<CR>
endif
