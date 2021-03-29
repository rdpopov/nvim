"color preset
set background=dark

let g:prefered_browser = "brave-browser"
let g:lang = ['english','bulgarian-phonetic']

" Basic editor settings
source $HOME/.config/nvim/configs/settings.vim
" My homeprew functions separated in files
source $HOME/.config/nvim/functions/incl.vim
" Basic config for other plgins
source $HOME/.config/nvim/configs/basic.vim
" Window managment for fo vim (currnetly only resizing)
source $HOME/.config/nvim/functions/incl.vim
" Netrw config
source $HOME/.config/nvim/configs/netrw.vim
" Auto commnds
source $HOME/.config/nvim/configs/auto.vim
" Snippets  (currently unused)
source $HOME/.config/nvim/snippets/snippets.vim
" Commands and mappings
source $HOME/.config/nvim/configs/cmd.vim
"Homebrew Statusline and colors
source $HOME/.config/nvim/configs/colors.vim
