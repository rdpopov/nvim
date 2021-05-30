if index(g:plug_mode,"lsp") >= 0  || index(g:plug_mode,"all") >= 0
	inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
	inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
	set pumheight=15
endif

lua<<EOF
	require'lspconfig'.nimls.setup{}
	require'lspconfig'.ccls.setup{}
	require'lspconfig'.jedi_language_server.setup{}
	require'lspconfig'.tsserver.setup{}
	require'lspconfig'.html.setup{}
	require'lspconfig'.gopls.setup{}
	require'lspconfig'.vimls.setup{}
vim.o.completeopt = "menuone,noinsert,preview"
require'compe'.setup {
	enabled = true;
	autocomplete = true;
	debug = false;
	min_length = 1;
	preselect = 'enable';
	throttle_time = 80;
	source_timeout = 200;
	incomplete_delay = 400;
	max_abbr_width = 100;
	max_kind_width = 100;
	max_menu_width = 100;
	documentation = true;
  lsp = {
    format_on_save = true;
  };

	source = {
	path = true;
	buffer = true;
	nvim_lsp = true;
	spell = true;
	tags = true;
	treesitter = true;
	};
	}

EOF
if index(g:plug_mode,"navigator") >=0
	lua<<EOF
	require'navigator'.setup()
EOF
else
	nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
	nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
	nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
	nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
	nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
	nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
endif
