require("aerial").setup({
  backends = { "lsp", "treesitter", "markdown" },
  -- close_behavior = "auto",
  default_bindings = true,
  default_direction = "prefer_right",
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
  max_width = 40,
  min_width = 25,
  nerd_font = "auto",
  on_attach = nil,
  open_automatic = false,
  placement_editor_edge = false,
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
