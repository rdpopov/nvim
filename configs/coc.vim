" Contents: Coc and vimlsp + asyncomplete configuration
" needed both because of nimlang, asyncomplete + vimlsp is better for
" completion, suggestion list is just plain better but coc is better for going
" around the code
" And coc is just king when it comes to plug and play lsp

set hidden
set nobackup
set nowritebackup
set updatetime=300
set completeopt=menuone,noinsert,noselect

let g:asyncomplete_auto_completeopt = 0


let g:asyncomplete_auto_popup = 1

function!  s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~ '\s'
endfunction

au User asyncomplete_setup call asyncomplete#register_source({
    \ 'name': 'nim',
    \ 'whitelist': ['nim'],
    \ 'completor': {opt, ctx -> nim#suggest#sug#GetAllCandidates({start, candidates -> asyncomplete#complete(opt['name'], ctx, start, candidates)})}
    \ })

function! s:NimCompletion() abort
  inoremap <silent><expr> <TAB> pumvisible() ?  "\<C-n>" :  <SID>check_back_space() ?  "\<TAB>" :  asyncomplete#force_refresh()
  inoremap <expr><S-TAB> pumvisible() ?  "\<C-p>" :call <SID>show_documentation<CR>
endfunction
nnoremap <silent> K :call <SID>show_documentation()<CR>
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
  if (coc#rpc#ready())
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
