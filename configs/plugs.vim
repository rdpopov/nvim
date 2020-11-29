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
Plug 'fatih/vim-go'
Plug 'piec/vim-lsp-gopls'
Plug 'ryanolsonx/vim-lsp-python'
Plug 'm-pilia/vim-ccls'
"quality of life 
Plug 'justincampbell/vim-eighties'
Plug 'wellle/context.vim'
Plug 'vim-airline/vim-airline'
Plug 'thinca/vim-quickrun'
Plug 'mbbill/undotree'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-abolish'
"essential
Plug 'jsfaint/gen_tags.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"language plugins
Plug 'alaviss/nim.nvim'
Plug 'sheerun/vim-polyglot'
"colorschemes
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline-themes'
"rice
Plug 'preservim/nerdtree'
Plug 'philrunninger/nerdtree-visual-selection'
Plug 'ryanoasis/vim-devicons'
"git intergations
Plug 'airblade/vim-gitgutter'
Plug 'sodapopcan/vim-twiggy'
Plug 'gregsexton/gitv'
Plug 'tpope/vim-fugitive'
Plug 'rhysd/git-messenger.vim'
Plug 'apzelos/blamer.nvim'
"fmi
Plug 'srcery-colors/srcery-vim'
Plug 'wlangstroth/vim-racket'
call plug#end()
