require("harpoon").setup({
    menu = {
        width = vim.api.nvim_win_get_width(0)/2,
    }
})
local ui = require("harpoon.ui")
local mark = require("harpoon.mark")
local keymap = vim.api.nvim_set_keymap
vim.g.mapleader = ' '

keymap('n','<Leader>h', '',{callback = function() ui.toggle_quick_menu() end ,noremap = true, silent = true, desc = "Harpoon open quick menu"})
keymap('n','<Leader>H', '',{callback = function() mark.add_file() end ,noremap = true, silent = true, desc = "Harpoon add file"})
keymap('n','<Leader>j', '',{callback = function()  ui.nav_file(1) end ,noremap = true, silent = true, desc = "Harpoon open file 1"})
keymap('n','<Leader>k', '',{callback = function()  ui.nav_file(2) end ,noremap = true, silent = true, desc = "Harpoon open file 2"})
keymap('n','<Leader>l', '',{callback = function()  ui.nav_file(3) end ,noremap = true, silent = true, desc = "Harpoon open file 3"})
keymap('n','<Leader>\'', '',{callback = function() ui.nav_file(4) end ,noremap = true, silent = true, desc = "Harpoon open file 4"})
