function! g:Grep(var)
	execute 'grep -srnw --binary-files=without-match --exclude-dir=.git --exclude-dir=.ccls-cache . -e ' . a:var
	copen()
endfunction

nnoremap <leader>g :call Grep(input('Search for: '))<CR>
nnoremap <leader>G :call Grep(expand('<cword>'))<CR>

function! g:Clone()
	execute 'mksession! ~/.sesh.vim'
	execute '!xfce4-terminal -e 'nvim -S ~/.sesh.vim' --maximize --title=NVIM-tmp'
endfunction

function! g:ManPagesArg()
	let p = ""
	try
		let sec = input('Sections: ')
		if len(sec) != 0
			let p = 'sections={"'.join(split(sec,' '),'","').'"}'
		endif
	endtry
	execute ':Telescope man_pages '.p
endfunction

nnoremap <silent>  <leader>t :Telescope <CR>
nnoremap <silent>  <leader>T :Telescope tags theme=get_ivy<CR>
nnoremap <silent>  <leader>m :Telescope marks theme=get_ivy<CR>
nnoremap <silent>  <leader>M :call ManPagesArg() <CR>
nnoremap <silent>  <leader>b :Telescope buffers <CR>
nnoremap <silent>  <leader>O :Telescope oldfiles <CR>
nnoremap <silent>  <leader>o :Telescope find_files <CR>
nnoremap <silent>  <leader>j :Telescope jumplist <CR>
nnoremap <silent>  <leader>h :Telescope help_tags <CR>
nnoremap <silent>  <leader>k :Telescope keymaps <CR>
nnoremap <silent>  <leader>f :Telescope current_buffer_fuzzy_find theme=get_ivy<CR>
nnoremap <silent>  <leader>r :Telescope grep_string theme=get_ivy<CR>
vnoremap <silent>  <leader>r "zy:Telescope live_grep theme=get_ivy default_text=<C-r>z<cr>
nnoremap <silent>  <leader>R :Telescope live_grep theme=get_ivy<CR>

lua require('hop_conf')
lua require('telescope_conf')
lua require('gitsigns_conf')
lua require('rgxplainer')

source $HOME/.config/nvim/configs/netrw.vim
source $HOME/.config/nvim/default_plugins/vinegar.vim
