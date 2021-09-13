require "lsp_signature".setup({
    bind = true, 
    doc_lines = 0,
    hint_enable = false,
    floating_window_above_cur_line=true,
    handler_opts = {
      border = "none"
    },
  })
local cmp = require'cmp'
cmp.setup({
    completion = {
      autocomplete = {
        completeopt = 'menu,menuone,noinsert,preview'
      },
    },
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    mapping = {
      ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = {
      { name = 'path' },
      { name = 'nvim_lsp' },
      { name = 'nvim_lua' },
      { name = 'buffer' },
      { name = 'spell' },
    }
  })

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
-- The following example advertise capabilities to `clangd`.
require'lspconfig'.ccls.setup { capabilities = capabilities, }
require'lspconfig'.nimls.setup { capabilities = capabilities, }
require'lspconfig'.pylsp.setup { capabilities = capabilities, }
require'lspconfig'.tsserver.setup { capabilities = capabilities, }
require'lspconfig'.html.setup { capabilities = capabilities, }
require'lspconfig'.gopls.setup { capabilities = capabilities, }
require'lspconfig'.vimls.setup { capabilities = capabilities, }
require'lspconfig'.rust_analyzer.setup { capabilities = capabilities, }
require'lspconfig'.hls.setup { capabilities = capabilities, }
require'lspconfig'.racket_langserver.setup { capabilities = capabilities, }

