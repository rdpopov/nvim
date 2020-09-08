source $HOME/.config/nvim/configs/settings.vim          "basic editor settings

source $HOME/.config/nvim/configs/cmd.vim               "commands and mappings

source $HOME/.config/nvim/configs/basic.vim             "basic config for other plugins

source $HOME/.config/nvim/configs/lsp_and_compl.vim     "Vimlsp + asynccomplete

source $HOME/.config/nvim/configs/linter.vim            "Ale setup

source $HOME/.config/nvim/configs/plugs.vim             "Plugins

source $HOME/.config/nvim/configs/auto.vim              "Auto commnds


source $HOME/.config/nvim/snippets/snippets.vim              "Auto commnds

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

set background=dark" for the light version
let g:one_allow_italics = 1 " I love italic for comments

colorscheme srcery  
let g:airline_theme='molokai'
