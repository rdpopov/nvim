require('gitsigns').setup{
signs = {
    add          = {hl = 'GitSignsAdd'   , text = '▐', numhl='', linehl=''},
    change       = {hl = 'GitSignsChange', text = '▐', numhl='', linehl=''},
    delete       = {hl = 'GitSignsDelete', text = '_', numhl='', linehl=''},
    topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='', linehl=''},
    changedelete = {hl = 'GitSignsChange', text = '~', numhl='', linehl=''},
  },
  keymaps = {
    noremap = true,
    ['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'"},
    ['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'"},
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
