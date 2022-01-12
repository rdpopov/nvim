call plug#begin()
	" -- Language features
	Plug 'alaviss/nim.nvim'                             "   Nim language support
	Plug 'rust-lang/rust.vim'                           "		Rust editor support
	Plug 'plasticboy/vim-markdown'                      "   coloring for markdown
	Plug 'michaelb/sniprun', {'do': './install.sh'}     "   Better repl thing
	" -- More general languge helpers
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " tree-sitter for neovim tree-sitter for neovim
	Plug 'nvim-treesitter/playground'                   "   ii'd like to make my own treesitter things
	Plug 'danymat/neogen'                               "   have a thing for generating documentation based on treesitter
	Plug 'neovim/nvim-lspconfig'                        "   lsp configuration api for native lsp lsp configuration api for native lsp
	Plug 'ray-x/lsp_signature.nvim'                     "   signatire preview via lsp signatire preview via lsp
	Plug 'tpope/vim-commentary'
	Plug 'stevearc/aerial.nvim'                         "   tag and ouline preview it supports tags which are useful tag and ouline preview it supports tags which are useful
	Plug 'rafamadriz/friendly-snippets'
	Plug 'L3MON4D3/LuaSnip'
	"  -- Completion ... those three should be 1 plugin so it keeps lines at a minimum ... 
	Plug 'hrsh7th/nvim-cmp'                             "    better than compe i guess
	Plug 'hrsh7th/cmp-nvim-lsp'                         "    lsp completion
	Plug 'hrsh7th/cmp-buffer'                           "    buffer completion
	Plug 'hrsh7th/cmp-nvim-lua'                         "    vim lua api completion
	Plug 'hrsh7th/cmp-path'                             "    path completion
	Plug 'f3fora/cmp-spell'                             "    spelling completion
	Plug 'saadparwaiz1/cmp_luasnip'
	" -- Better Navigaion and vim as a whole
	Plug 'nvim-telescope/telescope.nvim'                " telescope
	" -- Debugger
	" depends on
	Plug 'nvim-lua/plenary.nvim'                        "   telescope needs it dunno
	Plug 'folke/todo-comments.nvim'
	Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' } " thing that implements fzf for tlelescope
	Plug 'nvim-telescope/telescope-symbols.nvim'
	Plug 'tpope/vim-abolish'                            "   better find and replace, tpope stuff is blessed better find and replace, tpope stuff is blessed
	Plug 'phaazon/hop.nvim'                             "   alternative to sneak more like easymotion alternative to sneak more like easymotion
	Plug 'mbbill/undotree'                              "   Undotree Undotree
	Plug 'antoinemadec/FixCursorHold.nvim'              "    ?  ?
	" -- Git
	Plug 'tpope/vim-fugitive'                           "   git client git client
	Plug 'lewis6991/gitsigns.nvim'
	" -- I dunno ¯\_(ツ)_/¯
	Plug 'thinca/vim-quickrun'                          "   quickrun code files, useful for nothing but c/c++ quickrun code files, useful for nothing but c/c++
	Plug 'norcalli/nvim-colorizer.lua'                  "   colorizer for colors in css and anywhere really
  " -- Writing, i do write as well might as well use the best biggest gun for it
  " -- 
  Plug 'cdelledonne/vim-cmake'
  Plug 'dhruvasagar/vim-table-mode'
  Plug 'smithbm2316/centerpad.nvim'
	Plug 'henriquehbr/nvim-startup.lua'
	" -- colorschemes
	Plug 'rose-pine/neovim'
	Plug 'catppuccin/nvim', {'as': 'catppuccin'}
	Plug 'EdenEast/nightfox.nvim'
	Plug 'tpope/vim-dispatch'
call plug#end()
