local opts = {noremap = true, silent = true}
local term_opts = {silent = true}

local utils = require("utils/utils")
local emcs = require("utils.emcs")
-- local spell = require("utils/spelling")
require("cfg_build_helper")

local keymap = vim.api.nvim_set_keymap
vim.g.mapleader = ' '
-- Homebrew mappings
keymap('x','<leader><leader>',':<C-u>call VBlockNorm()<cr>' ,{silent = true,})
keymap('n', ',/',':nohlsearch<CR>' ,opts)
keymap('t','<Esc>', '<C-\\><C-n>',opts)
keymap('t','<C-w>', '<Esc><C-w>',opts)
keymap('n','gT', ':tabclose<CR>',opts)
keymap('n','<leader>gt', ':tabprevious<CR>',opts)
keymap('n','<Leader>x', '',{callback = function() build_helper.run() end ,noremap = true, silent = true})
keymap('n','<Leader>X', '',{callback = function() build_helper.augment() end ,noremap = true, silent = true})
keymap('n','<Leader>c', '',{callback= utils.qf_toggle, noremap = true, silent = true})
keymap('n','<Leader>C', ':call g:LToggle()<cr>',{noremap = true, silent = true})
keymap('n','==', 'vi{=<Esc>',opts)
keymap('n','<Leader>=', '1z=',opts)
keymap('v','<Leader>s', ':SlimeSend<CR>',opts)
keymap('v','//',"y/\\V<C-R>=escape(@\",\'/\')<CR><CR>",opts)
keymap("v","<C-J>", ":m '>+1<CR>gv=gv",opts)
keymap("v","<C-K>", ":m '<-2<CR>gv=gv",opts)
keymap('n','<Leader>s', ':call ToggleLocalSpelling()<CR>',opts)
keymap('n','<Leader>]', ':exec "ltag " . expand("<cword>")<CR>',opts)

keymap('n','<C-t>', '<cmd>AerialToggle<cr>',opts)
keymap('n','<C-c>', ':ListsToggle<cr>',opts)
keymap('n','<Leader>s',':call CycleLanguagesUp()<CR>',opts)
keymap('n','<Leader>S', ':call ToggleLocalSpelling()<CR>',opts)
keymap('n','<C-s>', ':call OpenTerm(v:false)<cr>',opts)

keymap('n','<Leader>WW', '<Plug>(wiki-index)',opts)
keymap('n','<Leader>w', ':w<CR>',opts)
keymap('n','<Leader><leader>', ':',opts)
keymap('n','<Leader>q', ':q<cr>',opts)
keymap('n','<Leader>Q', ':qa<cr>',opts)
keymap('i','jk', '<Esc>',opts)
keymap('i','kj', '<Esc>',opts)
keymap('v','<Leader>a', ':EasyAlign<cr>',{noremap = true})

keymap('n','<leader>glo',':Git log --oneline<CR>',opts)

keymap('n','[c',':cnext<CR>',opts)
keymap('n',']c',':cprevious<CR>',opts)

keymap('n','[l',':lnext<CR>',opts)
keymap('n',']l',':lprevious<CR>',opts)


keymap('n','<C-h>','<C-w><',opts)
keymap('n','<C-l>','<C-w>>',opts)
keymap('n','<C-k>','<C-w>+',opts)
keymap('n','<C-j>','<C-w>-',opts)
-- Plugin maps
keymap('n','<Leader>u', ':UndotreeToggle<cr>',opts)
keymap('n','<Leader>n', ':Gitsigns next_hunk<CR>',opts)
keymap('n','<Leader>p', ':Gitsigns prev_hunk<CR>',opts)
keymap('n','<Leader>A', ':Gitsigns preview_hunk<CR>',opts)
keymap('n','<Leader>D', ':Gitsigns setqflist<CR>',opts)
-- Harpoon
keymap('n','<leader>H', '',{callback= function () require("harpoon.mark").add_file() end, noremap = true, silent = true}) 
keymap('n','<leader>h', '',{callback=   function () 
                                            if vim.v.count > 0 then
                                                require("harpoon.ui").nav_file(vim.v.count)
                                            else 
                                                require("harpoon.ui").toggle_quick_menu() 
                                            end
                                        end, noremap = true, silent = true})

-- DirDiff
keymap('n','<leader>dn', '<cmd>DirDiffNext<CR>',opts)
keymap('n','<leader>dp', '<cmd DirDiffPrev<CR>',opts)
-- Neogen
keymap("n", "<Leader>nc", ":lua require('neogen').generate({ type = 'class' })<CR>", opts)
keymap("n", "<Leader>nf", ":lua require('neogen').generate({ type = 'func' })<CR>", opts)
keymap("n", "<Leader>nt", ":lua require('neogen').generate({ type = 'type' })<CR>", opts)
