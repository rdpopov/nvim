vim.pack.add({
    { src = 'https://github.com/williamboman/mason.nvim'},
    { src = 'https://github.com/neovim/nvim-lspconfig'},
    { src = 'https://github.com/hrsh7th/cmp-nvim-lsp'},
    { src = 'https://github.com/hrsh7th/cmp-buffer'},
    { src = 'https://github.com/hrsh7th/nvim-cmp'},
    { src = 'https://github.com/hrsh7th/cmp-vsnip'},
    { src = 'https://github.com/hrsh7th/vim-vsnip'},
    { src = 'https://github.com/hrsh7th/cmp-nvim-lsp-signature-help'},
})

local _ = require("mason").setup()

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
        { name = 'nvim_lsp_signature_help' },
        { name = 'buffer' },
    })
})

local function diagn_toggle()
	if vim.api.nvim_eval('get(getloclist(0, {\'winid\':0}), \'winid\', 0)') > 0 then
		vim.cmd'lclose'
	else
		vim.diagnostic.setloclist()
	end
end

vim.diagnostic.config({ virtual_text = true })

local capabilities = require('cmp_nvim_lsp').default_capabilities()
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
    "pico8-ls",
    -- "phpactor",
    -- "vimls",
    -- "hls",
    -- "racket_langserver",
    -- "rust_analyzer",
}

for _, srv in pairs(servers) do
    vim.lsp.config(srv,{  capabilities = capabilities, })
    vim.lsp.enable(srv)
end

vim.api.nvim_create_autocmd({'BufNew', 'BufEnter'}, {
    pattern = { '*.p8' },
    callback = function(args)
        vim.lsp.start({
            name = 'pico8-ls',
            cmd = { 'pico8-ls', '--stdio' },
            root_dir = vim.fs.dirname(vim.api.nvim_buf_get_name(args.buf)),
            -- Setup your keybinds in the on_attach function
            on_attach = on_attach,
        })
    end
})

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
