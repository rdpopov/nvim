set nocompatible

syntax enable
filetype plugin on

set path+=**

set wildmenu


command! MakeTags !ctags -R
"command wq MakeTags wq
nnoremap ,tterm :sp<bar>term<cr><c-w>J:resize10<cr>
 
"NERDTreee
let g:NERDTreeWinPos = "right"

"color
colorscheme badwolf

"#nnoremap ,somecmd_ :-1read $HOME/.vim/somebullshit<CR>"
"Exit Terminal mode
:tnoremap <Esc> <C-\><C-n>

call plug#begin()
Plug 'roxma/nvim-completion-manager'
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim'
Plug 'davidhalter/jedi-vim'
Plug 'autozimu/LanguageClient-neovim'
Plug 'jreybert/vimagit'
Plug 'sjl/badwolf' 
"Plug 'alaviss/nim.nvim'"
"Plug 'vim-plugins/bash-support.vim'"
"Plug 'SirVer/ultisnips'"
"Plug 'honza/vim-snippets'"
call plug#end()
