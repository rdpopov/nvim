call plug#begin()
	" -- Language features
	Plug 'alaviss/nim.nvim'                             "   Nim language support
	Plug 'sheerun/vim-polyglot'                         "   any other language support
	Plug 'plasticboy/vim-markdown'                      "   coloring for markdown
	Plug 'Chiel92/vim-autoformat'                       "   Easy file formatter
	" -- Languge helpers
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " tree-sitter for neovim tree-sitter for neovim
	Plug 'neovim/nvim-lspconfig'                        "   lsp configuration api for native lsp lsp configuration api for native lsp
	Plug 'ray-x/lsp_signature.nvim'                     "   signatire preview via lsp signatire preview via lsp
	Plug 'liuchengxu/vista.vim'                         "   tag and ouline preview it supports tags which are useful tag and ouline preview it supports tags which are useful
	"  -- Completion ... those three should be 1 plugin so it keeps lines at a minimum ... 
	Plug 'hrsh7th/nvim-cmp'                             "    better than compe i guess
	Plug 'hrsh7th/cmp-nvim-lsp'                         "    lsp completion
	Plug 'hrsh7th/cmp-buffer'                           "    buffer completion
	Plug 'hrsh7th/cmp-nvim-lua'                         "    vim lua api completion
	Plug 'hrsh7th/cmp-path'                             "    path completion
	Plug 'f3fora/cmp-spell'                             "    spelling completion
	Plug 'ray-x/guihua.lua', {'do': 'cd lua/fzy && make' } " code display
	Plug 'ray-x/navigator.lua'													" code display
	" -- Better Navigaion and vim as a whole
	Plug 'nvim-telescope/telescope.nvim'                " telescope
	" depends on
	Plug 'nvim-lua/plenary.nvim'                        "   telescope needs it dunno
	Plug 'folke/todo-comments.nvim'
	Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' } " thing that implements fzf for tlelescope
	Plug 'tpope/vim-abolish'                            "   better find and replace, tpope stuff is blessed better find and replace, tpope stuff is blessed
	Plug 'phaazon/hop.nvim'                             "   alternative to sneak more like easymotion alternative to sneak more like easymotion
	Plug 'mbbill/undotree'                              "   Undotree Undotree
	Plug 'antoinemadec/FixCursorHold.nvim'              "    ?  ?
	" -- Git
	Plug 'tpope/vim-fugitive'                           "   git client git client
	Plug 'airblade/vim-gitgutter'                       "   git integration git integration
	" -- I dunno ¯\_(ツ)_/¯
	Plug 'thinca/vim-quickrun'                          "   quickrun code files, useful for nothing but c/c++ quickrun code files, useful for nothing but c/c++
	Plug 'dbeniamine/cheat.sh-vim'                      "   query help from inside vim query help from inside vim
	Plug 'norcalli/nvim-colorizer.lua'                  "   colorizer for colors in css and anywhere really
	Plug 'shaunsingh/moonlight.nvim'
	Plug 'ray-x/aurora'
call plug#end()
