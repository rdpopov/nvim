let g:NERDTreeWinPos = "right"
let g:NERDTreeShowHidden = 1

call plug#begin()
"nim
Plug 'alaviss/nim.nvim'
" time
Plug 'wakatime/vim-wakatime'
" qick test
Plug 'thinca/vim-quickrun'
" 
Plug 'fergdev/vim-cursor-hist'
"?
Plug 'chiel92/vim-autoformat'
"?
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
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"movmnet
Plug 'justinmk/vim-sneak'
"diff
Plug 'airblade/vim-gitgutter'
"call tree
Plug 'hari-rangarajan/cctree'
"project managment
Plug 'tpope/vim-projectionist'
" languages:
Plug 'clangd/coc-clangd'
Plug 'pappasam/coc-jedi'
Plug 'josa42/coc-go'
Plug 'neoclide/coc-html'
Plug 'neoclide/coc-lists'
Plug 'klaaspieter/coc-sourcekit'
Plug 'iamcco/coc-vimlsp'
Plug 'neoclide/coc-tsserver'
Plug 'arcticicestudio/nord-vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'junegunn/fzf'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'alaviss/nim.nvim'
Plug 'prabirshrestha/asyncomplete.vim'
call plug#end()


autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q| PlugInstall --sync |q|
  \| endif

au User asyncomplete_setup call asyncomplete#register_source({
    \ 'name': 'nim',
    \ 'whitelist': ['nim'],
    \ 'completor': {opt, ctx -> nim#suggest#sug#GetAllCandidates({start, candidates -> asyncomplete#complete(opt['name'], ctx, start, candidates)})}
    \ })
