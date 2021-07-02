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
    format_on_save = false;
  };

	source = {
	path = true;
	buffer = true;
	nvim_lsp = true;
	spell = false;
	tags = false;
	treesitter = false;
	};
	}

EOF
if index(g:plug_mode,"navigator") >=0
	lua<<EOF
	require'navigator'.setup{
	default_mapping = false,
  lsp = {
    format_on_save = false};
  }
EOF
endif
nnoremap <space>q <cmd>lua vim.lsp.diagnostic.set_loclist()<CR>
