set background=dark

let g:prefered_browser = "brave-browser"
let g:lang = ['english','bulgarian-phonetic']

let g:rustc_makeprg_no_percent = 0
let g:cargo_makeprg_params = 'run'

" Basic editor settings
source $HOME/.config/nvim/configs/settings.vim
" My homeprew functions separated in files
source $HOME/.config/nvim/functions/incl.vim
" Auto commnds
source $HOME/.config/nvim/configs/auto.vim
" Plgins
source $HOME/.config/nvim/configs/plugs.vim
" Git client config
source $HOME/.config/nvim/configs/git.vim
" Navigation utils
source $HOME/.config/nvim/configs/navigation.vim
" Snippets  (currently unused)
source $HOME/.config/nvim/snippets/snippets.vim
" Commands and mappings
source $HOME/.config/nvim/configs/cmd.vim
"Homebrew Statusline and colors and colorizer
source $HOME/.config/nvim/configs/colors.vim 
" Native Lsp, navigator, nvim compe adn treesitter
source $HOME/.config/nvim/configs/nvim_lsp.vim
