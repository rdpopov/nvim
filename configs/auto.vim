" Contents: Autocommands for vim, that are not linked to programming languages an have to
" run when editor is tarted
au BufRead * try | execute "compiler ".&filetype | catch /./ | endtry
