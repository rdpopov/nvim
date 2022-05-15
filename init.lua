vim.o.background="dark"
vim.g.lang = {'english','bulgarian-phonetic'}
vim.g.rustc_makeprg_no_percent = 0
vim.g.cargo_makeprg_params = 'run'

require("cfg_performance")
require("cfg_settings")
vim.cmd "source $HOME/.config/nvim/functions/incl.vim"
vim.cmd "source $HOME/.config/nvim/configs/port_to_lua.vim"
require("cfg_autocmd")
require("pacs")
require("cfg_navigation")
require("cfg_notes")
require("cfg_commands")
require("cfg_colors")
require("cfg_nvimlsp")

