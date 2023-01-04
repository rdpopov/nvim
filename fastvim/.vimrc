"======================================================================================================
" Basic Settings
"======================================================================================================
syntax enable
syntax on
filetype plugin on
set path+=**
set nocompatible
set nowildmenu
set wildmode=list:full
set nowrap
set tabstop=4
set softtabstop=4
set expandtab
set backspace=indent,eol,start
set smartindent
set splitbelow
set number
set shiftwidth=4
set shiftround
set showmatch
set ignorecase
set smartcase
set smarttab
set hlsearch
set incsearch
set hidden
set colorcolumn=80
set foldmethod=syntax
set scrolloff=4
set clipboard=unnamedplus
set sidescrolloff=4
set signcolumn=yes
set history=10000
set updatetime=100
set undolevels=10000
set wildignore=*.swp,*.bak,*.pyc,*.class,*.out,*.so
set title
set novisualbell
set noerrorbells
set nobackup
set noswapfile
set nofoldenable
set cursorline
set cursorlineopt+=screenline
set relativenumber 
set lazyredraw
set cpt=.,w,d,i,b,u
"set listchars=tab:>,trail:.
set list listchars=tab:>\ ,trail:·,extends:→,
set undodir=~/.vimundo,
set undofile 

"======================================================================================================
" Keymaps
"======================================================================================================

function! Redir(cmd)
    if a:cmd =~ '^!'
    execute "let output = system('" . substitute(a:cmd, '^!', '', '') . "')"
    else
    redir => output
    execute a:cmd
    redir END
    endif
    tabnew
    setlocal nobuflisted buftype=nofile bufhidden=wipe noswapfile
    call setline(1, split(output, "\n"))
    put! = a:cmd
    " put = '----'
    " endfunction
    "
    " xnoremap @ :<C-u>call
    " ExecuteMacroOverVisualRange()<CR>
    " function! ExecuteMacroOverVisualRange()
    "   echo "@".getcmdline()
    execute ":'<,'>normal @".nr2char(getchar())
    endfunction

function! VBlockNorm()
    execute ":'<,'>normal ". input("norm ")
    endfunction
command! -nargs=1 Redir silent call Redir(<f-args>)

