if (has("termguicolors"))
  set termguicolors
endif

colorscheme codedark

function! LspStatus() abort
  let sl = ''
  try
		if luaeval('not vim.tbl_isempty(vim.lsp.buf_get_clients(0))')
  	  let sl.=' E: '
  	  let sl.= luaeval("vim.lsp.diagnostic.get_count(0, [[Error]])")
  	  let sl.= ' W: '
  	  let sl.=luaeval("vim.lsp.diagnostic.get_count(0, [[Warning]])")
  	endif
  catch
		let sl = ' '
  endtry
  return sl
endfunction

function! GitStatus()
	try
		let [a,m,r] = GitGutterGetHunkSummary()
		return printf('  +%d ~%d -%d ', a, m, r)
	catch
		return printf('   ')
	endtry
endfunction

set laststatus=2
set noshowmode
"" This was made by Reddit user u/SamLovesNotion. Also with the help of - https://tdaly.co.uk/projects/vim-statusline-generator/ for learning the syntax. Sorry for English & grammar, this post was made in hurry.""
""ayu
""let g:StslineColorGreen  = "#2BBB4F"
""let g:StslineColorBlue   = "#39BAE6"
""let g:StslineColorViolet = "#A37ACC"
""let g:StslineColorYellow = "#E6B450"
""let g:StslineColorOrange = "#FF8F40"
""
""let g:StslineColorLight  = "#C0C0C0"
""let g:StslineColorDark   = "#080808"
""let g:StslineColorDark1  = "#181818"
""let g:StslineColorDark2  = "#14191F"
""let g:StslineColorDark3  = "#161F2A"
""codedark
let g:StslineColorGreen  = "#4EC9B0"
let g:StslineColorBlue   = "#0A7ACA"
let g:StslineColorViolet = "#A37ACC"
let g:StslineColorYellow = "#FFAF00"
let g:StslineColorOrange = "#F44747"

let g:StslineColorLight  = "#C0C0C0"
let g:StslineColorDark   = "#080808"
let g:StslineColorDark1  = "#1E1E1E"
let g:StslineColorDark2  = "#1E1E1E"
let g:StslineColorDark3  = "#1E1E1E"

let g:StslineBackColor   = g:StslineColorDark2
let g:StslineOnBackColor = g:StslineColorLight

let g:StslineOnPriColor  = g:StslineColorDark
let g:StslineSecColor    = g:StslineColorDark3
let g:StslineOnSecColor  = g:StslineColorLight

execute 'highlight StslineSecColorFG guifg=' . g:StslineSecColor   ' guibg=' . g:StslineBackColor
execute 'highlight StslineSecColorBG guifg=' . g:StslineColorLight ' guibg=' . g:StslineSecColor
execute 'highlight StslineSecColorInactiveBG guifg=' . g:StslineColorViolet ' guibg=' . g:StslineBackColor
execute 'highlight StslineNetrwActiveBG guifg=' . g:StslineColorYellow ' guibg=' . g:StslineBackColor
execute 'highlight StslineBackColorBG guifg=' . g:StslineColorLight ' guibg=' . g:StslineBackColor
execute 'highlight StslineBackColorFGSecColorBG guifg=' . g:StslineBackColor ' guibg=' . g:StslineSecColor
execute 'highlight StslineSecColorFGBackColorBG guifg=' . g:StslineSecColor ' guibg=' . g:StslineBackColor
execute 'highlight StslineModColorFG guifg=' . g:StslineColorYellow ' guibg=' . g:StslineBackColor

execute "highlight TabLineFill guifg=" .g:StslineColorDark2   . " guibg=" . g:StslineColorGreen
execute "highlight TabLineSel guifg=" . g:StslineColorDark2  . " guibg=". g:StslineColorGreen
execute "highlight TabLine guifg=". g:StslineColorGreen. "guibg=". g:StslineColorGreen



let len_home = len($HOME)
let len_cwd =len('~'.getcwd()[len_home:])

function! ActivateStatusline()
	if &filetype == 'netrw'
	   setlocal statusline=%#StslinePriColorBG#\ %{StslineMode()}%#StslineNetrwActiveBG#%=%{'~'.expand('%:p:h')[len_home:]}
	elseif &buftype ==# "terminal" 
	    setlocal statusline=%#StslinePriColorBG#\ %{StslineMode()}%#StslinePriColorFG#\ %{expand('%:f')[len_cwd+9:]}\%=%#StslinePriColorBG#\ %p\%%\ %#StslinePriColorBGBold#%l%#StslinePriColorBG#/%L\ :%c\ 
	else
	    setlocal statusline=%#StslinePriColorBG#\ %{StslineMode()}%#StslineSecColorBG#\%{GitStatus()}%#StslinePriColorBG#\%{GetInputLang()}%#StslinePriColorFG#\ %f\ %#StslineModColorFG#%{&modified?\"[+]\ \":\"\"}%=%{LspStatus()}%#StslinePriColorFG#\ %{&filetype}\ %#StslineSecColorBG#%{&fenc!='utf-8'?\"\ \":''}%{&fenc!='utf-8'?&fenc:''}%{&fenc!='utf-8'?\"\ \":''}%#StslinePriColorBG#\ %p\%%\ %#StslinePriColorBGBold#%l%#StslinePriColorBG#/%L\ :%c\ 
	endif
