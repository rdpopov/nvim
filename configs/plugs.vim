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
Plug 'wellle/context.vim'
Plug 'vim-airline/vim-airline'
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
Plug 'vim-airline/vim-airline-themes'
Plug 'jacoborus/tender.vim'
Plug 'letorbi/vim-colors-modern-borland'
"Plug 'joshdick/onedark.vim'
"rice
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
"git intergations
Plug 'airblade/vim-gitgutter'
Plug 'sodapopcan/vim-twiggy'
Plug 'gregsexton/gitv'
Plug 'tpope/vim-fugitive'
Plug 'rhysd/git-messenger.vim'
Plug 'apzelos/blamer.nvim'
Plug 'mickaobrien/vim-stackoverflow'
"fmi
Plug 'wlangstroth/vim-racket'
call plug#end()
