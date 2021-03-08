" Contents: Plugin list for neovim

call plug#begin()
"needed for nim
Plug 'alaviss/nim.nvim'                             "   best nim language plugin, provides syntax highlight
Plug 'prabirshrestha/asyncomplete.vim'              "   nim completion works better with vimlsp + asyncomplete
Plug 'prabirshrestha/vim-lsp'                       "   provides help for nim
Plug 'prabirshrestha/asyncomplete-lsp.vim'          "   thats the only thing its good for
Plug 'mattn/vim-lsp-settings'                       "   still only for nim, alot of work went into that
"any other language
Plug 'dense-analysis/ale'                           "   linter
Plug 'neoclide/coc.nvim'                            "   best completion plugin preconfigured lsp-s, provides nim code navigation, as well
"quality of life 
Plug 'Chiel92/vim-autoformat'                       "   Easy file formatter
Plug 'itchyny/lightline.vim'                        "   Lightline
Plug 'thinca/vim-quickrun'                          "   quickrun code files, useful for nothing but c/c++
Plug 'justinmk/vim-sneak'                           "   easier movment that i have yet to learn to use
Plug 'tpope/vim-abolish'                            "   better find and replace, tpope stuff is blessed
Plug 'mattn/emmet-vim'                              "   i need this shit for web class, tho emmet is kinda nifty ngl
Plug 't9md/vim-choosewin'                           "   window managment plugin
Plug 'mbbill/undotree'                              "   Undotree
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } "   fuzzy file finder and multitool
Plug 'junegunn/fzf.vim'                             "   it is
Plug 'rnevius/vim-execution'                        "   something to execute a macro over a visual selection, would probs replace it with mt own
Plug 'wellle/context.vim'                           "   shows the current context in code function, namespace, if/switch branches above, etc.
"git intergations
Plug 'tpope/vim-fugitive'                           "   git client
Plug 'airblade/vim-gitgutter'                       "   git integration
Plug 'plasticboy/vim-markdown'                      "   coloring for markdown
Plug 'dbeniamine/cheat.sh-vim'                      "   query help from inside vim
"colorschemes
Plug 'ghifarit53/tokyonight-vim'                    "   cool blueish coloscheme
Plug 'chriskempson/base16-vim'                      "   only for gruvbox-hard
Plug 'embark-theme/vim', { 'as': 'embark' }         "   a cool airline theme that complements aurora colorscheme
Plug 'srcery-colors/srcery-vim'                     "   gruvbox-hard but with blue
"just pure look good sugar 
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'} "   file browser
Plug 'ryanoasis/vim-devicons'                       "   devicons dunno, maybe make it look good
Plug 'Yggdroot/indentLine'                          "   indentline for puython and nim and other languages that need indentation
Plug 'sheerun/vim-polyglot'
call plug#end()
