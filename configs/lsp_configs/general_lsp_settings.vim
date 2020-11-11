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
endfunction
autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()

nmap yd :LspDefinition<CR>
";Get Defineition
nmap yr :LspReferences<CR>
";Get Refferences
nmap yi :LspImplementation <CR>
";Go to implementation
nmap yf :LspRename <CR>
";Rename the symbol
nmap K  :LspHover<CR>
";Get hover information
nmap F  :LspPeekDefinition<CR>
";Peek Definition
