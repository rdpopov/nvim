" Contents: Autocommands for vim, that are not linked to programming languages an have to
" run when editor is tarted

autocmd VimEnter *
            \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
            \|   PlugInstall --sync | q|
            \|   PlugClean! | q|
            \| endi
au BufRead * try | execute "compiler ".&filetype | catch /./ | endtry
au WinEnter,BufEnter markdown,gitcommit,tex let g:compe.source.spell = v:true
au WinLeave,BufLeave markdown,gitcommit,tex let g:compe.source.spell = v:false

if filereadable("localrc.vim")
    source ./localrc.vim
endif

if exists("g:auto_session")
    if g:auto_session && filereadable("Session.vim")
        source ./Session.vim
    endif
endif
