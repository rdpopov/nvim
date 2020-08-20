let g:NERDTreeWinPos = "right"
let g:NERDTreeShowHidden = 1
let g:autoformat_autoindent = 1
let g:autoformat_retab = 1
let g:autoformat_remove_trailing_spaces =1

let g:ale_disable_lsp = 1
let g:ale_hover_to_preview =1
let g:airline#extensions#ale#enabled = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {
\   'nim': ['nimlsp', 'nimcheck'],
\   'python': ['pyflakes','pyls'],
\   'c':['/home/users/mms00476/newfolder/cquery/build/cquery'],
\}
let g:ale_lint_on_insert_leave = 1
let g:ale_sign_error = '✖✖'
let g:ale_sign_warning = '⚠⚠'

let g:LanguageClient_serverCommands = {
    \ 'python': ['pyls','pyflakes'],
    \ 'c':['/home/users/mms00476/newfolder/cquery/build/cquery'],
    \ }
highlight ALEErrorSign guifg=Red
highlight ALEWarningSign guifg=Yellow

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \   'FUCK : %dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction

set statusline=%{LinterStatus()}

call plug#begin()
"nim
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
Plug 'arcticicestudio/nord-vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'junegunn/fzf'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'mbbill/undotree'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q| PlugInstall --sync |q|
  \| endif
