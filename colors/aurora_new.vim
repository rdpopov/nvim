" ----------------------------------------------------------------------------
" Info:
" ----------------------------------------------------------------------------

" File:       aurora.vim
" Version:    2.0.0
" Maintainer: Rafal Bromirski
" URL:        https://github.com/rafalbromirski/vim-aurora
" Modified:   Sun 3 May 2020 21:03:28 CEST
" License:    MIT

" ----------------------------------------------------------------------------
" Initial Setup:
" ----------------------------------------------------------------------------

if !has("gui_running") && &t_Co < 256
  finish
endif

highlight! clear
syntax reset

let g:colors_name = "aurora_new"
set background=dark

" ----------------------------------------------------------------------------
" Colors:
" ----------------------------------------------------------------------------
" resources:
" - https://maketintsandshades.com/

let s:black     = '#000000'
let s:white     = '#ffffff'

let s:accent_1 = '#0b0b14'
let s:accent_2 = '#1b1b24'
let s:accent_3 = '#262631'
let s:accent_4 = '#3a3a47'
let s:accent_5 = '#69697c'
let s:accent_6 = '#cfcfdd'

let s:accent_inactive = '#1F1F29'

let s:red          = '#ff4040'
let s:orange       = '#ff9326'
let s:yellow       = '#ffcb65'
let s:green        = '#9ceb4f'
let s:aqua         = '#18ffe0'
let s:blue         = '#31baff'
let s:purple       = '#9d8cff'

let s:darkred      = "#661a1a"
let s:darkorange   = "#663b0f"
let s:darkyellow   = "#665128"
let s:darkgreen    = "#3e5e20"
let s:darkaqua     = "#0a665a"
let s:darkblue     = "#144a66"
let s:darkpurple   = "#3f3866"

let s:lightred     = "#ffb3b3"
let s:lightorange  = "#ffd4a8"
let s:lightyellow  = "#ffeac1"
let s:lightgreen   = "#d7f7b9"
let s:lightaqua    = "#a3fff3"
let s:lightblue    = "#ade3ff"
let s:lightpurple  = "#d8d1ff"

let s:none = "NONE"

" ----------------------------------------------------------------------------
" Formatters:
" ----------------------------------------------------------------------------

let s:none   = "NONE"
let s:underline = 'bold'
let s:undercurl = 'undercurl'
let s:bold = 'bold'
let s:italic = 'italic'
let s:inverse = 'inverse'
let s:reverse = 'reverse'

" ----------------------------------------------------------------------------
" Functions:
" ----------------------------------------------------------------------------

function! s:HL(group, fg, bg, attr)
  execute 'highlight! ' . a:group . ' ctermfg=NONE'
  execute 'highlight! ' . a:group . ' ctermbg=NONE'
  execute 'highlight! ' . a:group . ' cterm=NONE'

  if !empty(a:fg)
    execute 'highlight! ' . a:group . ' guifg=' . a:fg
  else
    execute 'highlight! ' . a:group . ' guifg=NONE'
  endif

  if !empty(a:bg)
    execute 'highlight! ' . a:group . ' guibg=' . a:bg
  else
    execute 'highlight! ' . a:group . ' guibg=NONE'
  endif

  if !empty(a:attr)
    execute 'highlight! ' . a:group . ' gui=' . a:attr
  else
    execute 'highlight! ' . a:group . ' gui=NONE'
  endif
endfunction

" ----------------------------------------------------------------------------
" Vim Highlighting: (see :help highlight-groups)"
" ----------------------------------------------------------------------------

call s:HL('Normal', s:accent_6, s:accent_2, s:none)
call s:HL('NormalNC', s:accent_6, s:accent_inactive, s:none)

call s:HL('ColorColumn', s:none, s:accent_3, s:none)
" call s:HL('Conceal', ...)

call s:HL('Cursor', s:accent_2, s:accent_6, s:none)
" call s:HL('CursorIM', s:accent_2, s:accent_6, s:none)
call s:HL('CursorColumn', s:none, s:accent_3, s:none)
call s:HL('CursorLine', s:none, s:accent_3, s:none)

call s:HL('Directory', s:purple, s:none, s:none)

