require'navigator'.setup({
  debug = false,
  code_action_icon = " ",
  width = 0.75,
  height = 0.3,
  preview_height = 0.35,
  border = {"╭", "─", "╮", "│", "╯", "─", "╰", "│"},

  default_mapping = false,
  keymaps = {{key = "gR", func = "declaration()"}},
  transparency = 50,
  code_action_prompt = {enable = true, sign = true, sign_priority = 40, virtual_text = true},
  treesitter_analysis = true,
  icons = {
    code_action_icon = " ",
    diagnostic_head = ' ',
    diagnostic_head_severity_1 = " ",
  },

  lsp = {
    format_on_save = false, -- set to false to disasble lsp code format on save (if you are using prettier/efm/formater etc)
  --  disable_format_ft = {"sqls", "sumneko_lua", "gopls"},  -- a list of lsp not enable auto-format (e.g. if you using efm or vim-codeformat etc), empty by default
    diagnostic_scroll_bar_sign = {'▃', '█'}, -- experimental:  diagnostic status in scroll bar area; set to nil to disable the diagnostic sign,
    diagnostic_virtual_text = false,  -- show virtual for diagnostic message
    diagnostic_update_in_insert = false, -- update diagnostic message in insert mode
  --  disply_diagnostic_qf = false, -- always show quickfix if there are diagnostic errors, set to false if you  want to
  }
})
