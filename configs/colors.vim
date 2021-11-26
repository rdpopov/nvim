if (has("termguicolors"))
  set termguicolors
endif

colorscheme aurora
"

lua << EOF
local nightfox = require('nightfox')
nightfox.setup({
fox = "nightfox",
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
EOF


set laststatus=2
set noshowmode

lua require('statusline')
lua require('colorizer_conf')
