vim.pack.add({
   {src='https://github.com/nvim-lua/plenary.nvim'},
   {src='https://github.com/nvim-telescope/telescope.nvim'},
   {src='https://github.com/ThePrimeagen/harpoon'},
})

local opts = {noremap = true, silent = true}
local keymap = vim.api.nvim_set_keymap
local pth = vim.fn.stdpath('config')

vim.g.mapleader = ' '
keymap('n','<leader>t', ':Telescope<CR>',opts)
keymap('n','<leader>tt', ':Telescope tags theme=get_ivy<CR>',opts)
keymap('n','<leader>tm', ':Telescope marks theme=get_ivy<CR>',opts)
keymap('n','<leader>tM', ':Telescope man_pages sections=ALL <CR>',opts)
keymap('n','<leader>tb', ':Telescope buffers<CR>',opts)
keymap('n','<leader>tO', ':Telescope oldfiles<CR>',opts)
keymap('n','<leader>to', ':Telescope find_files<CR>',opts)
keymap('n','<leader>tg', ':Telescope git_files<CR>',opts)
keymap('n','<leader>tj', ':Telescope jumplist<CR>',opts)
keymap('n','<leader>th', ':Telescope help_tags<CR>',opts)
keymap('n','<leader>tk', ':Telescope keymaps<CR>',opts)
keymap('n','<leader>tc', ':Telescope quickfix<CR>',opts)
keymap('n','<leader>tC', ':Telescope loclist<CR>',opts)
keymap('n','<leader>tB', ':Telescope git_branch<CR>',opts)
keymap('n','<leader>ts', ':Telescope git_stash<CR>',opts)
keymap('n','<leader>tF', ':Telescope current_buffer_fuzzy_find theme=get_ivy<CR>',opts)
keymap('n','<leader>tr', ':Telescope grep_string theme=get_ivy<CR>',opts)
keymap('v','<leader>tr', '"zy:lua require\'telescope.builtin\'.live_grep{theme=\'get_ivy\', default_text=vim.fn.getreg(\'z\')}<CR>',opts)
keymap('v','<leader>tM', '"zy:lua require\'telescope.builtin\'.man_pages{sections={\'ALL\'}, default_text=vim.fn.getreg(\'z\')}<CR>',opts)
keymap('n','<leader>tR', ':Telescope live_grep theme=get_ivy<CR>',opts)

require('telescope').setup{
        defaults = {
                file_ignore_patterns = { "target/.*","*tags*",".ccls-cache","compile_commands.json"},
        },
        extensions = {
                fzf = {
                        fuzzy = true,
                        override_generic_sorter = false,
                        override_file_sorter = true,
                        case_mode = "smart_case",
                }
        }
}


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
