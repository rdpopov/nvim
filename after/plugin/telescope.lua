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

