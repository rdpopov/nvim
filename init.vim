source $HOME/.config/nvim/configs/settings.vim          "basic editor settings

source $HOME/.config/nvim/configs/cmd.vim               "commands and mappings

source $HOME/.config/nvim/configs/basic.vim             "basic config for other plugins

source $HOME/.config/nvim/configs/lsp_and_compl.vim     "Vimlsp + asynccomplete

source $HOME/.config/nvim/configs/linter.vim            "Ale setup

source $HOME/.config/nvim/configs/plugs.vim             "Plugins

source $HOME/.config/nvim/configs/auto.vim              "Auto commnds

set t_Co=256
set termguicolors

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set background=dark    " Setting dark mode
colorscheme deus
let g:deus_termcolors=256

let g:airline_theme='wombat'
