vim.o.completeopt = "menuone,noinsert,preview"
local config = {
	enabled = true;
	autocomplete = true;
	debug = false;
	min_length = 1;
	preselect = 'enable';
	throttle_time = 80;
	source_timeout = 200;
	incomplete_delay = 400;
	max_abbr_width = 100;
	max_kind_width = 100;
	max_menu_width = 100;
	documentation = true;
  lsp = {
    format_on_save = false;
  };

	source = {
	path = true;
	buffer = true;
	nvim_lsp = true;
	spell = true;
	tags = false;
	treesitter = false;
	};
	}
require'compe'.setup(config)
