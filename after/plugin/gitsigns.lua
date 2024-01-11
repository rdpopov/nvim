local opts = {noremap = true, silent = true}
local keymap = vim.api.nvim_set_keymap
vim.g.mapleader = ' '
keymap('n','<Leader>n', ':Gitsigns next_hunk<CR>',opts)
keymap('n','<Leader>p', ':Gitsigns prev_hunk<CR>',opts)
keymap('n','<Leader>A', ':Gitsigns preview_hunk<CR>',opts)
keymap('n','<Leader>D', ':Gitsigns setqflist<CR>',opts)
require('gitsigns').setup{
signs = {
    add          = {hl = 'diffAdded'   , text = '▐', numhl = '', linehl = ''},
    change       = {hl = 'diffLine', text     = '▐', numhl = '', linehl = ''},
    delete       = {hl = 'diffRemoved', text  = '_', numhl = '', linehl = ''},
    topdelete    = {hl = 'diffRemoved', text  = '‾', numhl = '', linehl = ''},
    changedelete = {hl = 'diffChanged', text  = '~', numhl = '', linehl = ''},
    untracked    = {hl = 'diffChanged', text  = '┆', numhl = '', linehl = ''},
  },
  watch_gitdir = {
    interval = 3000,
    follow_files = true
  },
  attach_to_untracked = flase,
  current_line_blame = false,
  current_line_blame_formatter_opts = {
    relative_time = false
  },
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
