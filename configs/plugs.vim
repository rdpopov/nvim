call plug#begin()
	"
	" -- Language features
	Plug 'alaviss/nim.nvim'															"		Nim language support
	Plug 'sheerun/vim-polyglot'													"		any other language support
	Plug 'plasticboy/vim-markdown'                      "   coloring for markdown
	Plug 'Chiel92/vim-autoformat'                       "   Easy file formatter
	"
	" -- Languge helpers
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " tree-sitter for neovim
	Plug 'neovim/nvim-lspconfig'                        "   lsp configuration api for native lsp
	Plug 'gfanto/fzf-lsp.nvim'													"   preview refferences in fzf window
	Plug 'hrsh7th/nvim-compe'														"   completion api for lsp
	Plug 'ray-x/lsp_signature.nvim'											"		signatire preview via lsp
	Plug 'liuchengxu/vista.vim'													"		tag and ouline preview it supports tags which are useful
	"
	" -- Better Navigaion and vim as a whole
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } "   fuzzy file finder and multitool
	Plug 'junegunn/fzf.vim'                             "   Best most useful tool i have ever used
	Plug 'tpope/vim-abolish'                            "   better find and replace, tpope stuff is blessed
	Plug 'phaazon/hop.nvim'															"		alternative to sneak more like easymotion
	Plug 'mbbill/undotree'                              "   Undotree
	Plug 'antoinemadec/FixCursorHold.nvim'							"		?
	"
	" -- Git
	Plug 'tpope/vim-fugitive'														"		git client
	Plug 'airblade/vim-gitgutter'                       "   git integration
	"
	" -- I dunno ¯\_(ツ)_/¯
	Plug 'thinca/vim-quickrun'                          "   quickrun code files, useful for nothing but c/c++
	Plug 'dbeniamine/cheat.sh-vim'                      "   query help from inside vim
	Plug 'norcalli/nvim-colorizer.lua'                  "   colorizer for colors in css and anywhere really
	Plug 'antoinemadec/FixCursorHold.nvim'							"		?
call plug#end()

