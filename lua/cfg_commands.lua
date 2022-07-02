local opts = {noremap = true, silent = true}
local term_opts = {silent = true}

local cfg_utils = require("cfg_utils")
local keymap = vim.api.nvim_set_keymap
vim.g.mapleader = ' ' 

keymap('x','ga', '<Plug>(EasyAlign)',{silent = true})
keymap('n','ga', '<Plug>(EasyAlign)',{silent = true})
keymap('n','gx', ':!firefox <c-r><c-a><CR><CR>',{silent = true})
keymap('n','ss', '<Plug>(EasyAlign)',{silent = true})
keymap('v','ss','' ,{silent = true,callback = function ()
    local inp = vim.fn.input("Split on: ")
    vim.cmd('s/\\('.. inp ..  '\\)/\\1\\r/g')
end})

keymap('n','<Leader>L',':call CycleLanguagesUp()<CR>',opts)
keymap('n', ',/',':nohlsearch<CR>' ,opts)
keymap('t','<Esc>', '<C-\\><C-n>',term_opts)
keymap('t','<C-w>', '<Esc><C-w>',term_opts)
keymap('n','<C-w>', '<Esc><C-w>',opts)
keymap('n','gT', ':tabclose<CR>',opts)
keymap('n','<C-x>', ':ListsToggle<cr>',opts)
keymap('n','<Leader>ns', ':call OpenTerm(v:true)<cr>',opts)
keymap('n','<C-s>', ':call OpenTerm(v:false)<cr>',opts)
keymap('n','<Leader><C-s>', ':call CycleTerminal(1)<cr> ',opts)
keymap('','<Leader>y', '"+y',opts)
keymap('','<Leader>p', '"+p',opts)
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
-- keymap('n','s', ':Pounce<CR>',opts)
-- keymap('n','S', ':PounceRepeat<CR>',opts)
-- keymap('v','s', ':Pounce<CR>',opts)
keymap('n','<Leader>c', '',{callback= cfg_utils.qf_toggle, noremap = true, silent = true})
keymap('','Gr', '',{callback= function () cfg_utils.replace_in_selection(true) end, noremap = true, silent = true})
keymap('','GR', '',{callback= function () cfg_utils.replace_in_selection(false) end, noremap = true, silent = true})
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

keymap('n','<Leader>a',  ':Neogen func<CR>',opts)
keymap('n','<Leader>af', ':Neogen file<CR>',opts)
keymap('n','<Leader>ac', ':Neogen class<CR>',opts)
keymap('n','<Leader>at', ':Neogen type<CR>',opts)

-- formatting
-- keymap('n','qq', 'vip:s/ \+/ /ge<CR>vip:s/ , /, /ge<CR>vip:s/ \. /. /ge<CR>:nohlsearch<CR>vipgq<Esc>',opts)
-- keymap('v','qq', '<Esc>gvs/ \+/ /ge<CR>gv:s/ , /, /ge<CR>gv:s/ \. /. /ge<CR>:nohlsearch<CR>gvgq<Esc>',opts)