endfunction

function! DeactivateStatusline()
	if &filetype == 'netrw'
	    setlocal statusline=%#StslineSecColorBG#\ INACTIVE\%#StslineSecColorInactiveBG#%=%{'~'.expand('%:p:h')[len_home:]}%#StslineModColorFG#
	elseif &buftype ==# "terminal" 
	    setlocal statusline=%#StslineSecColorBG#\ INACTIVE\ %#StslineSecColorInactiveBG#\ %{expand('%:f')[len_cwd+9:]}\ %#StslineModColorFG#%=%#StslineSecColorFGBackColorBG#%#StslineSecColorBG#\ %p\%%\ %l/%L\ :%c\ 
    else 
	    setlocal statusline=%#StslineSecColorBG#\ INACTIVE\ %#StslineSecColorInactiveBG#\ %F\ %#StslineModColorFG#%=%#StslineBackColorBG#\ %{&filetype}\ %#StslineSecColorFGBackColorBG#%#StslineSecColorBG#\ %p\%%\ %l/%L\ :%c\ 
    endif
endfunction
""==============================NETRW=======================================
" Get Statusline mode & also set primary color for that that mode
function! StslineMode()
    let l:CurrentMode=mode()
    if l:CurrentMode==#"n"
        let g:StslinePriColor     = g:StslineColorGreen
        let b:CurrentMode = "NORMAL "
    elseif l:CurrentMode==#"i"
        let g:StslinePriColor     = g:StslineColorBlue
        let b:CurrentMode = "INSERT "
    elseif l:CurrentMode==#"c"
        let g:StslinePriColor     = g:StslineColorYellow
        let b:CurrentMode = "COMMAND "
    elseif l:CurrentMode==#"v"
        let g:StslinePriColor     = g:StslineColorBlue
        let b:CurrentMode = "VISUAL "
    elseif l:CurrentMode==#"V"
        let g:StslinePriColor     = g:StslineColorBlue
        let b:CurrentMode = "V-LINE "
    elseif l:CurrentMode==#"\<C-v>"
        let g:StslinePriColor     = g:StslineColorViolet
        let b:CurrentMode = "V-BLOCK "
    elseif l:CurrentMode==#"R"
        let g:StslinePriColor     = g:StslineColorViolet
        let b:CurrentMode = "REPLACE "
    elseif l:CurrentMode==#"s"
        let g:StslinePriColor     = g:StslineColorBlue
        let b:CurrentMode = "SELECT "
    elseif l:CurrentMode==#"t"
        let g:StslinePriColor     =g:StslineColorYellow
        let b:CurrentMode = "TERM "
    elseif l:CurrentMode==#"!"
        let g:StslinePriColor     = g:StslineColorYellow
        let b:CurrentMode = "SHELL "
    endif
    call UpdateStslineColors()
    if expand('%:y') == 'help'
        let b:CurrentMode = 'HELP'
    endif
    return b:CurrentMode
endfunction
function! UpdateStslineColors()

execute 'highlight StslinePriColorBG           guifg=' . g:StslineOnPriColor ' guibg=' . g:StslinePriColor
execute 'highlight StslinePriColorBGBold       guifg=' . g:StslineOnPriColor ' guibg=' . g:StslinePriColor ' gui=bold'
execute 'highlight StslinePriColorFG           guifg=' . g:StslinePriColor   ' guibg=' . g:StslineBackColor
execute 'highlight StslinePriColorFGSecColorBG guifg=' . g:StslinePriColor   ' guibg=' . g:StslineSecColor
execute 'highlight StslineSecColorFGPriColorBG guifg=' . g:StslineSecColor   ' guibg=' . g:StslinePriColor

if !exists("b:gitbranch") || b:gitbranch == ''
execute 'highlight StslineBackColorFGPriColorBG guifg=' . g:StslineBackColor ' guibg=' . g:StslinePriColor
endif

endfunction

augroup SetStslineline
    autocmd!
    autocmd BufEnter,WinEnter * call ActivateStatusline()
    autocmd BufLeave,WinLeave * call DeactivateStatusline()
augroup END
