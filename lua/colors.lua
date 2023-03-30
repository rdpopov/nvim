vim.cmd "colorscheme duskfox"
vim.o.laststatus = 2
vim.o.showmode = false
require('utils/status').set_statusline()

require'nvim-treesitter.configs'.setup {
ensure_installed = { "c","cpp","python","javascript","rust","bash","go","vim","json","dockerfile","html","lua"} , -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,  -- false will disable the whole extension
    disable = { "nim" },  -- list of language that will be disabled
  },
  context_commentstring = {
      enable = true,
  },
}
-- dashboard
-- require('dash.dash')
