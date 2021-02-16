if (empty($TMUX))
  if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif
"set t_Co=256

""   gruvbox colors
"    colorscheme base16-gruvbox-dark-hard
"    let status_line = 'wombat'
""   tokyo night 
"    let g:tokyonight_style = 'night'
"    "available: night, storm
"    let g:tokyonight_enable_italic = 1
"    colorscheme tokyonight
"    let status_line = 'tokyonight'
""   srcery colors
"    colorscheme srcery
"    let status_line = 'srcery'


"statusline
set statusline=
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
      \             [ 'filename', 'modified','git_gutter','linter' ] ]
      \ },
      \ 'component_function': {
      \   'git_gutter': 'GitStatus',
      \   'linter':'LinterStatus',
      \ },
      \ }
function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction
