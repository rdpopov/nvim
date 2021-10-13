" holds the current shell that you will hide and open with g:OpenTerm
let g:trm_buf = ""
" holds a list of shells that will be cycled on a round robin principle
let g:trm_list = []

" determines how to split the current window the best way
" if its full width of the editor , split it vertically
" if its the full heigth of the editor split horizontally
set splitright
set splitbelow

function! g:Det_split()
	let all_lines=&lines - 1
	let all_colmn=&columns
	let cur_win_lines = winheight(0) + 1
	let cur_win_colmn = winwidth(0)
	if all_colmn == cur_win_colmn
		return "vsplit"
	else 
		if all_lines == cur_win_lines
			return "split"
		else
			return (cur_win_lines/2 - 1)."split"
		endif
	endif
	return "vsplit"
endfunction

" This function creates a new shell and pushes the old one(current one) back
" in the list. order for cycling the shells is by order of creation

function! NewShell()
	execute "term"
	"echo "term:/".$SHELL
	if strlen(g:trm_buf) > 0 && index(g:trm_list,g:trm_buf) > 0
		" the shell is already in the list
		let g:trm_list = g:trm_list + [g:trm_buf]
	endif
	let g:trm_list = g:trm_list + [bufname()]
	let g:trm_buf = bufname()
endfunction

" Opens a terminal in a split but only one.
" if the terminal is open in a split go to it
" otherwise open a split determined by g:Det_split()
" if on terminal closes the split
function! g:OpenTerm(new)
	let l:spl = Det_split()
	if g:trm_buf == ""
		execute l:spl."| term"
		let g:trm_buf = bufname()
		return
	else
		if bufwinnr(g:trm_buf) > 0
			if bufwinid(g:trm_buf) > 0
				if bufname() == g:trm_buf
					if a:new
						call NewShell()
					else
						execute "q"
					endif
				else
					call win_gotoid(bufwinid(g:trm_buf))
					if a:new
						call NewShell()
					endif
					return
				endif
			else
				if bufname() == g:trm_buf
					if a:new
						call NewShell()
					else
						execute "q"
					endif
				else
					if bufexists(bufnr(g:trm_buf)) != 1
						if index(g:trm_list,g:trm_buf) > -1
							call remove(g:trm_list,index(g:trm_list,g:trm_buf))
						endif
						if len(g:trm_list) > 1
							g:trm_buf = g:trm_list[-1]
						else
							execute l:spl
							call NewShell()
							return
						endif
					endif
						execute "b ".g:trm_buf
					if a:new
						call NewShell()
					endif
				endif
				return
			endif
		else
			execute l:spl." | b ".g:trm_buf
			if a:new
				call NewShell()
			endif
			return
		endif
	endif
endfunction

function! g:CycleTerminal(dir)
	echo "todo"
endfunction
