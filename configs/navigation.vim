" Navigation things i use


function! g:Grep(var)
	execute "grep -srnw --binary-files=without-match --exclude-dir=.git --exclude-dir=.ccls-cache . -e " . a:var
	copen
endfunction

" Function to clone my current session and spawn an ewa terminal for it 
" cos tmux dont play nice with mice and scroll

function! g:Clone()
	execute 'mksession! ~/.sesh.vim'
	execute "!xfce4-terminal -e 'nvim -S ~/.sesh.vim' --maximize --title=NVIM-tmp"
endfunction

nnoremap <leader>g :call Grep(input('Search for: '))<CR>
nnoremap <leader>G :call Grep(expand("<cword>"))<CR>
source $HOME/.config/nvim/configs/netrw.vim
source $HOME/.config/nvim/default_plugins/vinegar.vim
" Fzf and grep
" hop.nvim

"nnoremap <leader>g :Rg 
"nnoremap <leader>G :Rg<CR>
nnoremap <silent>  <leader>t :Telescope <CR>
nnoremap <silent>  <leader>T :Telescope tags theme=get_ivy<CR>
nnoremap <silent>  <leader>m :Telescope marks theme=get_ivy<CR>
nnoremap <silent>  <leader>M :Telescope man_pages <CR>
nnoremap <silent>  <leader>b :Telescope buffers <CR>
nnoremap <silent>  <leader>O :Telescope oldfiles <CR>
nnoremap <silent>  <leader>o :Telescope find_files <CR>
nnoremap <silent>  <leader>j :Telescope jumplist <CR>
nnoremap <silent>  <leader>h :Telescope help_tags <CR>
nnoremap <silent>  <leader>k :Telescope keymaps <CR>
nnoremap <silent>  <leader>f :Telescope current_buffer_fuzzy_find theme=get_ivy<CR>
"nnoremap <silent>  <leader>s :Telescope git_status theme=get_ivy<CR>
nnoremap <silent>  <leader>r :Telescope grep_string theme=get_ivy<CR>
vnoremap <silent>  <leader>r "zy:Telescope live_grep theme=get_ivy default_text=<C-r>z<cr>
nnoremap <silent>  <leader>R :Telescope live_grep theme=get_ivy<CR>

lua require('hop_conf')
lua require('telescope_conf')
lua require('gitsigns_conf')
lua require('nvim-startup').setup()
