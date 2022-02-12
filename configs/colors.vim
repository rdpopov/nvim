if (has("termguicolors"))
  set termguicolors
endif


lua << EOF
-- nightfox
local nightfox = require('nightfox')
nightfox.setup({
fox = "duskfox",
  alt_nc = true,
  terminal_colors = true,
styles = {
	comments = "italic",
	keywords = "bold",
	functions = "bold"
	},
inverse = {
	match_paren = true,
	visual = true,
	search = true
	},
hlgroups = {
	GitSignsAdd = {style = "bold" },
	GitSignsChange = {style = "bold" },
	GitSignsDelete = {style = "bold" },
	},
})
nightfox.load()

-- catpuccino
local catppuccin = require("catppuccin")

-- configure it
catppuccin.setup({
transparent_background = false,
term_colors = false,
styles = {
	comments = "italic",
	functions = "italic",
	keywords = "italic",
	strings = "NONE",
	variables = "italic",
},
integrations = {
	treesitter = true,
	native_lsp = {
		enabled = true,
		virtual_text = {
			errors = "italic",
			hints = "italic",
			warnings = "italic",
			information = "italic",
		},
	},
	cmp = true,
	gitsigns = true,
	telescope = true,
	markdown = true,
	hop = false,
	}})
EOF

colorscheme duskfox

set laststatus=2
set noshowmode

lua require('statusline')
lua require('colorizer_conf')
