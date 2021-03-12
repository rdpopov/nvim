"color preset
set background=dark

let g:lang = ['english','bulgarian-phonetic']

"basic editor settings
source $HOME/.config/nvim/configs/settings.vim
"basic config for other plugins
source $HOME/.config/nvim/configs/basic.vim
"window managment for fo vim (currnetly only resizing)
source $HOME/.config/nvim/configs/wm.vim
"Language input for vim
source $HOME/.config/nvim/configs/lang.vim
"Auto commnds
source $HOME/.config/nvim/configs/auto.vim
"no nerdtree. CHAD tree
source $HOME/.config/nvim/configs/chad.vim
"Fzf & Rg configs
source $HOME/.config/nvim/configs/fzf.vim
"Plugins
source $HOME/.config/nvim/configs/plugs.vim
"Snippets  (currently unused)
source $HOME/.config/nvim/snippets/snippets.vim
"commands and mappings
source $HOME/.config/nvim/configs/cmd.vim
"Statusline and colors
source $HOME/.config/nvim/configs/colors.vim
" Native Lsp completion
source $HOME/.config/nvim/configs/nvim_lsp.vim
