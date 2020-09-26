call plug#begin()
"to be removed most likely
"unknown usefulness
Plug 'chiel92/vim-autoformat'
"completion
Plug 'dense-analysis/ale'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'mattn/vim-lsp-settings'
Plug 'ryanolsonx/vim-lsp-python'
Plug 'm-pilia/vim-ccls'
"quality of life 
Plug 'justincampbell/vim-eighties'
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': ':UpdateRemotePlugins'}
Plug 'neomake/neomake'
Plug 'vim-airline/vim-airline'
Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-abolish'
"essential
Plug 'jsfaint/gen_tags.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
"language plugins
Plug 'alaviss/nim.nvim'
Plug 'sheerun/vim-polyglot'
Plug 'plasticboy/vim-markdown'
"colorschemes
Plug 'srcery-colors/srcery-vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-wombat-scheme'
Plug 'mhartington/oceanic-next'
call plug#end()
