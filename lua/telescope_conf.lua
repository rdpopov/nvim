require('telescope').load_extension('fzf')
--require('telescope').load_extension('dap')
require('telescope').setup{
   extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = false,
      override_file_sorter = true,
      case_mode = "smart_case",
    }
  }
}
