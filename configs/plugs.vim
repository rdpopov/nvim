" Contents: Plugin list for neovim

call plug#begin()
"needed for nim
Plug 'alaviss/nim.nvim'                             "   best nim language plugin, provides syntax highlight
"any other language
Plug 'neovim/nvim-lspconfig'                        "   lsp configuration api for native lsp
Plug 'nvim-lua/completion-nvim'                     "   completion api for lsp
"quality of life 
Plug 'dbeniamine/cheat.sh-vim'                      "   query help from inside vim
Plug 'Chiel92/vim-autoformat'                       "   Easy file formatter
Plug 'itchyny/lightline.vim'                        "   Lightline
Plug 'thinca/vim-quickrun'                          "   quickrun code files, useful for nothing but c/c++
Plug 'justinmk/vim-sneak'                           "   easier movment that i have yet to learn to use
Plug 'tpope/vim-abolish'                            "   better find and replace, tpope stuff is blessed
Plug 'mattn/emmet-vim'                              "   i need this shit for web class, tho emmet is kinda nifty ngl
Plug 'mbbill/undotree'                              "   Undotree
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } "   fuzzy file finder and multitool
Plug 'junegunn/fzf.vim'                             "   it is
Plug 'plasticboy/vim-markdown'                      "   coloring for markdown
"git intergations
Plug 'tpope/vim-fugitive'                           "   git client
Plug 'airblade/vim-gitgutter'                       "   git integration
"colorschemes
Plug 'embark-theme/vim', { 'as': 'embark' }         "   a cool airline theme that complements aurora colorscheme
Plug 'lighthaus-theme/vim-lighthaus'
Plug 'ayu-theme/ayu-vim'
"just pure look good sugar 
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'} "   file browser
Plug 'ryanoasis/vim-devicons'                       "   devicons dunno, maybe make it look good
Plug 'Yggdroot/indentLine'                          "   indentline for puython and nim and other languages that need indentation
Plug 'sheerun/vim-polyglot'
call plug#end()
