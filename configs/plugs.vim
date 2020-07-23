let g:NERDTreeWinPos = "right"
let g:NERDTreeShowHidden = 1
let g:python3_host_prog="/usr/bin/python3.8"
let g:autoformat_autoindent = 1
let g:autoformat_retab = 1
let g:autoformat_remove_trailing_spaces =1
call plug#begin()
"nim
Plug 'wakatime/vim-wakatime'
" qick test
Plug 'thinca/vim-quickrun'
"
Plug 'fergdev/vim-cursor-hist'
"?
Plug 'chiel92/vim-autoformat'
"?
Plug 'alaviss/nim.nvim'
Plug 'sheerun/vim-polyglot'
"fiel browser
Plug 'preservim/nerdtree'
"?
Plug 'godlygeek/tabular'
"?
Plug 'plasticboy/vim-markdown'
"git
"Plug 'jreybert/vimagit'
Plug 'tpope/vim-fugitive'
"completion
Plug 'ycm-core/YouCompleteMe'
"movmnet
Plug 'justinmk/vim-sneak'
"diff
Plug 'airblade/vim-gitgutter'
"call tree
Plug 'hari-rangarajan/cctree'
"project managment
Plug 'tpope/vim-projectionist'
" languages:
Plug 'arcticicestudio/nord-vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'junegunn/fzf'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'mbbill/undotree'
call plug#end()


autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q| PlugInstall --sync |q|
  \| endif
