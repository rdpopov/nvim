local opts = {noremap = true, silent = true}
local term_opts = {silent = true}
local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = ' '

keymap('n','<leader>g', ':call Grep(input(\"Search for: \"))<CR>',opts)
keymap('n','<leader>G', ':call Grep(expand(\"<cword>\"))<CR>',opts)
keymap('n','<leader>t', ':Telescope<CR>',opts)
keymap('n','<leader>T', ':Telescope tags theme=get_ivy<CR>',opts)
keymap('n','<leader>m', ':Telescope marks theme=get_ivy<CR>',opts)
keymap('n','<leader>M', ':call ManPagesArg()<CR>',opts)
keymap('n','<leader>b', ':Telescope buffers<CR>',opts)
keymap('n','<leader>O', ':Telescope oldfiles<CR>',opts)
keymap('n','<leader>o', ':Telescope find_files<CR>',opts)
keymap('n','<leader>j', ':Telescope jumplist<CR>',opts)
keymap('n','<leader>h', ':Telescope help_tags<CR>',opts)
keymap('n','<leader>k', ':Telescope keymaps<CR>',opts)
keymap('n','<leader>f', ':Telescope current_buffer_fuzzy_find theme=get_ivy<CR>',opts)
keymap('n','<leader>r', ':Telescope grep_string theme=get_ivy<CR>',opts)
keymap('n','<leader>r', '"zy:lua require\'telescope.builtin\'.live_grep{theme=\'get_ivy\', default_text=vim.fn.getreg(\'z\')}<CR>',opts)
keymap('n','<leader>R', ':Telescope live_grep theme=get_ivy<CR>',opts)

vim.cmd "source $HOME/.config/nvim/configs/netrw.vim"
vim.cmd "source $HOME/.config/nvim/default_plugins/vinegar.vim"

require('zen')
require('telescope_conf')
require('gitsigns_conf')
