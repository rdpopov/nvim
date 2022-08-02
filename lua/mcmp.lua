require("nvim-lsp-installer").setup {automatic_installation = false}
vim.o.pumheight=16

vim.cmd "hi link LspDiagnosticsDefaultError Error"
vim.cmd "hi link LspDiagnosticsDefaultWarning Todo"
vim.cmd "hi link LspDiagnosticsDefaultInformation Normal"
vim.cmd "hi link LspDiagnosticsDefaultHint Normal"

local opts = {noremap = true, silent = true}
local cfg_utils = require("utils/utils")
local keymap = vim.api.nvim_set_keymap
vim.g.mapleader = ' '

keymap('n','<leader>d', '',{callback= cfg_utils.diagn_toggle, noremap = true, silent = true})
keymap('n','gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>',opts)
keymap('n','gd', '<Cmd>lua vim.lsp.buf.definition()<CR>',opts)
keymap('n','K', '<Cmd>lua vim.lsp.buf.hover()<CR>',opts)
keymap('n','rn', '<cmd>lua vim.lsp.buf.rename()<CR>',opts)
keymap('n','gca', '<cmd>lua vim.lsp.buf.code_action()<CR>',opts)
keymap('n','gr', ':Telescope lsp_references theme=get_ivy<CR>',opts)
keymap('n','[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>',opts)
keymap('n',']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>',opts)
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end
local cmp = require'cmp'
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
    "racket_langserver",
    "rust_analyzer",
}
cmp.setup({
    snippet = {
      expand = function(args)
       vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ["<TAB>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif has_words_before() then
                cmp.complete()
            end
        end, { "i", "s" }),
    }),
    sources = cmp.config.sources({
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'buffer' , keyword_length = 3},
        { name = 'spell',keyword_length = 3, max_item_count = 10 },
        { name = 'vsnip',},
    }),
    experimental = {
        ghost_text = true
    },
})
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
for i, srv in pairs(servers) do
    require'lspconfig'[srv].setup {  capabilities = capabilities, }
end
vim.g.slime_target = "neovim"

require'nvim-treesitter.configs'.setup {
ensure_installed = { "c","cpp","python","javascript","rust","bash","go","vim","json","dockerfile","html","lua"} , -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,  -- false will disable the whole extension
    disable = { "nim" },  -- list of language that will be disabled
  },
  context_commentstring = {
      enable = true,
  },
}
