inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
set pumheight=15

set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list=['exact','substring','fuzzy']

lua << EOF
local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.

  -- Set some keybinds conditional on server capabilities
  --if client.resolved_capabilities.document_formatting then
  --  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  --elseif client.resolved_capabilities.document_range_formatting then
  --  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  --end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end
end

-- Use a loop to conveniently both setup defined servers 
-- and map buffer local keybindings when the ver attaches
local servers = { "nimls", "ccls","jedi_language_server", "tsserver","html","gopls"}

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = require'completion'.on_attach }
end
EOF
