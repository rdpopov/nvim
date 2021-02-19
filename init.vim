"color preset
set background=dark

colorscheme aurora
let status_line = "embark"

let configs_folder = "$HOME/.config/nvim/configs/"
let snippets_folder = "$HOME/.config/nvim/snippets/"
"basic editor settings
exec "source ". configs_folder ."settings.vim"
"basic config for other plugins
exec "source ". configs_folder ."basic.vim"
"window managment for fo vim (currnetly only resizing)
exec "source ". configs_folder ."wm.vim"
"Vimlsp + asynccomplete + coc
exec "source ". configs_folder ."coc.vim"
"Auto commnds
exec "source ". configs_folder ."auto.vim"
"Ale setup
exec "source ". configs_folder ."linter.vim"
"no nerdtree. CHAD tree
exec "source ". configs_folder ."chad.vim"
"Fzf & Rg configs
exec "source ". configs_folder ."fzf.vim"
"Statusline and colors
exec "source ". configs_folder ."colors.vim"
"Plugins
exec "source ". configs_folder ."plugs.vim"
"Snippets  (currently unused)
exec "source ". snippets_folder ."snippets.vim"
"commands and mappings
exec "source ". configs_folder ."cmd.vim"
