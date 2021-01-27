set hidden
set nobackup
set nowritebackup
set updatetime=300

""----------------------------------------
" Asyncomplete , just for nim
""----------------------------------------

let g:lsp_diagnostics_enabled = 1
let g:gen_tags#gtags_default_map=1

let g:lsp_fold_enabled = 0
let g:lsp_virtual_text_enabled = 0
let g:lsp_diagnostics_enabled = 0
let g:lsp_diagnostics_echo_cursor = 1
let g:asyncomplete_auto_completeopt = 0
set completeopt=menuone,noinsert,noselect


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

function! s:NimCompletion() abort
  inoremap <silent><expr> <TAB> pumvisible() ?  "\<C-n>" :  <SID>check_back_space() ?  "\<TAB>" :  asyncomplete#force_refresh()
  inoremap <expr><S-TAB> pumvisible() ?  "\<C-p>" : \<C-h>"
  nnoremap <silent> K :call <SID>show_documentation()<CR>
  nnoremap  K  :LspHover<CR>
  nnoremap  F  :LspPeekDefinition<CR>
endfunction

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
endfunction
autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
""----------------------------------------
" COC
""----------------------------------------
function! s:SwitchCompletionToCOC() abort
  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space_coc() ? "\<TAB>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
  inoremap <silent><expr> <c-space> coc#refresh()
  inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm(): "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
  nnoremap <silent> K :call <SID>show_documentation()<CR>
endfunction

function! s:check_back_space_coc() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


nmap <silent> [g <Plug>(coc-diagnostic-prev)
";Jump to previous Coc diagnostic
nmap <silent> ]g <Plug>(coc-diagnostic-next)
";Jump to next Coc diagnostic

nmap <silent> gd <Plug>(coc-definition)
";Jump to definition (requres language server for filetype)
nmap <silent> gy <Plug>(coc-type-definition)
";Jump to type definition (requres language server for filetype)
nmap <silent> gy <Plug>(coc-implementation)
";Jump to implementation (requres language server for filetype)
nmap <silent> gr <Plug>(coc-references)
";Open Coc refferences for symbol (requres language server for filetype)
nmap <silent> <leader>o :CocList outline <CR>
";Open Coc Outline for file (requres language server for filetype)
nmap <silent> <leader>w :CocAction<CR>
";If a code action is suggested from language server, open a menu to chose (requres language server for filetype)

let g:coc_global_extensions = ['coc-marketplace', 'coc-html', 'coc-fzf-preview', 'coc-python', 'coc-json', 'coc-go','coc-rls','coc-tsserver','coc-vimlsp' ]

function! s:show_documentation()
  if (index(['vim','help'], &fau BufNewFile,BufRead *.nim set filetype=nimiletype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else 
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

autocmd BufNewFile,BufRead *.nim set filetype=nim
function s:SwitchBuffers()abort
    if  (&ft != 'nim')
        call s:SwitchCompletionToCOC()
    else 
        call s:NimCompletion()
    endif
endfunction
autocmd BufEnter * call s:SwitchBuffers()
