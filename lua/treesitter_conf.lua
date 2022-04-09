local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.nim = {
  install_info = {
    url = "~/develop/nim-treesitter/", -- local path or git repo
    files = {"src/parser.c"},
    -- optional entries:
    branch = "main", -- default branch in case of git repo if different from master
    generate_requires_npm = false, -- if stand-alone parser without npm dependencies
    requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
  },
  filetype = "nim", -- if filetype does not match the parser name
}

require'nvim-treesitter.configs'.setup {
ensure_installed = { "c","cpp","python","json","javascript","rust","bash","go","vim","json","dockerfile","html","lua"} , -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,  -- false will disable the whole extension
    -- disable = { "nim" },  -- list of language that will be disabled
  },
}
ts_utils = require 'nvim-treesitter.ts_utils'
