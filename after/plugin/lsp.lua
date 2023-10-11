require("mason").setup()

local lsp = require'lspconfig'
local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local  luasnip =  require('luasnip')
require("luasnip.loaders.from_vscode").lazy_load()
local cmp = require'cmp'
cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<M-n>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(1) then
                luasnip.jump(1)
            else
                fallback()
            end
        end ,{ "i", "n" }),
        ['<M-b>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end ,{ "i", "n" }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'spell',keyword_length = 2, max_item_count = 10 },
        { name = 'buffer' , keyword_length = 3},
        { name = 'luasnip'},
    }),
    experimental = {
        ghost_text = true
    },
})
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

local servers = {
    -- "clangd",
    "bashls",
    "lua_ls",
    "ocamllsp",
    -- "nimls",
    "pylsp",
    -- "tsserver",
    -- "html",
    "gopls",
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
  -- maps related defaults
  disable_maps = false, -- "true" disables default keymaps
  skip_input_prompt = false, -- "true" doesn't ask for input

  -- cscope related defaults
  cscope = {
    -- location of cscope db file
    db_file = "./cscope.out",
    -- cscope executable
    exec = "cscope", -- "cscope" or "gtags-cscope"
    -- choose your fav picker
    picker = "telescope", -- "telescope", "fzf-lua" or "quickfix"
    -- "true" does not open picker for single result, just JUMP
    skip_picker_for_single_result = false, -- "false" or "true"
    -- these args are directly passed to "cscope -f <db_file> <args>"
    db_build_cmd_args = { "-bqkvc" },
    -- statusline indicator, default is cscope executable
    statusline_indicator = nil,
  }
})
