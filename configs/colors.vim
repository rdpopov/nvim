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

vim.g.rose_pine_variant = 'moon'
vim.g.rose_pine_bold_vertical_split_line = false
vim.g.rose_pine_inactive_background = true
vim.g.rose_pine_disable_background = false
vim.g.rose_pine_disable_float_background = false
vim.g.rose_pine_disable_italics = false

local p = require('rose-pine.palette')
vim.g.rose_pine_colors = {
	punctuation = p.subtle,
	comment = p.subtle,
	hint = p.iris,
	info = p.foam,
	warn = p.gold,
	error = p.love,

	-- Or set all headings to one colour: `headings = p.text`
	headings = {
		h1 = p.iris,
		h2 = p.foam,
		h3 = p.rose,
		h4 = p.gold,
		h5 = p.pine,
		h6 = p.foam,
	},
}
EOF






set laststatus=2
set noshowmode

lua require('statusline')
lua require('colorizer_conf')
