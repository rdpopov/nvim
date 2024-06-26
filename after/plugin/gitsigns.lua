local opts = {noremap = true, silent = true}
local keymap = vim.api.nvim_set_keymap
vim.g.mapleader = ' '
keymap('n','<Leader>n', ':Gitsigns next_hunk<CR>',opts)
keymap('n','<Leader>p', ':Gitsigns prev_hunk<CR>',opts)
keymap('n','<Leader>A', ':Gitsigns preview_hunk<CR>',opts)
keymap('n','<Leader>D', ':Gitsigns setqflist<CR>',opts)
require('gitsigns').setup {
    signs = {
        add          = { text = '┃' },
        change       = { text = '┃' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
    },
    watch_gitdir = {
        interval = 3000,
        follow_files = true
    },
    attach_to_untracked = flase,
    sign_priority = 20,
    update_debounce = 100,
    status_formatter = nil,
    max_file_length = 10000,
    preview_config = {
        border = 'none',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1
    },
}

vim.api.nvim_set_hl(0, 'GitSignsAdd', { link = 'diffAdded' })
vim.api.nvim_set_hl(0, 'GitSignsAddLn', { link = '' })
vim.api.nvim_set_hl(0, 'GitSignsAddNr', { link = '' })
vim.api.nvim_set_hl(0, 'GitSignsChange', { link = 'diffLine' })
vim.api.nvim_set_hl(0, 'GitSignsChangeLn', { link = '' })
vim.api.nvim_set_hl(0, 'GitSignsChangeNr', { link = '' })
vim.api.nvim_set_hl(0, 'GitSignsChangedelete', { link = 'diffChanged' })
vim.api.nvim_set_hl(0, 'GitSignsChangedeleteLn', { link = '' })
vim.api.nvim_set_hl(0, 'GitSignsChangedeleteNr', { link = '' })
vim.api.nvim_set_hl(0, 'GitSignsDelete', { link = 'diffRemoved' })
vim.api.nvim_set_hl(0, 'GitSignsDeleteLn', { link = '' })
vim.api.nvim_set_hl(0, 'GitSignsDeleteNr', { link = '' })
vim.api.nvim_set_hl(0, 'GitSignsTopdelete', { link = 'diffRemoved' })
vim.api.nvim_set_hl(0, 'GitSignsTopdeleteLn', { link = '' })
vim.api.nvim_set_hl(0, 'GitSignsTopdeleteNr', { link = '' })
vim.api.nvim_set_hl(0, 'GitSignsUntracked', { link = 'diffChanged' })
vim.api.nvim_set_hl(0, 'GitSignsUntrackedLn', { link = '' })
vim.api.nvim_set_hl(0, 'GitSignsUntrackedNr', { link = '' })
