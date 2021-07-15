" See all the avaliable executives via `:echo g:vista#executives`.
let g:vista_default_executive = 'ctags'

" Set the executive for some filetypes explicitly. Use the explicit executive
" instead of the default one for these filetypes when using `:Vista` without
" specifying the executive.
let g:vista_executive_for = {
  \ 'nim': 'nvim_lsp',
  \ 'c': 'nvim_lsp',
  \ 'cpp': 'nvim_lsp',
  \ 'python': 'nvim_lsp',
  \ 'php': 'nvim_lsp',
  \ 'html': 'nvim_lsp',
  \ 'javascript': 'nvim_lsp',
  \ 'bash': 'nvim_lsp',
  \ }

let g:vista#renderer#icons = {
\   "function": "F",
\   "variable": "V",
\  }
