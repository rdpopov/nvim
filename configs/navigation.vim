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
nnoremap <silent>  <leader>t :Telescope tagstack theme=get_ivy<CR>
nnoremap <silent>  <leader>T :Telescope tags theme=get_ivy<CR>
nnoremap <silent>  <leader>m :Telescope marks theme=get_ivy<CR>
nnoremap <silent>  <leader>M :Telescope man_pages <CR>
nnoremap <silent>  <leader>b :Telescope buffers <CR>
nnoremap <silent>  <leader>B :Telescope <CR>
nnoremap <silent>  <leader>h :Telescope oldfiles <CR>
nnoremap <silent>  <leader>o :Telescope find_files <CR>
nnoremap <silent>  <leader>j :Telescope jumplist <CR>
nnoremap <silent>  <leader>k :Telescope keymaps <CR>
nnoremap <silent>  <leader>f :Telescope current_buffer_fuzzy_find theme=get_ivy<CR>
nnoremap <silent>  <leader>s :Telescope git_status theme=get_ivy<CR>
nnoremap <silent>  <leader>S :Telescope git_bcommits theme=get_ivy<CR>
nnoremap <silent>  <leader>r :Telescope grep_string theme=get_ivy<CR>
nnoremap <silent>  <leader>R :Telescope live_grep theme=get_ivy<CR>

lua require('telescope_conf')

