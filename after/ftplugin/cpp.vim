function! s:CPreProcIncludes(exe, opts) abort
  let paths = []
  let active = 0
  for line in executable(a:exe) ? split(system(a:exe . ' ' . a:opts), "\n") : []
    if line =~# '^#include '
      let active = 1
    elseif line =~# '^\S'
      let active = 0
    elseif active
      call add(paths, matchstr(line, '\S\+'))
    endif
  endfor
  return paths
endfunction

if &filetype ==# 'cpp'
  if !exists('g:cpp_path')
    let g:c_path_compiler = get(g:, 'c_path_compiler', executable('clang') ? 'clang' : 'gcc')
    let g:cpp_path = ['.'] + s:CPreProcIncludes(g:c_path_compiler, '-E -v -x c++ /dev/null')
  endif
  call apathy#Prepend('path', g:cpp_path)
else
  if !exists('g:c_path')
    let g:c_path_compiler = get(g:, 'c_path_compiler', executable('clang') ? 'clang' : 'gcc')
    let g:c_path = ['.'] + s:CPreProcIncludes(g:c_path_compiler, '-E -v -x c /dev/null')
  endif
  call apathy#Prepend('path', g:c_path)
endif

setlocal include=^\\s*#\\s*include\\s*[\"<]\\@=
setlocal includeexpr&
setlocal define&

" Vim compiler file
" Compiler:             GNU C Compiler
" Previous Maintainer:  Nikolai Weibull <now@bitwi.se>
" Latest Revision:      2010-10-14
" 			changed pattern for entering/leaving directories
" 			by Daniel Hahler, 2019 Jul 12
" 			added line suggested by Anton Lindqvist 2016 Mar 31

if exists("current_compiler")
  finish
endif
let current_compiler = "gcc"

let s:cpo_save = &cpo
set cpo&vim

CompilerSet errorformat=
      \%*[^\"]\"%f\"%*\\D%l:%c:\ %m,
      \%*[^\"]\"%f\"%*\\D%l:\ %m,
      \\"%f\"%*\\D%l:%c:\ %m,
      \\"%f\"%*\\D%l:\ %m,
      \%-G%f:%l:\ %trror:\ (Each\ undeclared\ identifier\ is\ reported\ only\ once,
      \%-G%f:%l:\ %trror:\ for\ each\ function\ it\ appears\ in.),
      \%f:%l:%c:\ %trror:\ %m,
      \%f:%l:%c:\ %tarning:\ %m,
      \%f:%l:%c:\ %m,
      \%f:%l:\ %trror:\ %m,
      \%f:%l:\ %tarning:\ %m,
      \%f:%l:\ %m,
      \%f:\\(%*[^\\)]\\):\ %m,
      \\"%f\"\\,\ line\ %l%*\\D%c%*[^\ ]\ %m,
      \%D%*\\a[%*\\d]:\ Entering\ directory\ %*[`']%f',
      \%X%*\\a[%*\\d]:\ Leaving\ directory\ %*[`']%f',
      \%D%*\\a:\ Entering\ directory\ %*[`']%f',
      \%X%*\\a:\ Leaving\ directory\ %*[`']%f',
      \%DMaking\ %*\\a\ in\ %f

if exists('g:compiler_gcc_ignore_unmatched_lines')
  CompilerSet errorformat+=%-G%.%#
endif

let &cpo = s:cpo_save
unlet s:cpo_save
compiler cpp



call apathy#Undo()

