local opts = {noremap = true, silent = true}
local term_opts = {silent = true}

local cfg_utils = require("cfg_utils")
local keymap = vim.api.nvim_set_keymap
-- Map leader key to Space
-- keymap('','<Space>','<Nop>',opts)
vim.g.mapleader = ' ' 
-- vim.g.maplocalleader = '<Space>'

-- keymap('n','',opts)
keymap('n','<Leader>l',':call CycleLanguagesUp()<CR>',opts)
keymap('n', ',/',':nohlsearch<CR>' ,opts)
keymap('t','<Esc>', '<C-\\><C-n>',term_opts)
keymap('t','<C-w>', '<Esc><C-w>',term_opts)
keymap('n','<C-w>', '<Esc><C-w>',opts)
keymap('n','gT', ':tabclose<CR>',opts)
keymap('n','<Leader>ns', ':call OpenTerm(v:true)<cr>',opts)
keymap('n','<C-s>', ':call OpenTerm(v:false)<cr>',opts)
keymap('n','<Leader><C-s>', ':call CycleTerminal(1)<cr> ',opts)
keymap('n','<Leader>y', '"*y',opts)
keymap('n','<Leader>p', '"*p',opts)
keymap('n','<Leader>Y', '"+y',opts)
keymap('n','<Leader>P', '"+p',opts)
keymap('n','<M-h>', ':call ResizeWith("h")<CR>',opts)
keymap('n','<M-j>', ':call ResizeWith("j")<CR>',opts)
keymap('n','<M-k>', ':call ResizeWith("k")<CR>',opts)
keymap('n','<M-l>', ':call ResizeWith("l")<CR>',opts)
keymap('n','<M-;>', ':tabNext<CR>',opts)
-- Focus mode
keymap('n','<Leader>z', ':TZFocus<CR>',opts)
keymap('n','<C-w>z', ':TZAtaraxis<CR>',opts)
--Slime
keymap('n','<Leader>x', ':Make<cr>',opts)
keymap('v','<Leader>x', ':SlimeSend<CR>',opts)
keymap('n','<Leader>X', 'vip:SlimeSend<CR>',opts)
-- Pounce
keymap('n','s', ':Pounce<CR>',opts)
keymap('n','S', ':PounceRepeat<CR>',opts)
keymap('v','s', ':Pounce<CR>',opts)
-- TODO: Rewrite this in lua
keymap('n','<Leader>c', '',{callback= cfg_utils.qf_toggle, noremap = true, silent = true})
-- Other useful stuff i dunno when i used last time
keymap('n','==', 'vi{=<Esc>',opts)
keymap('n','Y', 'y$',opts)
keymap("v","J", ":m '>+1<CR>gv=gv",opts)
keymap("v","K", ":m '<-2<CR>gv=gv",opts)
keymap('n','<Leader>u', ':UndotreeToggle<cr>',opts)
keymap('n','<C-t>', ':AerialToggle<CR>',opts)
keymap('n','<Leader>s', ':call ToggleLocalSpelling()<CR>',opts)
keymap('n','<Leader>=', '1z=',opts)
-- Some stuff i have to remove
keymap('v','<M-b>', ':call OpenInBrowser()<cr>',opts)
keymap('v','<M-t>', ':call ExecInTerminal()<cr>',opts)
keymap('v','<M-T>', ':call SudoExecInTerminal()<cr>',opts)
-- Wirte to file
keymap('n','<Leader>w', ':w<CR>',opts)
keymap('n','<Leader>W', ':w',opts)
-- Gisigns
keymap('n','<Leader>]', ':Gitsigns next_hunk<CR>',opts)
keymap('n','<Leader>[', ':Gitsigns prev_hunk<CR>',opts)
keymap('n','<Leader>A', ':Gitsigns preview_hunk<CR>',opts)
keymap('n','<Leader>D', ':Gitsigns setqflist<CR>',opts)
keymap('v','//',"y/\\V<C-R>=escape(@\",\'/\')<CR><CR>",opts)

-- formatting
-- keymap('n','qq', 'vip:s/ \+/ /ge<CR>vip:s/ , /, /ge<CR>vip:s/ \. /. /ge<CR>:nohlsearch<CR>vipgq<Esc>',opts)
-- keymap('v','qq', '<Esc>gvs/ \+/ /ge<CR>gv:s/ , /, /ge<CR>gv:s/ \. /. /ge<CR>:nohlsearch<CR>gvgq<Esc>',opts)
