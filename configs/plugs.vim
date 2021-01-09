call plug#begin()
"unknown usefulness
Plug 'chiel92/vim-autoformat'
"completion
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
Plug 'jsfaint/gen_tags.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"language plugins
Plug 'alaviss/nim.nvim'
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
call plug#end()
