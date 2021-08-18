if (has("termguicolors"))
  set termguicolors
endif


set laststatus=2
set noshowmode

lua require('statusline')
lua require('colorizer_conf')
