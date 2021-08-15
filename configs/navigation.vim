" Navigation things i use


function! g:Grep(var)
	execute "grep -srnw --binary-files=without-match --exclude-dir=.git --exclude-dir=.ccls-cache . -e " . a:var
	copen
endfunction
nnoremap <leader>g :call Grep(input('Search for: '))<CR>
nnoremap <leader>G :call Grep(expand("<cword>"))<CR>
" netrw config
source $HOME/.config/nvim/configs/netrw.vim
" Fzf and grep
" hop.nvim
lua require('hop_conf')

"nnoremap <leader>g :Rg 
"nnoremap <leader>G :Rg<CR>
nnoremap <leader>t :Telescope tagstack<CR>
nnoremap <leader>T :Telescope tags<CR>

nnoremap <leader>m :Telescope marks<CR>
nnoremap <leader>M :Telescope man_pages<CR>
nnoremap <leader>b :Telescope buffers<CR>
nnoremap <leader>B :Telescope <CR>
nnoremap <leader>h :Telescope oldfiles<CR>
nnoremap <leader>o :Telescope find_files <CR>
nnoremap <leader>j :Telescope jumplist <CR>
nnoremap <leader>k :Telescope keymaps <CR>
nnoremap <leader>f :Telescope current_buffer_fuzzy_find<CR>
nnoremap <leader>s :Telescope git_status<CR>
nnoremap <leader>S :Telescope git_b_commits<CR>
nnoremap <leader>r :Telescope grep_string<CR>

lua require('telescope_conf')

