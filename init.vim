"color preset
set background=dark

let g:prefered_browser = "brave-browser"
let g:lang = ['english','bulgarian-phonetic']
if exists('$WORK')
	let g:plug_mode = ["git","qof"]
else
	let g:plug_mode = ["all","tree","navigator"]
endif


" Basic editor settings
source $HOME/.config/nvim/configs/settings.vim
" My homeprew functions separated in files
source $HOME/.config/nvim/functions/incl.vim
" Basic config for other plgins
source $HOME/.config/nvim/configs/basic.vim
" Auto commnds
source $HOME/.config/nvim/configs/auto.vim
" No nerdtree. CHAD tree
source $HOME/.config/nvim/configs/netrw.vim
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
" Native Lsp completion
if !exists('$WORK')
source $HOME/.config/nvim/configs/nvim_lsp.vim
" Native Lsp completion
source $HOME/.config/nvim/configs/treesitter.vim
endif
