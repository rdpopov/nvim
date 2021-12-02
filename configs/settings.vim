" Basic editor settings

set nocompatible

syntax enable
filetype plugin on

" input languages

set path+=**

set wildmenu


set nowrap        " don't wrap lines
set tabstop=4  softtabstop=4 expandtab   " a tab is four spaces
set backspace=indent,eol,start
" allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=4  " number of spaces to use for autoindenting
set smartindent
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
set expandtab
set colorcolumn=80
set foldmethod=syntax
set scrolloff=4
set sidescrolloff=4


set history=10000         " remember more commands and search history
set undolevels=10000     " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class,*.out,*.so
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

set nobackup " hate these swaps and backups
set noswapfile
set nofoldenable
set cursorline
set relativenumber
set signcolumn=yes
set lazyredraw
set mouse=a
set cpt=.,w,d,i,b,u
set omnifunc=syntaxcomplete#Complete

set list
set listchars=tab:\|.,trail:.,extends:#,nbsp:.


if has("persistent_undo")
    call system("[ -d \"$HOME/.undodir\" ] || mkdir $HOME/.undodir")
    set undodir=$HOME/.undodir
    set undofile
endif
