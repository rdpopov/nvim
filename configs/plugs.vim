nnoremap <SPACE> <Nop>
let mapleader = " "

"let g:rg_binary='rgrep'
let g:NERDTreeWinPos = "right"
let g:NERDTreeShowHidden = 1
let g:autoformat_autoindent = 1
let g:autoformat_retab = 1
let g:autoformat_remove_trailing_spaces =1

let g:lsp_diagnostics_enabled = 1
let g:gen_tags#gtags_default_map=1

let g:lsp_fold_enabled = 0

let g:lsp_virtual_text_enabled = 0
let g:lsp_diagnostics_enabled = 0
let g:lsp_diagnostics_echo_cursor = 1
let s:nimlspexecutable = "nimlsp"
let g:lsp_log_verbose = 1
let g:lsp_log_file = expand('/tmp/vim-lsp.log')
" for asyncomplete.vim log

let g:asyncomplete_log_file = expand('/tmp/asyncomplete.log')
let g:asyncomplete_auto_popup = 1


let g:ccls_close_on_jump = v:true
let g:ccls_levels = 1
let g:ccls_float_width = 50
let g:ccls_float_height = 20

if executable('ccls')
    au User lsp_setup call lsp#register_server({
                \ 'name': 'ccls',
                \ 'cmd': {server_info->['ccls']},
                \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
                \ 'initialization_options': {'cache': {'directory': '/tmp/ccls/cache' }},
                \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
                \ })
endif

"if executable('clangd')
"        au User lsp_setup call lsp#register_server({
"                \ 'name': 'clangd',
"                \ 'cmd': {server_info->['clangd', '-background-index']},
"                \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
"                \ })
"endif

if executable('pyls')
    au User lsp_setup call lsp#register_server({
                \ 'name': 'pyls',
                \ 'cmd': {server_info->['pyls']},
                \ 'whitelist': ['python'],
                \ })
endif

let g:lsp_settings_root_markers = [
            \   '.git',
            \   '.git/',
            \   '.prjroot',
            \   'compile_command.json',
            \ ]

if executable(s:nimlspexecutable)
    au User lsp_setup call lsp#register_server({
                \ 'name': 'nimlsp',
                \ 'cmd': {server_info->[s:nimlspexecutable]},
                \ 'whitelist': ['nim'],
                \ })
endif
function!  s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
            \ pumvisible() ?  "\<C-n>" :
            \ <SID>check_back_space() ?  "\<TAB>" :
            \ asyncomplete#force_refresh()
inoremap <expr><S-TAB> pumvisible() ?  "\<C-p>" : \<C-h>"

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    "    nmap <buffer> <C-k> <Plug>(lsp-previous-diagnostic)
    "    nmap <buffer> <C-j> <Plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
endfunction
autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()



nmap yd :LspDefinition<CR>
nmap yr :LspReferences<CR>
nmap yi :LspImplementation <CR>
nmap yf :LspRename <CR>


nmap <leader> yd :CclsDerived<CR>
nmap <leader> yh :CclsDerivedHierarchy<CR>
nmap <leader> yr :CclsCallers<CR>
nmap <leader> yt :CclsCallHierarchy<CR>
let g:ale_cpp_ccls_init_options = {
            \   'cache': {
            \       'directory': '/tmp/ccls/cache'
            \   }
            \ }

let g:ale_disable_lsp = 0
let g:ale_hover_to_preview =1
let g:airline#extensions#ale#enabled = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {
            \   'nim': ['nimlsp', 'nimcheck'],
            \   'python': ['pyls'],
            \   'c':['ccls'],
            \}
"            \   'c':['clangd'],
let g:ale_lint_on_insert_leave = 1
let g:ale_sign_error = '✖✖'
let g:ale_sign_warning = '⚠⚠'

highlight ALEErrorSign guifg=Red
highlight ALEWarningSign guifg=Yellow

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
                \   '%dW %dE',
                \   all_non_errors,
                \   all_errors
                \)
endfunction
let g:fzf_layout = {'window':{'width':0.64, 'height':0.64}}
set statusline=%{LinterStatus()}

call plug#begin()
" qick test
Plug 'thinca/vim-quickrun'
Plug 'fergdev/vim-cursor-hist'
Plug 'chiel92/vim-autoformat'
Plug 'alaviss/nim.nvim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-abolish'
Plug 'preservim/nerdtree'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'tpope/vim-fugitive'
Plug 'justinmk/vim-sneak'
Plug 'jremmen/vim-ripgrep'
Plug 'airblade/vim-gitgutter'
Plug 'hari-rangarajan/cctree'
Plug 'arcticicestudio/nord-vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'mbbill/undotree'
Plug 'ayu-theme/ayu-vim'
Plug 'sheerun/vim-wombat-scheme'
Plug 'mhartington/oceanic-next'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'ryanolsonx/vim-lsp-python'
Plug 'mattn/vim-lsp-settings'
Plug 'godlygeek/tabular'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jsfaint/gen_tags.vim'
Plug 'dense-analysis/ale'
Plug 'chriskempson/base16-vim'
Plug 'm-pilia/vim-ccls'
Plug 'kyoz/purify', { 'rtp': 'vim' }
"Plug 'piec/vim-lsp-clangd'
"completion
call plug#end()
let g:airline_theme='wombat'
autocmd VimEnter *
            \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
            \|   PlugInstall --sync | q|
            \|   PlugClean | q|
            \| endi
