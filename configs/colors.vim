" Contents: Colorscheme , statusline and itchyny/lightline.vim configuration

if (empty($TMUX))
  if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif
colorscheme embark
let status_line = "embark"

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
"
"Lightline 
"
set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': status_line ,
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'lang','filename', 'modified','git_gutter','linter' ] ]
      \ },
      \ 'component_function': {
      \   'git_gutter': 'GitStatus',
      \   'linter':'LinterStatus',
      \   'lang' :'GetInputLang',
      \ },
      \ }
function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction
