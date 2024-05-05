require("mason").setup()

local lsp = require'lspconfig'
local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

-- epo
vim.opt.completeopt = "menu,menuone,noselect,popup"
require('epo').setup({
    fuzzy = true,
    kind_format = function(k)
        return k
    end,
    signature_border = "rounded",
    signature = true,
})

local capabilities = vim.tbl_deep_extend(
      'force',
      vim.lsp.protocol.make_client_capabilities(),
      require('epo').register_cap()
    )
-- epo end
--============================================================================

local servers = {
    "clangd",
    "jdtls",
    "bashls",
    "lua_ls",
    "ocamllsp",
    -- "nimls",
    "pylsp",
    -- "tsserver",
    -- "html",
    "gopls",
    "zls",
    -- "vimls",
    -- "hls",
    -- "racket_langserver",
    -- "rust_analyzer",
}

local function diagn_toggle()
	if vim.api.nvim_eval('get(getloclist(0, {\'winid\':0}), \'winid\', 0)') > 0 then
		vim.cmd'lclose'
	else
		vim.diagnostic.setloclist()
	end
end
local keymap = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}
vim.g.mapleader = ' '
keymap('n','<leader>d', '',{callback= diagn_toggle, noremap = true, silent = true})
keymap('n','gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>',opts)
keymap('n','gd', '<Cmd>lua vim.lsp.buf.definition()<CR>',opts)
keymap('n','K', '<Cmd>lua vim.lsp.buf.hover()<CR>',opts)
keymap('n','rn', '<cmd>lua vim.lsp.buf.rename()<CR>',opts)
keymap('n','gca', '<cmd>lua vim.lsp.buf.code_action()<CR>',opts)
keymap('n','gr', ':Telescope lsp_references theme=get_ivy<CR>',opts)
keymap('n','<leader>dl', '<cmd>lua vim.diagnostic.open_float()<CR>',opts)
keymap('n','[d', '<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<CR>',opts)
keymap('n',']d', '<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<CR>',opts)

for _, srv in pairs(servers) do
    lsp[srv].setup {  capabilities = capabilities, }
end
require 'cscope_maps'.setup(
{
  disable_maps = false,
  skip_input_prompt = false,
  cscope = {
    db_file = "./cscope.out",
    exec = "cscope",
    picker = "telescope",
    skip_picker_for_single_result = false,
    db_build_cmd_args = { "-bqkvc" },
    statusline_indicator = nil,
  }
})
