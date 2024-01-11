require("mason").setup()

local lsp = require'lspconfig'
local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local cmp = require'cmp'

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                vim.fn.feedkeys(t("<C-n>"), "")
            elseif vim.fn["vsnip#available"](1) then
                vim.fn.feedkeys(t("<Plug>(vsnip-expand-or-jump)"), "")
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                vim.fn.feedkeys(t("<C-p>"), "")
            elseif vim.fn["vsnip#jumpable"](-1) then
                vim.fn.feedkeys(t("<Plug>(vsnip-jump-prv)"), "")
            else
                fallback()
            end
        end, { "i", "s" }),
    }
    ),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'spell',keyword_length = 2, max_item_count = 10 },
        { name = 'buffer' , keyword_length = 3},
        { name = 'vsnip' },
    }),
    experimental = {
        ghost_text = true
    },
})

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

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
