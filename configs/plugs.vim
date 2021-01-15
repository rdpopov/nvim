call plug#begin()
"unknown usefulness
Plug 'chiel92/vim-autoformat'
"completion
"nim spcific
Plug 'alaviss/nim.nvim'
Plug 'dense-analysis/ale'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'mattn/vim-lsp-settings'
Plug 'neoclide/coc.nvim'
"quality of life 
Plug 'justincampbell/vim-eighties'
Plug 'wellle/context.vim'
Plug 'vim-airline/vim-airline'
Plug 'thinca/vim-quickrun'
Plug 'mbbill/undotree'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-abolish'
"essential
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"language plugins
Plug 'sheerun/vim-polyglot'
"colorschemes
Plug 'chriskempson/base16-vim'
Plug 'embark-theme/vim', { 'as': 'embark' }
Plug 'srcery-colors/srcery-vim'
Plug 'vim-airline/vim-airline-themes'
"rice
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
"git intergations
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
"fmi
Plug 'wlangstroth/vim-racket'
Plug 'plasticboy/vim-markdown'
Plug 'dbeniamine/cheat.sh-vim'
call plug#end()
