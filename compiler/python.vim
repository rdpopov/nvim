if exists("current_compiler")
      finish
endif
let current_compiler = "python"

let s:cpo_save = &cpo
set cpo&vim

CompilerSet errorformat=
      \%ne\ %lne\ %l,
CompilerSet makeprg=python3\ %

let &cpo = s:cpo_save
unlet s:cpo_save*
