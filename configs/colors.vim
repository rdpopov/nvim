" Contents: Colorscheme , statusline and itchyny/lightline.vim configuration

if (empty($TMUX))
  if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif
colorscheme PaperColor
let status_line = "PaperColor"

" Statusline configuration 
set statusline=
set statusline+=%#g:lang_id#
set statusline+=%#PmenuSel#
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m\
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ 

function! LspStatus() abort
  let sl = ''
  if luaeval('not vim.tbl_isempty(vim.lsp.buf_get_clients(0))')
    let sl.=' E: '
    let sl.= luaeval("vim.lsp.diagnostic.get_count(0, [[Error]])")
    let sl.= ' W: '
    let sl.=luaeval("vim.lsp.diagnostic.get_count(0, [[Warning]])")
  endif
  return sl
endfunction

"
"Lightline 
"
set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': status_line ,
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'lang','filename', 'modified','git_gutter','lsp' ] ]
      \ },
      \ 'component_function': {
      \   'git_gutter': 'GitStatus',
      \   'lsp':'LspStatus',
      \   'lang' :'GetInputLang',
      \ },
      \ }
function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction
