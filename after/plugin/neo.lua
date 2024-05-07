local opts = {noremap = true, silent = true}
local keymap = vim.api.nvim_set_keymap
vim.g.mapleader = ' '

-- require('neogen').setup({ snippet_engine = "vsnip" })

vim.api.nvim_set_keymap("n", "<Leader>nF", ":Neogen file<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>nf", ":Neogen func<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>nc", ":Neogen class<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>nt", ":Neogen type<CR>", opts)
