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

"quickr-previw
let g:quickr_preview_position = 'above'
let g:quickr_preview_on_cursor = 1
let g:quickr_preview_exit_on_enter = 1
let g:quickr_preview_size = '10'
