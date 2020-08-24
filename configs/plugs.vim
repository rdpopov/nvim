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

if executable('cquery')
    au User lsp_setup call lsp#register_server({
                \ 'name': 'cquery',
                \ 'cmd': {server_info->['cquery']},
                \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
                \ 'initialization_options': { 'cacheDirectory': '/tmp/cquery/cache' },
                \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
                \ })
endif
if executable('pyls')
    au User lsp_setup call lsp#register_server({
                \ 'name': 'pyls',
                \ 'cmd': {server_info->['pyls']},
                \ 'whitelist': ['python'],
                \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> <leader> gd <plug>(lsp-definition)
    nmap <buffer> <leader> gy <plug>(lsp-references)
    nmap <buffer> <leader> gi <plug>(lsp-implementation)
    nmap <buffer> <leader> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    "    nmap <buffer> [g <Plug>(lsp-previous-diagnostic)
    "   nmap <buffer> ]g <Plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
let g:lsp_fold_enabled = 0
let g:lsp_highlight_references_enabled = 1
highlight lspReference ctermfg=red guifg=red ctermbg=green guibg=green



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
"completion
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
"language plugins for completion
Plug 'pdavydov108/vim-lsp-cquery'
Plug 'ryanolsonx/vim-lsp-python'
Plug 'rosenfeld/rgrep.vim'
call plug#end()

autocmd VimEnter *
            \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
            \|   PlugInstall --sync | q| PlugInstall --sync |q|
            \| endif
