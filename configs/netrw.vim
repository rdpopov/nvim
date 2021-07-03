" stolen form here: https://stackoverflow.com/questions/5006950/setting-netrw-like-nerdtree
" tree-view
let g:netrw_winsize = 14
let g:netrw_liststyle = 3
let g:netrw_sizestyle= "h"
let g:netrw_banner=0
" sort is affecting only: directories on the top, files below
let g:netrw_sort_sequence = '[\/]$,*'
" use the previous window to open file
let g:netrw_browse_split = 4

com!  -nargs=* -bar -bang -complete=dir  Lexplore  call netrw#Lexplore(<q-args>, <bang>0)

fun! Lexplore(dir, right)
  if exists("t:netrw_lexbufnr")
  " close down netrw explorer window
  let lexwinnr = bufwinnr(t:netrw_lexbufnr)
  if lexwinnr != -1
    let curwin = winnr()
    exe lexwinnr."wincmd w"
    close
    exe curwin."wincmd w"
  endif
  unlet t:netrw_lexbufnr

  else
    " open netrw explorer window in the dir of current file
    " (even on remote files)
    let path = substitute(exists("b:netrw_curdir")? b:netrw_curdir : expand("%:p"), '^\(.*[/\\]\)[^/\\]*$','\1','e')
    exe (a:right? "botright" : "topleft")." vertical ". 15 . " new"
    if a:dir != ""
      exe "Explore ".a:dir
    else
      exe "Explore ".path
    endif
    setlocal winfixwidth
    let t:netrw_lexbufnr = bufnr("%")
  endif
endfun
nnoremap <C-n> :Lexplore<CR>
" absolute width of netrw window


