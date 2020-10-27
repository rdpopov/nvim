source $HOME/.config/nvim/configs/settings.vim          "basic editor settings

source $HOME/.config/nvim/configs/cmd.vim               "commands and mappings

source $HOME/.config/nvim/configs/basic.vim             "basic config for other plugins

source $HOME/.config/nvim/configs/lsp_and_compl.vim     "Vimlsp + asynccomplete

source $HOME/.config/nvim/configs/linter.vim            "Ale setup

source $HOME/.config/nvim/configs/auto.vim              "Auto commnds

source $HOME/.config/nvim/configs/fzf.vim               "Fzf & Rg configs

source $HOME/.config/nvim/snippets/snippets.vim         "Snippets

source $HOME/.config/nvim/configs/plugs.vim             "Plugins

source $HOME/.config/nvim/configs/nerdtree.vim             "Plugins

if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif


"let g:onedark_termcolors=256

"if (has("autocmd"))
"  augroup colorextend
"    autocmd!
"    " Make `Function`s bold in GUI mode
"    autocmd ColorScheme * call onedark#extend_highlight("Function", { "gui": "bold" })
"    " Override the `Statement` foreground color in 256-color mode
"    autocmd ColorScheme * call onedark#extend_highlight("Statement", { "fg": { "cterm": 128 } })
"    " Override the `Identifier` background color in GUI mode
"    autocmd ColorScheme * call onedark#extend_highlight("Identifier", { "bg": { "gui": "#333333" } })
"  augroup END
"endif
"let g:onedark_color_overrides = {
"    \ "black": {"gui": "#101010", "cterm": "235", "cterm16": "0" },
"    \ "purple": { "gui": "#C678DF", "cterm": "170", "cterm16": "5" }
"\}
"
"let g:onedark_terminal_italics = 1

set background=dark
colorscheme tender

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

let g:airline_theme='tender'

