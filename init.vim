source $HOME/.config/nvim/configs/settings.vim          "basic editor settings

source $HOME/.config/nvim/configs/cmd.vim               "commands and mappings

source $HOME/.config/nvim/configs/basic.vim             "basic config for other plugins

source $HOME/.config/nvim/configs/coc.vim               "Vimlsp + asynccomplete + coc

source $HOME/.config/nvim/configs/auto.vim              "Auto commnds

source $HOME/.config/nvim/configs/fzf.vim               "Fzf & Rg configs

source $HOME/.config/nvim/snippets/snippets.vim         "Snippets  (currently unused)

source $HOME/.config/nvim/configs/plugs.vim             "Plugins

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

"===============================================================
"gruvbox colors
"set background=dark
"colorscheme base16-gruvbox-dark-hard
"===============================================================
"tokyo night 
"let g:tokyonight_style = 'night' " available: night, storm
"let g:tokyonight_enable_italic = 1
"colorscheme tokyonight
"===============================================================
"for colorsceheme from github photo
"colorscheme aurora
"let g:airline_theme='embark'
colorscheme srcery
