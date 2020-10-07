""General lsp and asyncomplete settings
let g:lsp_diagnostics_enabled = 1
let g:gen_tags#gtags_default_map=1

let g:lsp_fold_enabled = 0
let g:lsp_virtual_text_enabled = 0
let g:lsp_diagnostics_enabled = 0
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_log_verbose = 1
let g:lsp_log_file = expand('/tmp/vim-lsp.log')
" for asyncomplete.vim log

let g:asyncomplete_log_file = expand('/tmp/asyncomplete.log')
let g:asyncomplete_auto_popup = 1

let g:lsp_settings_root_markers = [
            \   '.git',
            \   '.git/',
            \   '.prjroot',
            \   'compile_command.json',
            \ ]
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
endfunction
autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()

nmap yd :LspDefinition<CR>
nmap yr :LspReferences<CR>
nmap yi :LspImplementation <CR>
nmap yf :LspRename <CR>
nmap K  :LspHover<CR>
nmap F  :LspPeekDefinition<CR>
