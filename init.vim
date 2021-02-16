"color preset
set background=dark

colorscheme aurora
let status_line = "embark"

let configs_folder = "$HOME/.config/nvim/configs/"
let snippets_folder = "$HOME/.config/nvim/snippets/"
"basic editor settings
exec "source ". configs_folder ."settings.vim"
"commands and mappings
exec "source ". configs_folder ."cmd.vim"
"basic config for other plugins
exec "source ". configs_folder ."basic.vim"
"Vimlsp + asynccomplete + coc
exec "source ". configs_folder ."coc.vim"
"Auto commnds
exec "source ". configs_folder ."auto.vim"
"Ale setup
exec "source ". configs_folder ."linter.vim"
"netrw config like nerdtree not as flashy but fast af
exec "source ". configs_folder ."netrw.vim"
"Fzf & Rg configs
exec "source ". configs_folder ."fzf.vim"
"Statusline and colors
exec "source ". configs_folder ."colors.vim"
"Plugins
exec "source ". configs_folder ."plugs.vim"
"Snippets  (currently unused)
exec "source ". snippets_folder ."snippets.vim"
