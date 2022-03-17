if (has("termguicolors"))
  set termguicolors
endif


lua << EOF
-- catpuccino
-- local catppuccin = require("catppuccin")
-- 
-- -- configure it
-- catppuccin.setup({
-- transparent_background = false,
-- term_colors = false,
-- styles = {
-- 	comments = "italic",
-- 	functions = "italic",
-- 	keywords = "italic",
-- 	strings = "NONE",
-- 	variables = "italic",
-- },
-- integrations = {
-- 	treesitter = true,
-- 	native_lsp = {
-- 		enabled = true,
-- 		virtual_text = {
-- 			errors = "italic",
-- 			hints = "italic",
-- 			warnings = "italic",
-- 			information = "italic",
-- 		},
-- 	},
-- 	cmp = true,
-- 	gitsigns = true,
-- 	telescope = true,
-- 	markdown = true,
-- 	hop = false,
-- 	}})
EOF

colorscheme duskfox

set laststatus=2
set noshowmode

lua require('statusline')
lua require('colorizer_conf')
