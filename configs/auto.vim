autocmd VimEnter *
            \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
            \|   PlugInstall --sync | q|
            \|   PlugClean! | q|
            \| endi
au BufRead * try | execute "compiler ".&filetype | catch /./ | endtry
