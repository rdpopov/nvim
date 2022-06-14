-- luasnip
ls = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

function jump_next()
    if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
    end
end

local cmp = require'cmp'
cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
    },

    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        -- ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<TAB>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif has_words_before() then
                cmp.complete()
            end
        end, { "i", "s" }),
        -- ["<S-TAB>"] = cmp.mapping(function(fallback)
        --     if cmp.visible() then
        --         cmp.select_prev_item()
        --     end
        -- end, { "i", "s" }),
        ["<S-TAB>"] = cmp.mapping(function(fallback)
            if ls.expand_or_jumpable() then
              ls.expand_or_jump()
            else
                fallback()
            end
        end, { "i", "s" }),
        -- ["<leader><S-TAB>"] = cmp.mapping(function(fallback)
        --     if ls.jumpable(-1) then
        --         ls.jump(-1)
        --     else
        --         fallback()
        --     end
        -- end, { "i", "s" }),
    }),
    sources = cmp.config.sources({
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'buffer' , keyword_length = 3},
        { name = 'spell',keyword_length = 2, max_item_count = 10 },
        { name = 'luasnip', option = { use_show_condition = false } },
    }),
    experimental = {
        ghost_text = true
    },
})

rust_settings = {
    ["rust-analyzer"] = {
        assist = {
            importGranularity = "module",
            importPrefix = "self",
        },
        cargo = {
            loadOutDirsFromCheck = true
        },
        procMacro = {
            enable = true
        },
        lens = {
            enable = true,
            debug = true
        },
        inlayHints = {
            renderColons = true
        },
    }
}
local lsp_install_path = vim.fn.stdpath("data") .. "/lsp_servers"
local servers = {
    "ccls",
    "bashls",
    "sumneko_lua",
    "nimls",
    "pylsp",
    "tsserver",
    "html",
    "gopls",
    "vimls",
    "hls",
    "racket_langserver"
}

require("nvim-lsp-installer").setup({
    ensure_installed = table.concat(servers,'rust_analyzer'),
    automatic_installation = false,
    install_root_dir =  lsp_install_path ,
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})
vim.o.runtimepath =vim.o.runtimepath .. "," .. lsp_install_path 

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
for i, srv in pairs(servers) do
    require'lspconfig'[srv].setup { on_attach = require("aerial").on_attach and require'virtualtypes'.on_attach , capabilities = capabilities, }
end

require'lspconfig'.rust_analyzer.setup { on_attach = require("aerial").on_attach, capabilities = capabilities, }
require('rust-tools').setup({})
require('rust-tools.inlay_hints').set_inlay_hints()
