" Contents: Autocommands for vim, that are not linked to programming languages an have to
" run when editor is tarted

autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))  | PlugInstall --sync | q| PlugClean! | q| endif
au BufRead * try | execute "compiler ".&filetype | catch /./ | endtry
au WinEnter,BufEnter markdown,gitcommit,tex let g:compe.source.spell = v:true
au WinLeave,BufLeave markdown,gitcommit,tex let g:compe.source.spell = v:false

if filereadable("$HOME/.config/nvim/machinerc.vim")
    source $HOME/.config/nvim/machinerc.vim
else
    call system("echo -e \"let g:auto_session= v:false\nlet g:use_ripgrep = v:true\" > $HOME/.config/nvim/machinerc.vim") 
endif

if filereadable("localrc.vim")
    source ./localrc.vim
endif

if exists("g:auto_session")
    if g:auto_session && filereadable("Session.vim")
        source ./Session.vim
    endif
endif

if has('autocmd')
 autocmd filetype python set expandtab
 autocmd filetype nim set expandtab
 "`autocmd BufNewFile,BufRead *.nim set filetype=nim
endif

function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