call s:HL('DiffAdd', s:accent_2, s:green, s:none)
call s:HL('DiffChange', s:lightpurple, s:darkpurple, s:none)
call s:HL('DiffDelete', s:accent_2, s:red, s:none)
call s:HL('DiffText', s:accent_2, s:blue, s:none)

call s:HL('ErrorMsg', s:red, s:none, s:none)
call s:HL('VertSplit', s:accent_3, s:none, s:none)
call s:HL('Folded', s:accent_5, s:none, s:none)
call s:HL('FoldColumn', s:accent_5, s:none, s:none)
call s:HL('SignColumn', s:none, s:none, s:none)
" call s:HL('Incsearch', s:none, s:none, s:none)

call s:HL('LineNr', s:accent_4, s:none, s:none)
call s:HL('CursorLineNr', s:yellow, s:none, s:none)
call s:HL('MatchParen', s:accent_2, s:purple, s:none)
call s:HL('ModeMsg', s:green, s:none, s:none)
call s:HL('MoreMsg', s:green, s:none, s:none)
call s:HL('NonText', s:accent_4, s:none, s:none)

call s:HL('Pmenu', s:accent_6, s:accent_4, s:none)
call s:HL('PmenuSel', s:accent_2, s:purple, s:none)
" call s:HL('PmenuSbar', ...)
" call s:HL('PmenuSbar', ...)

call s:HL('Question', s:green, s:none, s:none)
call s:HL('Search', s:accent_2, s:yellow, s:none)
call s:HL('SpecialKey', s:accent_4, s:none, s:none)
call s:HL('SpellCap', s:blue, s:darkblue, s:underline)
call s:HL('SpellLocal', s:aqua, s:darkaqua, s:underline)
call s:HL('SpellBad', s:red, s:darkred, s:underline)
call s:HL('SpellRare', s:purple, s:darkpurple, s:underline)

call s:HL('StatusLine', s:accent_6, s:accent_1, s:none)
call s:HL('StatusLineNc', s:accent_4, s:accent_1, s:none)
call s:HL('StatusLineTerm', s:accent_1, s:purple, s:none)
call s:HL('StatusLineTermNc', s:accent_1, s:darkpurple, s:none)

call s:HL('TabLine', s:accent_5, s:accent_3, s:none)
call s:HL('TabLineFill', s:accent_3, s:accent_3, s:none)
call s:HL('TabLineSel', s:accent_6, s:accent_2, s:none)

call s:HL('Title', s:yellow, s:none, s:none)

call s:HL('Visual', s:none, s:accent_4, s:none)
" call s:HL('VisualNos', ...)

call s:HL('WarningMsg', s:red, s:none, s:none)
" call s:HL('LongLineWarning', ...)
call s:HL('WildMenu', s:accent_2, s:yellow, s:none)

" ----------------------------------------------------------------------------
" Generic Syntax: (see :help group-name)
" ----------------------------------------------------------------------------

call s:HL('Comment', s:accent_5, s:none, s:none)

call s:HL('Constant', s:red, s:none, s:none)
call s:HL('String', s:green, s:none, s:none)
call s:HL('Character', s:green, s:none, s:none)
call s:HL('Number', s:green, s:none, s:none)
call s:HL('Boolean', s:green, s:none, s:none)
call s:HL('Float', s:green, s:none, s:none)
call s:HL('Number', s:orange, s:none, s:none)
call s:HL('Boolean', s:blue, s:none, s:none)

call s:HL('Identifier', s:purple, s:none, s:none)
call s:HL('Function', s:yellow, s:none, s:none)
call s:HL('Statement', s:blue, s:none, s:none)
call s:HL('Operator', s:aqua, s:none, s:none)
call s:HL('Exception', s:aqua, s:none, s:none)

call s:HL('PreProc', s:aqua, s:none, s:none)
call s:HL('Include', s:aqua, s:none, s:none)
call s:HL('Define', s:orange, s:none, s:none)
call s:HL('Macro', s:red, s:none, s:none)
call s:HL('PreCondit', s:aqua, s:none, s:none)

