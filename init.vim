set nocompatible

syntax enable
filetype plugin on

set path+=**

set wildmenu

"might break stuff
nnoremap ; :

"stolen from here https://nvie.com/posts/how-i-boosted-my-vim/
"
set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start
" allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
"    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
"    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set hidden	  " makes it so files are kept in memory ?

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class,*.out,*.so
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

set nobackup		" hate these swaps and backups
set noswapfile

set cursorline
set relativenumber

set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

if has('autocmd')
	autocmd filetype python set expandtab
	autocmd filetype nim set expandtab
endif
" commands bound on f-s
"f1

"f2

"f3
noremap <F3> :Autoformat<CR>


"custom commands
""make code tags for jumping
command! MakeTags !ctags -R
"hide highlights searches
nmap <silent> ,/ :nohlsearch<CR>

""esc terminal mode when in it
:tnoremap <Esc> <C-\><C-n>

""open small terminal window down
nnoremap ,tt :sp<bar>term<cr><c-w>J:resize10<cr>

"custom homemade snippets
"#nnoremap ,somecmd_ :-1read $HOME/.vim/somebullshit<CR>"

"color theme
colorscheme badwolf
"colorscheme cobalt
"plugin config params
""NERDTreee
let g:NERDTreeWinPos = "right"

"autoformat settings
"let g:autoformat_autoindent = 0
"let g:autoformat_retab = 0
"let g:autoformat_remove_trailing_spaces = 0

"plugins
call plug#begin()
if has('nvim')
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
	Plug 'Shougo/deoplete.nvim'
	Plug 'roxma/nvim-yarp'
	Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1
Plug 'wakatime/vim-wakatime'
Plug 'thinca/vim-quickrun'
Plug 'fergdev/vim-cursor-hist'
Plug 'chiel92/vim-autoformat'
Plug 'sheerun/vim-polyglot'
Plug 'preservim/nerdtree'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'davidhalter/jedi-vim'
Plug 'autozimu/LanguageClient-neovim'
Plug 'jreybert/vimagit'
call plug#end()
