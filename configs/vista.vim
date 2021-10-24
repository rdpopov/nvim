let g:vista_default_executive = 'ctags'
let g:vista_executive_for = {
  \ 'nim': 'nvim_lsp',
  \ 'c': 'nvim_lsp',
  \ 'cpp': 'nvim_lsp',
  \ 'python': 'nvim_lsp',
  \ 'html': 'nvim_lsp',
  \ 'javascript': 'nvim_lsp',
  \ }

let g:vista#renderer#icons = {
\   "function": "F",
\   "variable": "V",
\  }

function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