call s:HL('Type', s:orange, s:none, s:none)
call s:HL('StorageClass', s:aqua, s:none, s:none)
call s:HL('Structure', s:aqua, s:none, s:none)
call s:HL('Typedef', s:lightyellow, s:none, s:none)

call s:HL('Special', s:green, s:none, s:none)
call s:HL('SpecialChar', s:lightgreen, s:none, s:none)
call s:HL('Tag', s:lightgreen, s:none, s:none)
call s:HL('Delimiter', s:lightaqua, s:none, s:none)

call s:HL('Underlined', s:blue, s:none, s:none)
call s:HL('Ignore', s:none, s:none, s:none)
call s:HL('Error', s:red, s:darkred, s:underline)
call s:HL('Todo', s:orange, s:darkorange, s:underline)

call s:HL('CmpItemAbbr', s:green, s:none, s:none)
call s:HL('CmpItemAbbrMatch', s:white, s:none, s:none)

" Quickfix window highlighting
call s:HL('qfLineNr', s:yellow, s:none, s:none)
call s:HL('qfFileName' , s:green, s:none, s:none)
call s:HL('qfLineNr'   , s:aqua, s:none, s:none)
call s:HL('qfError'    , s:red, s:none, s:none)

" ----------------------------------------------------------------------------
" GitGutter Syntax:
" ----------------------------------------------------------------------------

call s:HL('GitGutterAdd', s:green, s:none, s:none)
call s:HL('GitGutterDelete', s:red, s:none, s:none)
call s:HL('GitGutterChange', s:yellow, s:none, s:none)

call s:HL('GitSignsAdd', s:green, s:none, s:none)
call s:HL('GitSignsDelete', s:red, s:none, s:none)
call s:HL('GitSignsChange', s:blue, s:none, s:none)
" ----------------------------------------------------------------------------
" Terminal Syntax:
" ----------------------------------------------------------------------------
call s:HL('LspDiagnosticsDefaultError', s:red, s:none, s:bold)
call s:HL('LspDiagnosticsDefaultWarning', s:yellow, s:none, s:italic)
call s:HL('LspDiagnosticsDefaultInformation', s:orange,s:none,s:none)
call s:HL('LspDiagnosticsDefaultHint', s:none,s:none,s:none)

call s:HL('Terminal', s:accent_6, s:accent_1, s:none)


"vim.api.nvim_set_hl(0, "TelescopeBorder                  "  , {link = "TelescopeNormal"} )
"vim.api.nvim_set_hl(0, "TelescopeMatching                "  , {link = "GruvboxBlue"} )
"vim.api.nvim_set_hl(0, "TelescopeMultiSelection          "  , {link = "GruvboxGray"} )
"vim.api.nvim_set_hl(0, "TelescopeNormal                  "  , {link = "GruvboxFg1"} )
"vim.api.nvim_set_hl(0, "TelescopePreviewBorder           "  , {link = "TelescopeNormal"} )
"vim.api.nvim_set_hl(0, "TelescopePrompt                  "  , {link = "TelescopeNormal"} )
"vim.api.nvim_set_hl(0, "TelescopePromptBorder            "  , {link = "TelescopeNormal"} )
"vim.api.nvim_set_hl(0, "TelescopePromptPrefix            "  , {link = "GruvboxRed"} )
"vim.api.nvim_set_hl(0, "TelescopeResultsBorder           "  , {link = "TelescopeNormal"} )
"vim.api.nvim_set_hl(0, "TelescopeSelection               "  , {link = "GruvboxOrangeBold"} )
"vim.api.nvim_set_hl(0, "TelescopeSelectionCaret          "  , {link = "GruvboxRed"} )

