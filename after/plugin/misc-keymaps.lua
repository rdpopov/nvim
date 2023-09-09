local opts = {noremap = true, silent = true}
local keymap = vim.api.nvim_set_keymap
vim.g.mapleader = ' '
-- Undotree
keymap('n','<Leader>u', ':UndotreeToggle<cr>',opts)
-- EasyAlign
keymap('v','<Leader>a', ':EasyAlign<cr>',{noremap = true})
-- DirDiff
keymap('n','<leader>dn', '<cmd>DirDiffNext<CR>',opts)
keymap('n','<leader>dp', '<cmd DirDiffPrev<CR>',opts)
