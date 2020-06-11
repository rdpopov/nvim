set nocompatible

syntax enable
filetype plugin on

set path+=**

set wildmenu


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



set history=10000         " remember more commands and search history
set undolevels=10000     " use many muchos levels of undo
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
