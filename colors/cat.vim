" A static version of the catpuccin colorscheme: https://github.com/catppuccin/nvim
" Just what is generated every time in the config

set background=dark
set termguicolors

let g:colors_name = "cat"

highlight Cursor gui=NONE guifg=#1E1E2E guibg=#D9E0EE
highlight lCursor gui=NONE guifg=#1E1E2E guibg=#D9E0EE
highlight CursorIM gui=NONE guifg=#1E1E2E guibg=#D9E0EE
highlight CursorColumn gui=NONE guifg=NONE guibg=#1A1826
highlight CursorLine gui=NONE guifg=NONE guibg=#302D41
highlight Directory gui=NONE guifg=#96CDFB guibg=NONE
highlight EndOfBuffer gui=NONE guifg=#1E1E2E guibg=NONE
highlight VertSplit gui=NONE guifg=#161320 guibg=NONE
highlight Folded gui=NONE guifg=#96CDFB guibg=#575268
highlight FoldColumn gui=NONE guifg=#6E6C7E guibg=#1E1E2E
highlight SignColumn gui=NONE guifg=#575268 guibg=#1E1E2E
highlight SignColumnSB gui=NONE guifg=#575268 guibg=#161320
highlight Substitute gui=NONE guifg=#F5C2E7 guibg=#575268
highlight LineNr gui=NONE guifg=#575268 guibg=NONE
highlight CursorLineNr gui=NONE guifg=#ABE9B3 guibg=NONE
highlight MatchParen gui=bold guifg=#F8BD96 guibg=NONE
highlight ModeMsg gui=bold guifg=#D9E0EE guibg=NONE
highlight MsgArea gui=NONE guifg=#D9E0EE guibg=NONE
highlight MsgSeparator gui=NONE guifg=NONE guibg=NONE
highlight MoreMsg gui=NONE guifg=#96CDFB guibg=NONE
highlight GlyphPalette9 gui=NONE guifg=#F28FAD guibg=NONE
highlight GlyphPalette7 gui=NONE guifg=#D9E0EE guibg=NONE
highlight GlyphPalette6 gui=NONE guifg=#B5E8E0 guibg=NONE
highlight GlyphPalette4 gui=NONE guifg=#96CDFB guibg=NONE
highlight GlyphPalette3 gui=NONE guifg=#FAE3B0 guibg=NONE
highlight GlyphPalette2 gui=NONE guifg=#B5E8E0 guibg=NONE
highlight GlyphPalette1 gui=NONE guifg=#F28FAD guibg=NONE
highlight healthWarning gui=NONE guifg=#FAE3B0 guibg=NONE
highlight healthSuccess gui=NONE guifg=#B5E8E0 guibg=NONE
highlight healthError gui=NONE guifg=#F28FAD guibg=NONE
highlight DiffText gui=NONE guifg=#96CDFB guibg=#1E1E2E
highlight DiffDelete gui=NONE guifg=#F28FAD guibg=#1E1E2E
highlight DiffChange gui=NONE guifg=#FAE3B0 guibg=#1E1E2E
highlight DiffAdd gui=NONE guifg=#ABE9B3 guibg=#1E1E2E
highlight diffIndexLine gui=NONE guifg=#F5C2E7 guibg=NONE
highlight diffLine gui=NONE guifg=#6E6C7E guibg=NONE
highlight diffFile gui=NONE guifg=#96CDFB guibg=NONE
highlight WildMenu gui=NONE guifg=NONE guibg=#6E6C7E
highlight diffOldFile gui=NONE guifg=#FAE3B0 guibg=NONE
highlight diffChanged gui=NONE guifg=#FAE3B0 guibg=NONE
highlight diffRemoved gui=NONE guifg=#F28FAD guibg=NONE
highlight diffAdded gui=NONE guifg=#ABE9B3 guibg=NONE
highlight Type gui=NONE guifg=#96CDFB guibg=NONE
highlight SpecialKey gui=NONE guifg=#D9E0EE guibg=NONE
highlight QuickFixLine gui=bold guifg=NONE guibg=#575268
highlight NonText gui=NONE guifg=#6E6C7E guibg=NONE
highlight WarningMsg gui=NONE guifg=#FAE3B0 guibg=NONE
highlight Comment gui=italic guifg=#6E6C7E guibg=NONE
highlight Function gui=italic guifg=#96CDFB guibg=NONE
highlight ErrorMsg gui=bold,italic guifg=#F28FAD guibg=NONE
highlight NormalNC gui=NONE guifg=#D9E0EE guibg=#1E1E2E
highlight NormalSB gui=NONE guifg=#D9E0EE guibg=#161320
highlight NormalFloat gui=NONE guifg=#D9E0EE guibg=#1A1826
highlight FloatBorder gui=NONE guifg=#96CDFB guibg=NONE
highlight Pmenu gui=NONE guifg=#C3BAC6 guibg=#302D41
highlight Keyword gui=italic guifg=#F5C2E7 guibg=NONE
highlight PmenuSel gui=bold guifg=#D9E0EE guibg=#575268
highlight PmenuSbar gui=NONE guifg=NONE guibg=#575268
highlight PmenuThumb gui=NONE guifg=NONE guibg=#6E6C7E
highlight Question gui=NONE guifg=#96CDFB guibg=NONE
highlight Boolean gui=NONE guifg=#F8BD96 guibg=NONE
highlight Search gui=bold guifg=#F5C2E7 guibg=#575268
highlight IncSearch gui=NONE guifg=#575268 guibg=#F5C2E7
highlight Constant gui=NONE guifg=#F8BD96 guibg=NONE
highlight SpellBad gui=undercurl guifg=NONE guibg=NONE guisp=#F28FAD
highlight PreProc gui=NONE guifg=#F5C2E7 guibg=NONE
highlight SpellCap gui=undercurl guifg=NONE guibg=NONE guisp=#FAE3B0
highlight SpellLocal gui=undercurl guifg=NONE guibg=NONE guisp=#96CDFB
highlight SpellRare gui=undercurl guifg=NONE guibg=NONE guisp=#ABE9B3
highlight StatusLine gui=NONE guifg=#D9E0EE guibg=#1A1826
highlight StatusLineNC gui=NONE guifg=#575268 guibg=#1A1826
highlight TabLine gui=NONE guifg=#575268 guibg=#1A1826
highlight TabLineFill gui=NONE guifg=NONE guibg=NONE
highlight TabLineSel gui=NONE guifg=#ABE9B3 guibg=#575268
highlight Title gui=bold guifg=#96CDFB guibg=NONE
highlight Visual gui=bold guifg=NONE guibg=#575268
highlight VisualNOS gui=bold guifg=NONE guibg=#575268
highlight Whitespace gui=NONE guifg=#575268 guibg=NONE
highlight Normal gui=NONE guifg=#D9E0EE guibg=#1E1E2E
highlight Character gui=NONE guifg=#B5E8E0 guibg=NONE
highlight Underlined gui=underline guifg=NONE guibg=NONE
highlight Float gui=NONE guifg=#F8BD96 guibg=NONE
highlight Identifier gui=italic guifg=#F2CDCD guibg=NONE
highlight Error gui=NONE guifg=#F28FAD guibg=NONE
highlight Statement gui=NONE guifg=#DDB6F2 guibg=NONE
highlight Number gui=NONE guifg=#F8BD96 guibg=NONE
highlight Conditional gui=NONE guifg=#F28FAD guibg=NONE
highlight Repeat gui=NONE guifg=#F28FAD guibg=NONE
highlight Label gui=NONE guifg=#F8BD96 guibg=NONE
highlight Operator gui=NONE guifg=#89DCEB guibg=NONE
highlight Include gui=NONE guifg=#F5C2E7 guibg=NONE
highlight StorageClass gui=NONE guifg=#FAE3B0 guibg=NONE
highlight Structure gui=NONE guifg=#FAE3B0 guibg=NONE
highlight Typedef gui=NONE guifg=#FAE3B0 guibg=NONE
highlight Special gui=NONE guifg=#F5C2E7 guibg=NONE
highlight String gui=NONE guifg=#ABE9B3 guibg=NONE
highlight Bold gui=bold guifg=NONE guibg=NONE
highlight Italic gui=italic guifg=NONE guibg=NONE
highlight Todo gui=bold guifg=#1E1E2E guibg=#FAE3B0
highlight qfLineNr gui=NONE guifg=#FAE3B0 guibg=NONE
highlight qfFileName gui=NONE guifg=#96CDFB guibg=NONE
highlight htmlH1 gui=bold guifg=#F5C2E7 guibg=NONE
highlight htmlH2 gui=bold guifg=#96CDFB guibg=NONE
highlight mkdCodeDelimiter gui=NONE guifg=#D9E0EE guibg=#1E1E2E
highlight mkdCodeStart gui=bold guifg=#F2CDCD guibg=NONE
highlight mkdCodeEnd gui=bold guifg=#F2CDCD guibg=NONE
highlight debugPC gui=NONE guifg=NONE guibg=#161320
highlight debugBreakpoint gui=NONE guifg=#6E6C7E guibg=#1E1E2E
highlight illuminatedWord gui=NONE guifg=NONE guibg=#575268
highlight illuminatedCurWord gui=NONE guifg=NONE guibg=#575268
highlight ColorColumn gui=NONE guifg=NONE guibg=#302D41
highlight diffNewFile gui=NONE guifg=#F8BD96 guibg=NONE
highlight Conceal gui=NONE guifg=#988BA2 guibg=NONE
highlight TSException gui=italic guifg=#F8BD96 guibg=NONE
highlight TSConstBuiltin gui=italic guifg=#C9CBFF guibg=NONE
highlight TSFuncBuiltin gui=italic guifg=#F8BD96 guibg=NONE
highlight TSTypeBuiltin gui=italic guifg=#FAE3B0 guibg=NONE
highlight TSFuncMacro gui=NONE guifg=#F28FAD guibg=NONE
highlight TSKeywordFunction gui=italic guifg=#E8A2AF guibg=NONE
highlight TSKeyword gui=italic guifg=#F28FAD guibg=NONE
highlight TSKeywordReturn gui=NONE guifg=#F5C2E7 guibg=NONE
highlight TSNote gui=NONE guifg=#1E1E2E guibg=#96CDFB
highlight TSWarning gui=NONE guifg=#1E1E2E guibg=#FAE3B0
highlight TSDanger gui=NONE guifg=#1E1E2E guibg=#F28FAD
highlight TSLabel gui=NONE guifg=#96CDFB guibg=NONE
highlight TSNamespace gui=italic guifg=#F5E0DC guibg=NONE
highlight tomlTSProperty gui=NONE guifg=#96CDFB guibg=NONE
highlight TSPunctDelimiter gui=NONE guifg=#B5E8E0 guibg=NONE
highlight TSPunctBracket gui=NONE guifg=#988BA2 guibg=NONE
highlight TSString gui=NONE guifg=#ABE9B3 guibg=NONE
highlight TSStringRegex gui=NONE guifg=#F8BD96 guibg=NONE
highlight TSType gui=NONE guifg=#FAE3B0 guibg=NONE
highlight TSVariable gui=italic guifg=#D9E0EE guibg=NONE
highlight TSTagAttribute gui=italic guifg=#DDB6F2 guibg=NONE
highlight TSTag gui=NONE guifg=#F8BD96 guibg=NONE
highlight TSTagDelimiter gui=NONE guifg=#E8A2AF guibg=NONE
highlight TSText gui=NONE guifg=#D9E0EE guibg=NONE
highlight TSURI gui=italic,underline guifg=#F5E0DC guibg=NONE
highlight TSLiteral gui=italic guifg=#B5E8E0 guibg=NONE
highlight TSTextReference gui=bold guifg=#C9CBFF guibg=NONE
highlight TSTitle gui=bold guifg=#96CDFB guibg=NONE
highlight TSEmphasis gui=italic guifg=#E8A2AF guibg=NONE
highlight TSStrong gui=bold guifg=#E8A2AF guibg=NONE
highlight TSStringEscape gui=NONE guifg=#F5C2E7 guibg=NONE
highlight bashTSFuncBuiltin gui=italic guifg=#F28FAD guibg=NONE
highlight bashTSParameter gui=italic guifg=#FAE3B0 guibg=NONE
highlight luaTSField gui=NONE guifg=#C9CBFF guibg=NONE
highlight luaTSConstructor gui=NONE guifg=#F2CDCD guibg=NONE
highlight javaTSConstant gui=NONE guifg=#B5E8E0 guibg=NONE
highlight typescriptTSProperty gui=italic guifg=#C9CBFF guibg=NONE
highlight cssTSType gui=NONE guifg=#C9CBFF guibg=NONE
highlight cssTSProperty gui=italic guifg=#FAE3B0 guibg=NONE
highlight cppTSProperty gui=NONE guifg=#D9E0EE guibg=NONE
highlight BufferLineFill gui=NONE guifg=NONE guibg=#161320
highlight BufferLineBackground gui=NONE guifg=#D9E0EE guibg=#1A1826
highlight BufferLineBufferVisible gui=NONE guifg=#575268 guibg=#1A1826
highlight BufferLineBufferSelected gui=bold,italic guifg=#D9E0EE guibg=#1E1E2E
highlight BufferLineTab gui=NONE guifg=#575268 guibg=#1E1E2E
highlight BufferLineTabSelected gui=NONE guifg=#F28FAD guibg=#96CDFB
highlight BufferLineTabClose gui=NONE guifg=#F28FAD guibg=#1A1826
highlight BufferLineIndicatorSelected gui=NONE guifg=#F8BD96 guibg=#1E1E2E
highlight BufferLineSeparator gui=NONE guifg=#1A1826 guibg=#1A1826
highlight BufferLineSeparatorVisible gui=NONE guifg=#1A1826 guibg=#1A1826
highlight BufferLineSeparatorSelected gui=NONE guifg=#1A1826 guibg=#1A1826
highlight BufferLineCloseButton gui=NONE guifg=#575268 guibg=#1A1826
highlight BufferLineCloseButtonVisible gui=NONE guifg=#575268 guibg=#1A1826
highlight BufferLineCloseButtonSelected gui=NONE guifg=#F28FAD guibg=#1E1E2E
highlight GitSignsAdd gui=NONE guifg=#ABE9B3 guibg=#1E1E2E
highlight tkLink gui=NONE guifg=#96CDFB guibg=NONE
highlight tkBrackets gui=NONE guifg=#F5C2E7 guibg=NONE
highlight GitSignsDelete gui=NONE guifg=#F28FAD guibg=#1E1E2E
highlight FocusedSymbol gui=NONE guifg=#FAE3B0 guibg=#1E1E2E
highlight NotifyERRORBorder gui=NONE guifg=#F28FAD guibg=NONE
highlight NotifyERRORIcon gui=NONE guifg=#F28FAD guibg=NONE
highlight NotifyERRORTitle gui=italic guifg=#F28FAD guibg=NONE
highlight NotifyWARNBorder gui=NONE guifg=#FAE3B0 guibg=NONE
highlight NotifyWARNIcon gui=NONE guifg=#FAE3B0 guibg=NONE
highlight NotifyWARNTitle gui=italic guifg=#FAE3B0 guibg=NONE
highlight NotifyINFOBorder gui=NONE guifg=#96CDFB guibg=NONE
highlight NotifyINFOIcon gui=NONE guifg=#96CDFB guibg=NONE
highlight NotifyINFOTitle gui=italic guifg=#96CDFB guibg=NONE
highlight NotifyDEBUGBorder gui=NONE guifg=#F8BD96 guibg=NONE
highlight NotifyDEBUGIcon gui=NONE guifg=#F8BD96 guibg=NONE
highlight NotifyDEBUGTitle gui=italic guifg=#F8BD96 guibg=NONE
highlight NotifyTRACEBorder gui=NONE guifg=#F5E0DC guibg=NONE
highlight NotifyTRACEIcon gui=NONE guifg=#F5E0DC guibg=NONE
highlight NotifyTRACETitle gui=italic guifg=#F5E0DC guibg=NONE
highlight NvimTreeFolderName gui=NONE guifg=#96CDFB guibg=NONE
highlight NvimTreeFolderIcon gui=NONE guifg=#96CDFB guibg=NONE
highlight NvimTreeNormal gui=NONE guifg=#D9E0EE guibg=#1A1826
highlight NvimTreeOpenedFolderName gui=NONE guifg=#96CDFB guibg=NONE
highlight NvimTreeEmptyFolderName gui=NONE guifg=#96CDFB guibg=NONE
highlight NvimTreeIndentMarker gui=NONE guifg=#6E6C7E guibg=NONE
highlight NvimTreeVertSplit gui=NONE guifg=#1E1E2E guibg=#1E1E2E
highlight NvimTreeRootFolder gui=bold guifg=#F5C2E7 guibg=NONE
highlight NvimTreeSymlink gui=NONE guifg=#F5C2E7 guibg=NONE
highlight NvimTreeStatuslineNc gui=NONE guifg=#1A1826 guibg=#1A1826
highlight NvimTreeGitDirty gui=NONE guifg=#FAE3B0 guibg=NONE
highlight NvimTreeGitNew gui=NONE guifg=#96CDFB guibg=NONE
highlight NvimTreeGitDeleted gui=NONE guifg=#F28FAD guibg=NONE
highlight NvimTreeSpecialFile gui=NONE guifg=#F2CDCD guibg=NONE
highlight NvimTreeImageFile gui=NONE guifg=#D9E0EE guibg=NONE
highlight NvimTreeOpenedFile gui=NONE guifg=#F5C2E7 guibg=NONE
highlight CmpItemAbbr gui=NONE guifg=#C3BAC6 guibg=NONE
highlight CmpItemAbbrDeprecated gui=strikethrough guifg=#6E6C7E guibg=NONE
highlight CmpItemKind gui=NONE guifg=#96CDFB guibg=NONE
highlight CmpItemMenu gui=NONE guifg=#D9E0EE guibg=NONE
highlight CmpItemAbbrMatch gui=bold guifg=#D9E0EE guibg=NONE
highlight CmpItemAbbrMatchFuzzy gui=bold guifg=#D9E0EE guibg=NONE
highlight CmpItemKindSnippet gui=NONE guifg=#DDB6F2 guibg=NONE
highlight CmpItemKindKeyword gui=NONE guifg=#F28FAD guibg=NONE
highlight CmpItemKindText gui=NONE guifg=#B5E8E0 guibg=NONE
highlight CmpItemKindMethod gui=NONE guifg=#96CDFB guibg=NONE
highlight CmpItemKindConstructor gui=NONE guifg=#96CDFB guibg=NONE
highlight CmpItemKindFunction gui=NONE guifg=#96CDFB guibg=NONE
highlight CmpItemKindFolder gui=NONE guifg=#96CDFB guibg=NONE
highlight CmpItemKindModule gui=NONE guifg=#96CDFB guibg=NONE
highlight CmpItemKindConstant gui=NONE guifg=#F8BD96 guibg=NONE
highlight CmpItemKindField gui=NONE guifg=#ABE9B3 guibg=NONE
highlight CmpItemKindProperty gui=NONE guifg=#ABE9B3 guibg=NONE
highlight CmpItemKindEnum gui=NONE guifg=#ABE9B3 guibg=NONE
highlight CmpItemKindUnit gui=NONE guifg=#ABE9B3 guibg=NONE
highlight CmpItemKindClass gui=NONE guifg=#FAE3B0 guibg=NONE
highlight CmpItemKindVariable gui=NONE guifg=#F2CDCD guibg=NONE
highlight CmpItemKindFile gui=NONE guifg=#96CDFB guibg=NONE
highlight TSConstant gui=NONE guifg=#F8BD96 guibg=NONE
highlight TSField gui=NONE guifg=#F5E0DC guibg=NONE
highlight TSFunction gui=italic guifg=#96CDFB guibg=NONE
highlight TSMethod gui=italic guifg=#96CDFB guibg=NONE
highlight TSParameter gui=italic guifg=#F5E0DC guibg=NONE
highlight TSProperty gui=italic guifg=#FAE3B0 guibg=NONE
highlight TSVariableBuiltin gui=italic guifg=#B5E8E0 guibg=NONE
highlight LspReferenceText gui=NONE guifg=NONE guibg=#575268
highlight LspReferenceRead gui=NONE guifg=NONE guibg=#575268
highlight LspReferenceWrite gui=NONE guifg=NONE guibg=#575268
highlight DiagnosticError gui=italic guifg=#F28FAD guibg=NONE
highlight DiagnosticWarn gui=italic guifg=#FAE3B0 guibg=NONE
highlight DiagnosticInfo gui=italic guifg=#89DCEB guibg=NONE
highlight DiagnosticHint gui=italic guifg=#F5E0DC guibg=NONE
highlight DiagnosticUnderlineError gui=underline guifg=NONE guibg=NONE guisp=#F28FAD
highlight DiagnosticUnderlineWarn gui=underline guifg=NONE guibg=NONE guisp=#FAE3B0
highlight DiagnosticUnderlineInfo gui=underline guifg=NONE guibg=NONE guisp=#89DCEB
highlight DiagnosticUnderlineHint gui=underline guifg=NONE guibg=NONE guisp=#F5E0DC
highlight LspDiagnosticsDefaultError gui=NONE guifg=#F28FAD guibg=NONE
highlight LspDiagnosticsDefaultWarning gui=NONE guifg=#FAE3B0 guibg=NONE
highlight LspDiagnosticsDefaultInformation gui=NONE guifg=#89DCEB guibg=NONE
highlight LspDiagnosticsDefaultHint gui=NONE guifg=#F5E0DC guibg=NONE
highlight LspSignatureActiveParameter gui=NONE guifg=#F8BD96 guibg=NONE
highlight LspDiagnosticsError gui=NONE guifg=#F28FAD guibg=NONE
highlight LspDiagnosticsWarning gui=NONE guifg=#FAE3B0 guibg=NONE
highlight LspDiagnosticsInformation gui=NONE guifg=#89DCEB guibg=NONE
highlight LspDiagnosticsHint gui=NONE guifg=#F5E0DC guibg=NONE
highlight LspDiagnosticsVirtualTextError gui=italic guifg=#F28FAD guibg=NONE
highlight CmpItemKindInterface gui=NONE guifg=#FAE3B0 guibg=NONE
highlight LspDiagnosticsVirtualTextInformation gui=italic guifg=#89DCEB guibg=NONE
highlight CmpItemKindReference gui=NONE guifg=#F28FAD guibg=NONE
highlight CmpItemKindEnumMember gui=NONE guifg=#F28FAD guibg=NONE
highlight LspDiagnosticsUnderlineWarning gui=underline guifg=NONE guibg=NONE guisp=#FAE3B0
highlight CmpItemKindValue gui=NONE guifg=#F8BD96 guibg=NONE
highlight CmpItemKindEvent gui=NONE guifg=#96CDFB guibg=NONE
highlight LspCodeLens gui=NONE guifg=#6E6C7E guibg=NONE
highlight CmpItemKindTypeParameter gui=NONE guifg=#96CDFB guibg=NONE
highlight DashboardShortCut gui=NONE guifg=#F5C2E7 guibg=NONE
highlight DashboardHeader gui=NONE guifg=#96CDFB guibg=NONE
highlight DashboardCenter gui=NONE guifg=#ABE9B3 guibg=NONE
highlight DashboardFooter gui=italic guifg=#FAE3B0 guibg=NONE
highlight TelescopeMatching gui=NONE guifg=#96CDFB guibg=NONE
highlight TelescopeBorder gui=NONE guifg=#96CDFB guibg=NONE
highlight markdownCode gui=NONE guifg=#F2CDCD guibg=NONE
highlight markdownCodeBlock gui=NONE guifg=#F2CDCD guibg=NONE
highlight markdownLinkText gui=underline guifg=#96CDFB guibg=NONE
highlight markdownH1 gui=NONE guifg=#C9CBFF guibg=NONE
highlight markdownH2 gui=NONE guifg=#DDB6F2 guibg=NONE
highlight markdownH3 gui=NONE guifg=#ABE9B3 guibg=NONE
highlight markdownH4 gui=NONE guifg=#FAE3B0 guibg=NONE
highlight markdownH5 gui=NONE guifg=#F5C2E7 guibg=NONE
highlight markdownH6 gui=NONE guifg=#B5E8E0 guibg=NONE
highlight TelescopeSelectionCaret gui=NONE guifg=#F2CDCD guibg=NONE
highlight TelescopeSelection gui=bold guifg=#D9E0EE guibg=#302D41
highlight markdownHeadingDelimiter gui=bold guifg=#F8BD96 guibg=NONE
highlight CmpItemKindColor gui=NONE guifg=#F28FAD guibg=NONE
highlight tkTag gui=NONE guifg=#89DCEB guibg=NONE
highlight LspDiagnosticsUnderlineInformation gui=underline guifg=NONE guibg=NONE guisp=#89DCEB
highlight LspDiagnosticsUnderlineHint gui=underline guifg=NONE guibg=NONE guisp=#F5E0DC
highlight CmpItemKindOperator gui=NONE guifg=#96CDFB guibg=NONE
highlight LspDiagnosticsUnderlineError gui=underline guifg=NONE guibg=NONE guisp=#F28FAD
highlight IndentBlanklineChar gui=NONE guifg=#302D41 guibg=NONE
highlight IndentBlanklineContextChar gui=NONE guifg=#D9E0EE guibg=NONE
highlight GitSignsChange gui=NONE guifg=#FAE3B0 guibg=#1E1E2E
highlight LspDiagnosticsVirtualTextWarning gui=italic guifg=#FAE3B0 guibg=NONE
highlight LspDiagnosticsVirtualTextHint gui=italic guifg=#F5E0DC guibg=NONE
highlight CmpItemKindStruct gui=NONE guifg=#96CDFB guibg=NONE
highlight TSInclude gui=italic guifg=#B5E8E0 guibg=NONE
highlight TSOperator gui=bold guifg=#89DCEB guibg=NONE
highlight TSKeywordOperator gui=bold guifg=#89DCEB guibg=NONE
highlight TSPunctSpecial gui=bold guifg=#E8A2AF guibg=NONE
highlight TSFloat gui=bold,italic guifg=#F8BD96 guibg=NONE
highlight TSNumber gui=bold,italic guifg=#F8BD96 guibg=NONE
highlight TSBoolean gui=bold,italic guifg=#F8BD96 guibg=NONE
highlight TSConstructor gui=NONE guifg=#C9CBFF guibg=NONE
highlight TSConditional gui=bold guifg=#DDB6F2 guibg=NONE
highlight TSRepeat gui=bold guifg=#DDB6F2 guibg=NONE