let mapleader=" "
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap == vi{=<Esc>
nnoremap <Leader>= 1z=
xnoremap <leader><leader> :<C-u>call VBlockNorm()<cr>
xnoremap <leader>sr :s///g
xnoremap <leader>SS :s/\(\)/\1\r/g<Left><Left><Left><Left><Left><Left><Left><Left><Left>
xnoremap <leader>ss :s/\(\)/\r/g<Left><Left><Left><Left><Left><Left><Left>
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
nnoremap ,/ :nohlsearch<CR>

nnoremap <C-s> :call ChooseTerm("term-slider", 1)<CR>
tnoremap <C-s> <C-\><C-n>:close<CR>

command -nargs=1 Grep vimgrep /<args>/gj **/*
nnoremap <expr> <leader>G  ':vimgrep /'. input("Search for: ").'/g **/*<CR>'
nnoremap <expr> <leader>g  ':vimgrep /'. expand('<cword>'). '/g **/*<CR>'
nmap <script> <silent> <leader>l :call ToggleLocationList()<CR>
nmap <script> <silent> <leader>c :call ToggleQuickfixList()<CR>


"======================================================================================================
" File manager
"======================================================================================================
let g:netrw_winsize = 14
let g:netrw_liststyle = 3
let g:netrw_sizestyle= "h"
let g:netrw_localrmdir= 'rm -rf'
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
    exe (a:right? "botright" : "topleft")." vertical ". 40 . " new"
    if a:dir != ""
      exe "Explore ".a:dir
    else
      exe "Explore ".path
    endif
    setlocal winfixwidth
    let t:netrw_lexbufnr = bufnr("%")
  endif
endfun
nnoremap <silent><C-n> :Lexplore \| vertical resize 30<CR>

"======================================================================================================
" Statusline
"======================================================================================================

au InsertEnter * hi statusline guifg=black guibg=#d7afff ctermfg=black ctermbg=magenta
au InsertLeave * hi statusline guifg=black guibg=#8fbfdc ctermfg=black ctermbg=cyan
hi statusline guifg=black guibg=#8fbfdc ctermfg=black ctermbg=cyan

" Status line
" default: set statusline=%f\ %h%w%m%r\ %=%(%l,%c%V\ %=\ %P%)

" Status Line Custom
let g:currentmode={
    \ 'n'  : 'Normal',
    \ 'no' : 'Normal·Operator Pending',
    \ 'v'  : 'Visual',
    \ '' : 'V·Block',
    \ 'V'  : 'V·Line',
    \ 's'  : 'Select',
    \ 'S'  : 'S·Line',
    \ '' : 'S·Block',
    \ 'i'  : 'Insert',
    \ 'R'  : 'Replace',
    \ 'Rv' : 'V·Replace',
    \ 'c'  : 'Command',
    \ 'cv' : 'Vim Ex',
    \ 'ce' : 'Ex',
    \ 'r'  : 'Prompt',
    \ 'rm' : 'More',
    \ 'r?' : 'Confirm',
    \ '!'  : 'Shell',
    \ 't'  : 'Terminal'
    \}

set laststatus=2
set noshowmode
set statusline=
set statusline+=%0*\ %{toupper(g:currentmode[mode()])}\  " The current mode
set statusline+=%1*\ %<%F%m%r%h%w\                       " File path, modified, readonly, helpfile, preview
set statusline+=%3*│                                     " Separator
set statusline+=%2*\ %Y\                                 " FileType
set statusline+=%3*│                                     " Separator
set statusline+=%2*\ %{''.(&fenc!=''?&fenc:&enc).''}     " Encoding
set statusline+=\ (%{&ff})                               " FileFormat (dos/unix..)
set statusline+=%=                                       " Right Side
set statusline+=%2*\ col:\ %02v\                         " Colomn number
set statusline+=%3*│                                     " Separator
set statusline+=%1*\ ln:\ %02l/%L\ (%3p%%)\              " Line number / total lines, percentage of document
set statusline+=%0*\ %n\                                 " Buffer number

hi User1 ctermfg=007 ctermbg=239 guibg=#4e4e4e guifg=#adadad
hi User2 ctermfg=007 ctermbg=236 guibg=#303030 guifg=#adadad
hi User3 ctermfg=236 ctermbg=236 guibg=#303030 guifg=#303030
hi User4 ctermfg=239 ctermbg=239 guibg=#4e4e4e guifg=#4e4e4e

"======================================================================================================
" Editing Utils
"======================================================================================================

colorscheme industry



"======================================================================================================
" Utils
"======================================================================================================

function! s:GetBufferList() 
	redir =>buflist 
	silent! ls! 
	redir END 
	return buflist 
endfunction

function! ToggleLocationList()
	let curbufnr = winbufnr(0)
	for bufnum in map(filter(split(s:GetBufferList(), '\n'), 'v:val =~ "Location List"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
		if curbufnr == bufnum
			lclose
			return
		endif
	endfor

	let winnr = winnr()
	let prevwinnr = winnr("#")

	let nextbufnr = winbufnr(winnr + 1)
	try
		lopen
	catch /E776/
		echohl ErrorMsg 
		echo "Location List is Empty."
		echohl None
		return
	endtry
	if winbufnr(0) == nextbufnr
		lclose
		if prevwinnr > winnr
			let prevwinnr-=1
		endif
	else
		if prevwinnr > winnr
			let prevwinnr+=1
		endif
	endif
	exec prevwinnr."wincmd w"
	exec winnr."wincmd w"
endfunction

function! ToggleQuickfixList()
	for bufnum in map(filter(split(s:GetBufferList(), '\n'), 'v:val =~ "Quickfix List"'), 'str2nr(matchstr(v:val, "\\d\\+"))') 
		if bufwinnr(bufnum) != -1
			cclose
			return
		endif
	endfor
	let winnr = winnr()
	if exists("g:toggle_list_copen_command")
		exec(g:toggle_list_copen_command)
	else
		copen
	endif
	if winnr() != winnr
		wincmd p
	endif
endfunction

function g:ExecToList(exc,arg)
	redir => srch 
	silent exe a:exc
	redir END
	if len(srch) > 1
		call setloclist(0,[], a:arg, {'title': 'Search'})
		let tmp = split(srch,"\n")
		let crnt_file = ""
		for ln in tmp
				echo ln
			if !empty(glob(ln))
				let crnt_file = findfile(ln)
			else
				let line = matchstr(ln,'^ \{1,}\d\{1,}: \{1,}\d\{1,}')
				let ln_n = substitute(matchstr(line,':.*')[1:],' ','','g')
				let ent = {'filename':crnt_file,'lnum':ln_n,'text':ln[len(line):]}
				" debug print
				"echo ent
				call setloclist(0,[ent],'a')
			endif
		endfor
		lopen
	endif
endfunction

function g:IncRef()
	call ExecToList('ilist '.expand('<cword>'),'f')
endfunction

function g:IncFind()
	call ExecToList('isearch '.input("Look for: "),'f')
endfunction

function g:DefRef()
	call ExecToList('dlist '.expand('<cword>'),'f')
endfunction

function g:DefFind()
	call ExecToList('dsearch '.input("Look for: "),'f')
endfunction
command! MakeTags !ctags -R --exclude=.git --exclude=.ccls_cache --exclude=test

silent exec '!mkdir -p ~/.vim/pack/{colorschemes,syntax,others}/{start,opt}'

function! ChooseTerm(termname, slider)
    let pane = bufwinnr(a:termname)
    let buf = bufexists(a:termname)
    if pane > 0
        " pane is visible
        if a:slider > 0
            :exe pane . "wincmd c"
        else
            :exe "e #" 
        endif
    elseif buf > 0
        " buffer is not in pane
        " if a:slider
        "     :exe "topleft split"
        " endif
        :exe "buffer " . a:termname
    else
        " buffer is not loaded, create
        if a:slider
            :exe "topleft split"
        endif
        :exe "f " a:termname
    endif
endfunction
"================================================================================
"Plugins
"================================================================================
function g:GetRepo(person,repo)
   if isdirectory(expand('~').'/.vim/pack/others/start/'. a:repo) > 0
    return
   endif
   silent exec '!git  -C ~/.vim/pack/others/start clone https://github.com/'.a:person.'/'.a:repo .' --depth 1'
endfunction

call g:GetRepo('tpope','vim-fugitive')
call g:GetRepo('tpope','vim-commentary')
call g:GetRepo('mbbill','undotree')
call g:GetRepo('airblade','vim-gitgutter')
call g:GetRepo('will133','vim-dirdiff')
