let g:NERDTreeWinPos = "right"

call plug#begin()
Plug 'alaviss/nim.nvim'
Plug 'wakatime/vim-wakatime'
Plug 'thinca/vim-quickrun'
Plug 'fergdev/vim-cursor-hist'
Plug 'chiel92/vim-autoformat'
Plug 'sheerun/vim-polyglot'
Plug 'preservim/nerdtree'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'jreybert/vimagit'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'justinmk/vim-sneak'
call plug#end()

autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

