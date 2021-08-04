require'lspconfig'.nimls.setup{}
require'lspconfig'.ccls.setup{}
require'lspconfig'.jedi_language_server.setup{}
require'lspconfig'.tsserver.setup{}
require'lspconfig'.html.setup{}
require'lspconfig'.gopls.setup{}
require'lspconfig'.vimls.setup{}
require'lspconfig'.rls.setup{}
require'lspconfig'.hls.setup{}

require "lsp_signature".setup({
    bind = true, 
    doc_lines = 0,
    hint_enable = false,
    handler_opts = {
      border = "none"
    },
  })
