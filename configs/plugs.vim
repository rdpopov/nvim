call plug#begin()
"needed for nim
Plug 'alaviss/nim.nvim'                             "   best nim language plugin, provides regex based syntax highlight syntax highlight
Plug 'prabirshrestha/asyncomplete.vim'              "   nim completion works better with asyncomplete
 "any other language
Plug 'dense-analysis/ale'                           "   linter
Plug 'neoclide/coc.nvim'                            "   best completion plugin preconfigured lsp-s, provides nim code navigation, as well
Plug 'plasticboy/vim-markdown'                      "   coloring for markdown
"quality of life 
Plug 'dbeniamine/cheat.sh-vim'                      "   query help from inside vim
Plug 'Chiel92/vim-autoformat'                       "   Easy file formatter
Plug 'thinca/vim-quickrun'                          "   quickrun code files, useful for nothing but c/c++
Plug 'justinmk/vim-sneak'                           "   easier movment that i have yet to learn to use
Plug 'tpope/vim-abolish'                            "   better find and replace, tpope stuff is blessed
Plug 'mbbill/undotree'                              "   Undotree
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } "   fuzzy file finder and multitool
Plug 'junegunn/fzf.vim'                             "   it is
Plug 'plasticboy/vim-markdown'                      "   coloring for markdown
" web class 
Plug 'mattn/emmet-vim'                              "   i need this shit for web class, tho emmet is kinda nifty ngl
Plug 'norcalli/nvim-colorizer.lua'                  "   colorizer for colors in css and anywhere really 
"git intergations
Plug 'tpope/vim-fugitive'                           "   git client
Plug 'airblade/vim-gitgutter'                       "   git integration
"just pure look good sugar 
Plug 'sheerun/vim-polyglot'
call plug#end()
