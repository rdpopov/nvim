let g:NERDTreeWinPos = "right"
let g:NERDTreeShowHidden = 1
let g:autoformat_autoindent = 1
let g:autoformat_retab = 1
let g:autoformat_remove_trailing_spaces =1


"" ALE Cnfig
let g:ale_disable_lsp = 1
let g:ale_hover_to_preview = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {
            \   'nim': ['nimlsp', 'nimcheck'],
            \   'python': ['pyflakes','pyls'],
            \   'c':['cquery'],
            \}
let g:ale_lint_on_insert_leave = 1
let g:ale_sign_error = '✖✖'
let g:ale_sign_warning = '⚠⚠'

let g:LanguageClient_serverCommands = {
            \ 'python': ['pyls','pyflakes'],
            \ 'c':['cquery'],
            \ 'nim':['nimlsp','nimcheck'],
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
""ALE CONFIG END

let g:ycm_seed_identifiers_with_syntax = 1
set completeopt=menu

" make YCM compatible with UltiSnips (using <Ctrl-N>, <Ctrl-P>)
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]

" commands mappings
nnoremap <S-F1> :pclose<CR>
nnoremap <leader>gd :pclose<CR>:silent YcmCompleter GetDoc<CR>
nnoremap <leader>gt :YcmCompleter GetType<CR>
nnoremap <leader>gd  :YcmCompleter GoTo<CR>
nnoremap <leader>gr :YcmCompleter GoToReferences<CR>

let g:ycm_use_clangd = 1

call plug#begin()
" qick test
Plug 'thinca/vim-quickrun'
"
Plug 'fergdev/vim-cursor-hist'
"?
Plug 'chiel92/vim-autoformat'
"?
Plug 'alaviss/nim.nvim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-abolish'
"fiel browser
Plug 'preservim/nerdtree'
"?
Plug 'godlygeek/tabular'
"?
Plug 'plasticboy/vim-markdown'
"git
Plug 'tpope/vim-fugitive'
"completion
"movmnet
Plug 'justinmk/vim-sneak'
Plug 'rosenfeld/rgrep.vim'
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
Plug 'mkitt/tabline.vim'
Plug 'ayu-theme/ayu-vim' " or other package manager
Plug 'sheerun/vim-wombat-scheme'
Plug 'mhartington/oceanic-next'
Plug 'vim-airline/vim-airline-themes'
Plug 'ycm-core/YouCompleteMe'
"completion
call plug#end()

autocmd VimEnter *
            \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
            \|   PlugInstall --sync | q| PlugInstall --sync |q|
            \| endif
