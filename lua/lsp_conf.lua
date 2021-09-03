require'lspconfig'.nimls.setup{}
require'lspconfig'.ccls.setup{}
require'lspconfig'.pylsp.setup{}
require'lspconfig'.tsserver.setup{}
require'lspconfig'.html.setup{}
require'lspconfig'.gopls.setup{}
require'lspconfig'.vimls.setup{}
require'lspconfig'.rust_analyzer.setup{}
require'lspconfig'.hls.setup{}
require'lspconfig'.racket_langserver.setup{}

require "lsp_signature".setup({
    bind = true, 
    doc_lines = 0,
    hint_enable = false,
    handler_opts = {
      border = "none"
    },
  })
