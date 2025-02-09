require("mason").setup()

local keymap = vim.api.nvim_set_keymap
local lsp = require'lspconfig'
-- local has_words_before = function()
--     local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--     return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil

local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local cmp = require'cmp'

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                    cmp.select_next_item()
            else
                fallback()
            end
        end, { "i", "s" }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                    cmp.select_prev_item()
            else
                fallback()
            end
        end, { "i", "s" }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' }, -- For vsnip users.
        { name = 'nvim_lsp_signature_help' }
    }, {
        { name = 'buffer' },
    })
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- cmp
--============================================================================

local servers = {
    "clangd",
    "jdtls",
    "bashls",
    "lua_ls",
    "ocamllsp",
    -- "csharp_ls",
    -- "nimls",
    "pylsp",
    -- "html",
    "gopls",
    "zls",
    "dartls",
    "ts_ls",
    -- "phpactor",
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

-- local enhance_attach = function(client,bufnr)
--   vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- configs.lsp_wl = {
--   default_config = {
--     cmd = {"nc", "localhost", "6536"},
--     filetypes = { "m","mma", "wl"},
--     root_dir = vim.util.path.dirname,
--   }
-- }

-- lsp.lsp_wl.setup {
--   on_attach = enhance_attach
-- }


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