" call s:HL("TSException          ,s:italic           guifg=#F8BD96 guibg=none)
" call s:HL("TSConstBuiltin       ,s:italic           guifg=#C9CBFF guibg=none)
" call s:HL("TSFuncBuiltin        ,s:italic           guifg=#F8BD96 guibg=none)
" call s:HL("TSTypeBuiltin        ,s:italic           guifg=#FAE3B0 guibg=none)
" call s:HL("TSFuncMacro          ,s:none             guifg=#F28FAD guibg=none)
" call s:HL("TSKeywordFunction    ,s:italic           guifg=#E8A2AF guibg=none)
" call s:HL("TSKeyword            ,s:italic           guifg=#F28FAD guibg=none)
" call s:HL("TSKeywordReturn      ,s:none             guifg=#F5C2E7 guibg=none)
" call s:HL("TSNote               ,s:none             guifg=#1E1E2E guibg=#96CDFB)
" call s:HL("TSWarning            ,s:none             guifg=#1E1E2E guibg=#FAE3B0)
" call s:HL("TSDanger             ,s:none             guifg=#1E1E2E guibg=#F28FAD)
" call s:HL("TSLabel              ,s:none             guifg=#96CDFB guibg=none)
" call s:HL("TSNamespace          ,s:italic           guifg=#F5E0DC guibg=none)
" call s:HL("tomlTSProperty       ,s:none             guifg=#96CDFB guibg=none)
" call s:HL("TSPunctDelimiter     ,s:none             guifg=#B5E8E0 guibg=none)
" call s:HL("TSPunctBracket       ,s:none             guifg=#988BA2 guibg=none)
" call s:HL("TSString             ,s:none             guifg=#ABE9B3 guibg=none)
" call s:HL("TSStringRegex        ,s:none             guifg=#F8BD96 guibg=none)
" call s:HL("TSType               ,s:none             guifg=#FAE3B0 guibg=none)
" call s:HL("TSVariable           ,s:italic           guifg=#D9E0EE guibg=none)
" call s:HL("TSTagAttribute       ,s:italic           guifg=#DDB6F2 guibg=none)
" call s:HL("TSTag                ,s:none             guifg=#F8BD96 guibg=none)
" call s:HL("TSTagDelimiter       ,s:none             guifg=#E8A2AF guibg=none)
" call s:HL("TSText               ,s:none             guifg=#D9E0EE guibg=none)
" call s:HL("TSURI                ,s:underline        guifg=#F5E0DC guibg=none)
" call s:HL("TSLiteral            ,s:italic           guifg=#B5E8E0 guibg=none)
" call s:HL("TSTextReference      ,s:bold             guifg=#C9CBFF guibg=none)
" call s:HL("TSTitle              ,s:bold             guifg=#96CDFB guibg=none)
" call s:HL("TSEmphasis           ,s:italic           guifg=#E8A2AF guibg=none)
" call s:HL("TSStrong             ,s:bold             guifg=#E8A2AF guibg=none)
" call s:HL("TSStringEscape       ,s:none             guifg=#F5C2E7 guibg=none)
" call s:HL("bashTSFuncBuiltin    ,s:italic           guifg=#F28FAD guibg=none)
" call s:HL("bashTSParameter      ,s:italic           guifg=#FAE3B0 guibg=none)
" call s:HL("luaTSField           ,s:none             guifg=#C9CBFF guibg=none)
" call s:HL("luaTSConstructor     ,s:none             guifg=#F2CDCD guibg=none)
" call s:HL("javaTSConstant       ,s:none             guifg=#B5E8E0 guibg=none)
" call s:HL("typescriptTSProperty ,s:italic           guifg=#C9CBFF guibg=none)
" call s:HL("cssTSType            ,s:none             guifg=#C9CBFF guibg=none)
" call s:HL("cssTSProperty        ,s:italic           guifg=#FAE3B0 guibg=none)
" call s:HL("cppTSProperty        ,s:none             guifg=#D9E0EE guibg=none)





if exists('*term_setansicolors')
  " 0    black
  " 1    dark red
  " 2    dark green
  " 3    brown
  " 4    dark blue
  " 5    dark magenta
  " 6    dark cyan
  " 7    light grey
  " 8    dark grey
  " 9    red
  " 10   green
  " 11   yellow
  " 12   blue
  " 13   magenta
  " 14   cyan
  " 15   white

  let g:terminal_ansi_colors = [
        \ s:black,
        \ s:red,
        \ s:green,
        \ s:yellow,
        \ s:blue,
        \ s:purple,
        \ s:aqua,
        \ s:accent_6,
        \ s:accent_5,
        \ s:red,
        \ s:green,
        \ s:yellow,
        \ s:blue,
        \ s:purple,
        \ s:aqua,
        \ s:white,
        \ ]
endif
