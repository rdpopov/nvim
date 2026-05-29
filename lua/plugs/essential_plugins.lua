vim.pack.add({
    { src = "https://github.com/tpope/vim-dispatch"},
    { src = "https://github.com/will133/vim-dirdiff"},
    { src = "https://github.com/tpope/vim-commentary"},
    { src = "https://github.com/junegunn/vim-easy-align"},
    { src = "https://github.com/tpope/vim-surround"},
    { src = "https://github.com/mbbill/undotree"},
    { src = "https://github.com/norcalli/nvim-colorizer.lua"},
    { src = "https://github.com/rdpopov/nvim-sak"},
    { src = "https://github.com/chomosuke/term-edit.nvim"},
    { src = "https://github.com/MeanderingProgrammer/render-markdown.nvim"}
})

require 'term-edit'.setup {
    -- Mandatory option:
    -- Set this to a lua pattern that would match the end of your prompt.
    -- Or a table of multiple lua patterns where at least one would match the
    -- end of your prompt at any given time.
    -- For most bash/zsh user this is '%$ '.
    -- For most powershell/fish user this is '> '.
    -- For most windows cmd user this is '>'.
    prompt_end = '%$ ',
    -- How to write lua patterns: https://www.lua.org/pil/20.2.html
}


local opts = {noremap = true, silent = true}
local keymap = vim.api.nvim_set_keymap
vim.g.mapleader = ' '
-- Undotree
keymap('n','<Leader>u', ':UndotreeToggle<cr>',opts)
keymap('n','Q', '@q',opts)
keymap('n','<Leader>e', ":'<,'>normal @q<cr>",opts)
-- EasyAlign
keymap('v','<Leader>a', ':EasyAlign<cr>',{noremap = true})
-- DirDiff
keymap('n','<leader>dn', '<cmd>DirDiffNext<CR>',opts)
keymap('n','<leader>dp', '<cmd DirDiffPrev<CR>',opts)
