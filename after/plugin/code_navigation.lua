vim.pack.add({
	{src="https://github.com/dhananjaylatkar/cscope_maps.nvim"},
	{src="https://github.com/stevearc/aerial.nvim"}
})
require 'cscope_maps'.setup(
{
  disable_maps = false,
  skip_input_prompt = false,
  cscope = {
    db_file = "./cscope.out",
    exec = "cscope",
    picker = "telescope",
    skip_picker_for_single_result = false,
    db_build_cmd = { args = { "-bqkvc" } },
    statusline_indicator = nil,
  }
})

local opts = {noremap = true, silent = true}
local keymap = vim.api.nvim_set_keymap
vim.g.mapleader = ' '
keymap('n','<C-t>', '<cmd>AerialToggle<cr>',opts)
require("aerial").setup({
  backends = { "lsp", "treesitter", "markdown" },
  -- close_behavior = "auto",
  -- disable_max_lines = 10000,
  filter_kind = {
      "Array",
      "Boolean",
      "Class",
      "Constant",
      "Constructor",
      "Enum",
      "EnumMember",
      "Field",
      "Function",
      "Interface",
      "Key",
      "Method",
      "Module",
      "Namespace",
      "Number",
      "Object",
      "Operator",
      "Package",
      "Property",
      "Struct",
      "TypeParameter",
      "Variable",
  },
  highlight_mode = "split_width",
  highlight_on_jump = 300,
  icons = {},
  link_folds_to_tree = false,
  link_tree_to_folds = true,
  manage_folds = false,
  layout = {
      max_width = { 40, 0.2 },
      default_bindings = true,
      default_direction = "prefer_left",
      placement_editor_edge = false,
      min_width = 25,
  },
  nerd_font = "auto",
  on_attach = nil,
  open_automatic = false,
  post_jump_cmd = "normal! zz",
  close_on_select = false,
  float = {
    border = "rounded",
    max_height = 100,
    min_height = 4,
  },
  override = function(conf)
      conf.row = 1
      conf.col = 0
      return conf
  end,
  lsp = {
    diagnostics_trigger_update = true,
    update_when_errors = true,
  },
  treesitter = {
    update_delay = 300,
  },
  markdown = {
    update_delay = 300,
  },
})
