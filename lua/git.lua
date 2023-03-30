require('gitsigns').setup{
signs = {
    add          = {hl = 'diffAdded'   , text = '▐', numhl='', linehl=''},
    change       = {hl = 'diffLine', text = '▐', numhl='', linehl=''},
    delete       = {hl = 'diffRemoved', text = '_', numhl='', linehl=''},
    topdelete    = {hl = 'diffRemoved', text = '‾', numhl='', linehl=''},
    changedelete = {hl = 'diffChanged', text = '~', numhl='', linehl=''},
  },
  keymaps = {
    noremap = true,
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
