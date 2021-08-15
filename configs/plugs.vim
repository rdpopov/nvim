call plug#begin()
  " -- Language features
  "    Nim language support
  Plug 'alaviss/nim.nvim'
  "    any other language support
  Plug 'sheerun/vim-polyglot'
  "   coloring for markdown
  Plug 'plasticboy/vim-markdown'
  "   Easy file formatter
  Plug 'Chiel92/vim-autoformat'
  " -- Languge helpers
  " tree-sitter for neovim
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " tree-sitter for neovim
  "   lsp configuration api for native lsp
  Plug 'neovim/nvim-lspconfig'                        "   lsp configuration api for native lsp
  "   completion api for lsp
  Plug 'hrsh7th/nvim-compe'                           "   completion api for lsp
  "    signatire preview via lsp
  Plug 'ray-x/lsp_signature.nvim'                     "    signatire preview via lsp
  "    tag and ouline preview it supports tags which are useful
  Plug 'liuchengxu/vista.vim'                         "    tag and ouline preview it supports tags which are useful
  " telescope
	Plug 'nvim-telescope/telescope.nvim'
  "   better find and replace, tpope stuff is blessed
  Plug 'tpope/vim-abolish'                            "   better find and replace, tpope stuff is blessed
  "    alternative to sneak more like easymotion
  Plug 'phaazon/hop.nvim'                             "    alternative to sneak more like easymotion
  "   Undotree
  Plug 'mbbill/undotree'                              "   Undotree
  "    ?
  Plug 'antoinemadec/FixCursorHold.nvim'              "    ?
  " -- Git
  "    git client
  Plug 'tpope/vim-fugitive'                           "    git client
  "   git integration
  Plug 'airblade/vim-gitgutter'                       "   git integration
  " -- I dunno ¯\_(ツ)_/¯
  "   quickrun code files, useful for nothing but c/c++
  Plug 'thinca/vim-quickrun'                          "   quickrun code files, useful for nothing but c/c++
  "   query help from inside vim
  Plug 'dbeniamine/cheat.sh-vim'                      "   query help from inside vim
  "   colorizer for colors in css and anywhere really
  Plug 'norcalli/nvim-colorizer.lua'
	" dunno, telescope need it 
	Plug 'nvim-lua/plenary.nvim'
call plug#end()

