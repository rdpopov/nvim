--require('telescope').load_extension('fzf')
--require('telescope').load_extension('dap')
require('telescope').load_extension('aerial')
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
