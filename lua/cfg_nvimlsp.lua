vim.o.pumheight=16

vim.cmd "hi link LspDiagnosticsDefaultError Error"
vim.cmd "hi link LspDiagnosticsDefaultWarning Todo"
vim.cmd "hi link LspDiagnosticsDefaultInformation Normal"
vim.cmd "hi link LspDiagnosticsDefaultHint Normal"

local opts = {noremap = true, silent = true}
local cfg_utils = require("cfg_utils")
local keymap = vim.api.nvim_set_keymap
vim.g.mapleader = ' '

keymap('n','<leader>d', '',{callback= cfg_utils.diagn_toggle, noremap = true, silent = true})
keymap('n','gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>',opts)
keymap('n','gd', '<Cmd>lua vim.lsp.buf.definition()<CR>',opts)
keymap('n','K', '<Cmd>lua vim.lsp.buf.hover()<CR>',opts)
keymap('n','rn', '<cmd>lua vim.lsp.buf.rename()<CR>',opts)
keymap('n','gca', '<cmd>lua vim.lsp.buf.code_action()<CR>',opts)
keymap('n','gr', ':Telescope lsp_references theme=get_ivy<CR>',opts)
keymap('n','[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>',opts)
keymap('n',']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>',opts)

vim.g.slime_target = "neovim"

require('cmp_conf')
require('treesitter_conf')
require('aerial_conf')
