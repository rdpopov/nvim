if (has("termguicolors"))
  set termguicolors
endif

colorscheme duskfox

set laststatus=2
set noshowmode

lua require('statusline').set_statusline()
lua require('colorizer_conf')
