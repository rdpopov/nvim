set shiftwidth=2 tabstop=2 softtabstop=2 noexpandtab autoindent smartindent

" Automatically source .vimrc on save
augroup Vimrc
  autocmd!
  autocmd! bufwritepost .vimrc source %
augroup END

setlocal include=^\\s*\\%(\\.\\\|source\\)\\s
setlocal includeexpr=VimIncludeExpr(v:fname)
setlocal define=\\<\\%(\\i\\+\\s*()\\)\\@=

function! g:VimIncludeExpr(fname) abort
  if a:fname =~# '/' || a:fname =~# '\.vim$'
    return a:fname
  endif
endfunction



