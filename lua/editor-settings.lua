vim.cmd "syntax enable"
vim.cmd "syntax on"
vim.cmd "filetype plugin on"
vim.cmd "set path+=**"
vim.cmd "set guioptions-=e"
vim.cmd "set sessionoptions+=tabpages,globals"

local options   = {
 showmode       = true,
 compatible     = false,
 wildmenu       = true,
 termguicolors  = true,
 wrap           = false,
 tabstop        = 4,
 softtabstop    = 4,
 expandtab      = true,
 backspace      = "indent,eol,start",
 autoindent     = true,
 splitbelow     = true,
 copyindent     = true,
 number         = true,
 shiftwidth     = 4,
 smartindent    = true,
 shiftround     = true,
 showmatch      = true,
 scrollback     = 100000,
 ignorecase     = true,
 smartcase      = true,
 smarttab       = true,
 hlsearch       = true,
 incsearch      = true,
 hidden         = true,
 textwidth      = 120,
 colorcolumn    = "-40",
 foldmethod     = "syntax",
 scrolloff      = 4,
 clipboard      = "unnamedplus",
 sidescrolloff  = 4,
 history        = 10000,
 undolevels     = 10000,
 wildignore     = "*.swp,*.bak,*.pyc,*.class,*.out,*.so",
 title          = true,
 visualbell     = false,
 errorbells     = false,
 backup         = false,
 swapfile       = true,
 foldenable     = false,
 cursorline     = true,
 relativenumber = true,
 signcolumn     = "yes",
 lazyredraw     = true,
 mouse          = "a",
 cpt            = ".,w,d,i,b,u",
 list           = true,
 -- listchars   = "tab:|.,trail:.,extends:#,nbsp:.",
 listchars      = "tab:| ,trail:.",
 undodir        = os.getenv('HOME').. '/.config/nvim/.undodir',
 undofile       = true,
}

for k, v in pairs(options) do
	vim.o[k] = v
end
