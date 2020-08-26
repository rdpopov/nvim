au BufNewFile,BufRead *.nim set filetype=nim
let g:NERDTreeWinPos = "right"
let g:NERDTreeShowHidden = 1
let g:autoformat_autoindent = 1
let g:autoformat_retab = 1
let g:autoformat_remove_trailing_spaces =1

let g:lsp_diagnostics_enabled = 1
let s:nimlspexecutable = "nimlsp"
let g:lsp_log_verbose = 1
let g:lsp_log_file = expand('/tmp/vim-lsp.log')
" for asyncomplete.vim log

let g:asyncomplete_log_file = expand('/tmp/asyncomplete.log')
let g:asyncomplete_auto_popup = 1

if executable('pyls')
    au User lsp_setup call lsp#register_server({
                \ 'name': 'pyls',
                \ 'cmd': {server_info->['pyls']},
                \ 'whitelist': ['python'],
                \ })
endif

"augroup GlobalComplete
"  autocmd!
"  autocmd FileType c setlocal omnifunc=GlobalComplete
"augroup END
"
"function! GlobalComplete(findstart, base)
"  if a:findstart == 1
"    return s:LocateCurrentWordStart()
"  else
"    return split(system('global -c ' . a:base), '\n')
"  endif
"endfunction
"
"function! s:LocateCurrentWordStart()
"  let l:line = getline('.')
"  let l:start = col('.') - 1
"  while l:start > 0 && l:line[l:start - 1] =~# '\a'
"    let l:start -= 1
"  endwhile
"  return l:start
"endfunction
"c completion based on gn tags

let g:lsp_settings_root_markers = [
\   '.git',
\   '.git/',
\   '.prjroot',
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
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> <C-k> <Plug>(lsp-previous-diagnostic)
    nmap <buffer> <C-j> <Plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
endfunction
autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
"lightline
set laststatus=2
if !has('gui_running')
    set t_Co=256
endif
let g:lightline = {
            \ 'colorscheme': 'wombat',
            \ }
"lightline
"lightline + vimlsp
let g:lightline = {
            \ 'active': {
            \   'right': [ [ 'lsp_errors', 'lsp_warnings', 'lsp_ok', 'lineinfo' ],
            \              [ 'percent' ],
            \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
            \ },
            \ 'component_expand': {
            \   'lsp_warnings': 'lightline_lsp#warnings',
            \   'lsp_errors':   'lightline_lsp#errors',
            \   'lsp_ok':       'lightline_lsp#ok',
            \ },
            \ 'component_type': {
            \   'lsp_warnings': 'warning',
            \   'lsp_errors':   'error',
            \   'lsp_ok':       'middle',
            \ },
            \ }
"lightline + vimlsp
""


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
Plug 'itchyny/lightline.vim'
Plug 'mbbill/undotree'
Plug 'ayu-theme/ayu-vim' " or other package manager
Plug 'sheerun/vim-wombat-scheme'
Plug 'mhartington/oceanic-next'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'm-pilia/vim-ccls'
Plug 'ryanolsonx/vim-lsp-python'
Plug 'mattn/vim-lsp-settings'
Plug 'halkn/lightline-lsp'
"completion
call plug#end()

autocmd VimEnter *
            \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
            \|   PlugInstall --sync | q|
            \|   PlugInstall --sync | q|
            \| endif
