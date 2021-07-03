"color preset
set background=dark

let g:prefered_browser = "brave-browser"
let g:lang = ['english','bulgarian-phonetic']
let g:file_explorer = "nvim-tree"


" Basic editor settings
source $HOME/.config/nvim/configs/settings.vim
" My homeprew functions separated in files
source $HOME/.config/nvim/functions/incl.vim
" Basic config for other plgins
source $HOME/.config/nvim/configs/basic.vim
" Auto commnds
source $HOME/.config/nvim/configs/auto.vim
" tree explorer
if g:file_explorer != ''
    source $HOME/.config/nvim/configs/tree_explorer.vim
else
    source $HOME/.config/nvim/configs/netrw.vim
endif
" Fzf & Rg configs
source $HOME/.config/nvim/configs/fzf.vim
" Plgins
source $HOME/.config/nvim/configs/plugs.vim
" Snippets  (currently unused)
source $HOME/.config/nvim/snippets/snippets.vim
" Commands and mappings
source $HOME/.config/nvim/configs/cmd.vim
"Homebrew Statusline and colors
source $HOME/.config/nvim/configs/colors.vim
lua require('statusline')
"colorizer
source $HOME/.config/nvim/configs/colorizer.vim
" Native Lsp completion
if !exists('$WORK')
    source $HOME/.config/nvim/configs/nvim_lsp.vim
    " Native Lsp completion
    source $HOME/.config/nvim/configs/treesitter.vim
endif
