call plug#begin()
Plug 'sheerun/vim-polyglot'
Plug 'alaviss/nim.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " tree-sitter for neovim
Plug 'neovim/nvim-lspconfig'                        "   lsp configuration api for native lsp
Plug 'hrsh7th/nvim-compe'                      "   completion api for lsp
Plug 'ray-x/guihua.lua', {'do': 'cd lua/fzy && make' }
Plug 'ray-x/navigator.lua'
Plug 'Chiel92/vim-autoformat'                       "   Easy file formatter
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } "   fuzzy file finder and multitool
Plug 'junegunn/fzf.vim'                             "   it is
Plug 'tpope/vim-abolish'                            "   better find and replace, tpope stuff is blessed
Plug 'mbbill/undotree'                              "   Undotree
Plug 'thinca/vim-quickrun'                          "   quickrun code files, useful for nothing but c/c++
Plug 'justinmk/vim-sneak'                           "   easier movment that i have yet to learn to use
Plug 'dbeniamine/cheat.sh-vim'                      "   query help from inside vim
Plug 'norcalli/nvim-colorizer.lua'                  "   colorizer for colors in css and anywhere really
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'                       "   git integration
Plug 'plasticboy/vim-markdown'                      "   coloring for markdown
if g:file_explorer == 'nvim-tree'
Plug 'kyazdani42/nvim-tree.lua'
endif
call plug#end()
