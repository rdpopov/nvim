set hidden
set nobackup
set nowritebackup
set cmdheight=2
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
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


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
"xmap if <Plug>(coc-funcobj-i)
"omap if <Plug>(coc-funcobj-i)
"xmap af <Plug>(coc-funcobj-a)
"omap af <Plug>(coc-funcobj-a)
"xmap ic <Plug>(coc-classobj-i)
"omap ic <Plug>(coc-classobj-i)
"xmap ac <Plug>(coc-classobj-a)
"omap ac <Plug>(coc-classobj-a)

autocmd BufNewFile,BufRead *.nim set filetype=nim
function s:SwitchBuffers()abort
    if  (&ft != 'nim')
        call s:SwitchCompletionToCOC()
    else 
        call s:NimCompletion()
    endif
endfunction
autocmd BufEnter * call s:SwitchBuffers()
