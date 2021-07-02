if !exists("g:plug_mode")
	let g:plug_mode = ["all"]
endif 

call plug#begin()
		Plug 'sheerun/vim-polyglot'
	if index(g:plug_mode,"nim") >= 0  || index(g:plug_mode,"all") >= 0
		Plug 'alaviss/nim.nvim'                             
	endif
	if index(g:plug_mode,"tree") >= 0
		Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " tree-sitter for neovim
	endif
	if index(g:plug_mode,"lsp") >= 0  || index(g:plug_mode,"all") >= 0
		Plug 'neovim/nvim-lspconfig'                        "   lsp configuration api for native lsp
		Plug 'hrsh7th/nvim-compe'                      "   completion api for lsp
	endif
	if index(g:plug_mode,"navigator") >= 0
		Plug 'ray-x/guihua.lua', {'do': 'cd lua/fzy && make' }
		Plug 'ray-x/navigator.lua'
	endif
	if index(g:plug_mode,"qof") >= 0  || index(g:plug_mode,"all") >= 0
		"" there is a builtin function for this one
		Plug 'Chiel92/vim-autoformat'                       "   Easy file formatter
		Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } "   fuzzy file finder and multitool
		Plug 'junegunn/fzf.vim'                             "   it is
		Plug 'tpope/vim-abolish'                            "   better find and replace, tpope stuff is blessed
		Plug 'mbbill/undotree'                              "   Undotree
	endif
	if index(g:plug_mode,"nifty") >= 0  || index(g:plug_mode,"all") >= 0
		" Sometimes useful
		Plug 'thinca/vim-quickrun'                          "   quickrun code files, useful for nothing but c/c++
		Plug 'justinmk/vim-sneak'                           "   easier movment that i have yet to learn to use
		Plug 'dbeniamine/cheat.sh-vim'                      "   query help from inside vim
	endif
	if index(g:plug_mode,"web") >= 0  || index(g:plug_mode,"all") >= 0
		Plug 'norcalli/nvim-colorizer.lua'                  "   colorizer for colors in css and anywhere really 
	endif
	if index(g:plug_mode,"git") >= 0  || index(g:plug_mode,"all") >= 0
		"git intergations
		Plug 'tpope/vim-fugitive'                           
		Plug 'airblade/vim-gitgutter'                       "   git integration
		Plug 'plasticboy/vim-markdown'                      "   coloring for markdown
	endif
call plug#end()
