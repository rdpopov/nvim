
vim.cmd "syntax enable"
vim.cmd "syntax on"
vim.cmd "filetype plugin on"
vim.cmd "set path+=**"
vim.cmd "set guioptions-=e"
vim.cmd "set sessionoptions+=tabpages,globals"

local options = {
 compatible           = false,
 wildmenu             = true,
 termguicolors        = true,
 wrap                 = false,
 tabstop              = 4,
 softtabstop          = 4,
 expandtab            = true,
 backspace            = "indent,eol,start",
 autoindent           = true,
 copyindent           = true,
 number               = true,
 shiftwidth           = 4,
 smartindent          = true,
 shiftround           = true,
 showmatch            = true,
 ignorecase           = true,
 smartcase            = true,
 smarttab             = true,
 hlsearch             = true,
 incsearch            = true,
 hidden	              = true,
 colorcolumn          = 80,
 foldmethod           = "syntax",
 scrolloff            = 4,
 sidescrolloff        = 4,
 history              = 10000,
 undolevels           = 10000,
 wildignore           = "*.swp,*.bak,*.pyc,*.class,*.out,*.so",
 title                = true,
 visualbell           = false,
 errorbells           = false,
 backup               = false,
 swapfile             = false,
 foldenable           = false,
 cursorline           = true,
 relativenumber       = true,
 signcolumn           = "yes",
 lazyredraw           = true,
 mouse                = "a",
 cpt                  = ".,w,d,i,b,u",
 list                 = true,
 -- listchars            = "tab:|.,trail:.,extends:#,nbsp:.",
 listchars            = "tab:| ,trail:.",
 undodir              = os.getenv('HOME').. '/.config/nvim/.undodir',
 undofile             = true,
}

for k, v in pairs(options) do
	vim.o[k] = v
end
