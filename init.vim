source $HOME/.config/nvim/configs/settings.vim          "basic editor settings

source $HOME/.config/nvim/configs/cmd.vim               "commands and mappings

source $HOME/.config/nvim/configs/basic.vim             "basic config for other plugins

source $HOME/.config/nvim/configs/coc.vim     "Vimlsp + asynccomplete

source $HOME/.config/nvim/configs/linter.vim            "Ale setup

source $HOME/.config/nvim/configs/auto.vim              "Auto commnds

source $HOME/.config/nvim/configs/fzf.vim               "Fzf & Rg configs

source $HOME/.config/nvim/snippets/snippets.vim         "Snippets

source $HOME/.config/nvim/configs/plugs.vim             "Plugins

source $HOME/.config/nvim/configs/nerdtree.vim             "Plugins

if (empty($TMUX))
  if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif



let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

set background=dark
colorscheme aurora
let g:airline_theme='embark'
