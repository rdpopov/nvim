require "lsp_signature".setup({
    bind = true, 
    doc_lines = 0,
    hint_enable = false,
    floating_window_above_cur_line=true,
    handler_opts = {
      border = "none"
    },
  })
-- luasnip
local luasnip = require'luasnip'
require('luasnip/loaders/from_vscode').load()
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end
-- cmp
local cmp = require'cmp'
cmp.setup({
    formatting = {},
    completion = {
      completeopt = 'menu,menuone,noinsert,preview'
    },
    snippet = {
      expand = function(args)
        require'luasnip'.lsp_expand(args.body)
      end
    },

    mapping = {
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      -- ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
     -- ['<TAB>'] = cmp.mapping.complete(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = {
      { name = 'path' },
      { name = 'nvim_lsp' },
      { name = 'nvim_lua' },
      { name = 'buffer' },
      { name = 'spell' },
      { name = 'luasnip' },
    }
  })

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
-- The following example advertise capabilities to `clangd`.
require'lspconfig'.ccls.setup { on_attach = require("aerial").on_attach, capabilities = capabilities, }
require'lspconfig'.nimls.setup { on_attach = require("aerial").on_attach, capabilities = capabilities, }
require'lspconfig'.jedi_language_server.setup { on_attach = require("aerial").on_attach,capabilities = capabilities, }
require'lspconfig'.tsserver.setup { on_attach = require("aerial").on_attach, capabilities = capabilities, }
require'lspconfig'.html.setup { on_attach = require("aerial").on_attach, capabilities = capabilities, }
require'lspconfig'.gopls.setup { on_attach = require("aerial").on_attach, capabilities = capabilities, }
require'lspconfig'.vimls.setup { on_attach = require("aerial").on_attach, capabilities = capabilities, }
require'lspconfig'.rust_analyzer.setup { on_attach = require("aerial").on_attach, capabilities = capabilities, }
require'lspconfig'.hls.setup {  on_attach = require("aerial").on_attach, capabilities = capabilities, }
require'lspconfig'.racket_langserver.setup {  on_attach = require("aerial").on_attach, capabilities = capabilities, }
