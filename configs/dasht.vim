" install them
"
" dasht-docsets-install cpp ^c$ boost OpenGL rust java_sell python vim lua racket ocaml bash go
" 
let g:dasht_results_window = 'tabnew'
let g:dasht_filetype_docsets = {} " filetype => list of docset name regexp
let g:dasht_filetype_docsets['c'] = ['c']
let g:dasht_filetype_docsets['cpp'] = ['cpp', '^c$', 'boost', 'OpenGL']
let g:dasht_filetype_docsets['python'] = ['python', '(num|sci)py', 'pandas']
let g:dasht_filetype_docsets['java'] = ['java_se11']
let g:dasht_filetype_docsets['rust'] = ['rust']
let g:dasht_filetype_docsets['vim'] = ['vim']
let g:dasht_filetype_docsets['lua'] = ['lua']
let g:dasht_filetype_docsets['racket'] = ['racket']
let g:dasht_filetype_docsets['ocaml'] = ['ocaml']
let g:dasht_filetype_docsets['sh'] = ['bash']
let g:dasht_filetype_docsets['go'] = ['go']

nnoremap <silent> <Leader>K :call Dasht(dasht#cursor_search_terms())<Return>
nnoremap <silent> <Leader><Leader>K :call Dasht(dasht#cursor_search_terms(), '!')<Return>
vnoremap <silent> <Leader>K y:<C-U>call Dasht(getreg(0))<Return>
vnoremap <silent> <Leader><Leader>K y:<C-U>call Dasht(getreg(0), '!')<Return>
