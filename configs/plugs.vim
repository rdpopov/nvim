if !exists("g:plug_mode")
	let g:plug_mode = ["all"]
endif 


call plug#begin()
		Plug 'sheerun/vim-polyglot'
	if index(g:plug_mode,"nim") >= 0  || index(g:plug_mode,"all") >= 0
		Plug 'alaviss/nim.nvim'                             "   best nim language plugin, provides regex based syntax highlight syntax highlight
	endif
	if index(g:plug_mode,"lsp") >= 0  || index(g:plug_mode,"all") >= 0
		Plug 'neovim/nvim-lspconfig'                        "   lsp configuration api for native lsp
		Plug 'nvim-lua/completion-nvim'                     "   completion api for lsp
	endif
	if index(g:plug_mode,"qof") >= 0  || index(g:plug_mode,"all") >= 0
		"" there is a builtin function for this one
		Plug 'Chiel92/vim-autoformat'                       "   Easy file formatter
		Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } "   fuzzy file finder and multitool
		Plug 'junegunn/fzf.vim'                             "   it is
	endif
	if index(g:plug_mode,"nifty") >= 0  || index(g:plug_mode,"all") >= 0
		" Sometimes useful
		Plug 'thinca/vim-quickrun'                          "   quickrun code files, useful for nothing but c/c++
		Plug 'justinmk/vim-sneak'                           "   easier movment that i have yet to learn to use
		Plug 'mbbill/undotree'                              "   Undotree
		Plug 'dbeniamine/cheat.sh-vim'                      "   query help from inside vim
		Plug 'tpope/vim-abolish'                            "   better find and replace, tpope stuff is blessed
	endif
	if index(g:plug_mode,"web") >= 0  || index(g:plug_mode,"all") >= 0
		" web class 
		Plug 'norcalli/nvim-colorizer.lua'                  "   colorizer for colors in css and anywhere really 
		" basic functionality can be recreated in viml
		Plug 'mattn/emmet-vim'                              "   i need this shit for web class, tho emmet is kinda nifty ngl
	endif
	if index(g:plug_mode,"git") >= 0  || index(g:plug_mode,"all") >= 0
		"git intergations
		Plug 'tpope/vim-fugitive'                           "   git client
		Plug 'airblade/vim-gitgutter'                       "   git integration
		Plug 'plasticboy/vim-markdown'                      "   coloring for markdown
	endif
call plug#end()
