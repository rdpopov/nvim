local opts = {noremap = true, silent = true}
local term_opts = {silent = true}

local utils = require("utils/utils")
local emcs = require("utils.emcs")
-- local spell = require("utils/spelling")
require("cfg_build_helper")

local keymap = vim.api.nvim_set_keymap
vim.g.mapleader = ' ' 
-- Homebrew mappings
keymap('v','ss','' ,{silent = true,callback = function () emcs.apply_to_lines()
end})
keymap('n', ',/',':nohlsearch<CR>' ,opts)
keymap('t','<Esc>', '<C-\\><C-n>',opts)
keymap('t','<C-w>', '<Esc><C-w>',opts)
keymap('n','gT', ':tabclose<CR>',opts)
keymap('n','<Leader>x', '',{callback = function() build_helper.run() end ,noremap = true, silent = true})
keymap('n','<Leader>X', '',{callback = function() build_helper.augment() end ,noremap = true, silent = true})
keymap('n','<Leader>c', '',{callback= utils.qf_toggle, noremap = true, silent = true})
keymap('','<leader>r', '',{callback= function () emcs.replace_in_selection(true) end, noremap = true, silent = true})
keymap('','<leader>R', '',{callback= function () emcs.replace_in_selection(false) end, noremap = true, silent = true}) 
keymap('n','==', 'vi{=<Esc>',opts)
keymap('n','<Leader>=', '1z=',opts)
keymap('v','<Leader>s', ':SlimeSend<CR>',opts)
keymap('v','//',"y/\\V<C-R>=escape(@\",\'/\')<CR><CR>",opts)
keymap("v","<C-J>", ":m '>+1<CR>gv=gv",opts)
keymap("v","<C-K>", ":m '<-2<CR>gv=gv",opts)
keymap('n','<Leader>s', ':call ToggleLocalSpelling()<CR>',opts) -- fix this
keymap('n','<Leader>mc', '',{callback= function () emcs.leap_lines() end, noremap = true, silent = true}) -- fix this
-- keymap(3'n','qq', 'vip:s/ \+/ /ge<CR>vip:s/ , /, /ge<CR>vip:s/ \. /. /ge<CR>:nohlsearch<CR>vipgq<Esc>',opts)
-- keymap('v','qq', '<Esc>gvs/ \+/ /ge<CR>gv:s/ , /, /ge<CR>gv:s/ \. /. /ge<CR>:nohlsearch<CR>gvgq<Esc>',opts)
--
keymap('n','<C-t>', '<cmd>AerialToggle<cr>',opts)
keymap('n','<C-c>', ':ListsToggle<cr>',opts)
keymap('n','<Leader>s',':call CycleLanguagesUp()<CR>',opts)
keymap('n','<Leader>S', ':call ToggleLocalSpelling()<CR>',opts)
keymap('n','<C-s>', ':call OpenTerm(v:false)<cr>',opts)

keymap('n','<Leader>w', ':w<CR>',opts)
keymap('n','<Leader>W', ':w',opts)
keymap('v','<Leader>a', ':EasyAlign<cr>',{noremap = true})

-- Plugin maps
keymap('n','<Leader>u', ':UndotreeToggle<cr>',opts)
keymap('n','<Leader>]', ':Gitsigns next_hunk<CR>',opts)
keymap('n','<Leader>[', ':Gitsigns prev_hunk<CR>',opts)
keymap('n','<Leader>A', ':Gitsigns preview_hunk<CR>',opts)
keymap('n','<Leader>D', ':Gitsigns setqflist<CR>',opts)
-- Harpoon
keymap('n','<leader>1', '',{callback= function () require("harpoon.ui").nav_file(1)  end, noremap = true, silent = true})
keymap('n','<leader>2', '',{callback= function () require("harpoon.ui").nav_file(2)  end, noremap = true, silent = true})
keymap('n','<leader>3', '',{callback= function () require("harpoon.ui").nav_file(3)  end, noremap = true, silent = true})
keymap('n','<leader>4', '',{callback= function () require("harpoon.ui").nav_file(4)  end, noremap = true, silent = true})
keymap('n','<leader>H', '',{callback= function () require("harpoon.mark").add_file() end, noremap = true, silent = true}) 
keymap('n','<leader>h', '',{callback= function () require("harpoon.ui").toggle_quick_menu() end, noremap = true, silent = true})
