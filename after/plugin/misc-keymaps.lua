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
-- Goyo
keymap('n','<Leader>z', ':Goyo<cr>',opts)

keymap("n", "<leader>AA" , "<cmd>ArduinoAttach<CR>",opts)
keymap("n", "<leader>AV" , "<cmd>ArduinoVerify<CR>",opts)
keymap("n", "<leader>AU" , "<cmd>ArduinoUpload<CR>",opts)
keymap("n", "<leader>AUS", " <cmd>ArduinoUploadAndSerial<CR>",opts)
keymap("n", "<leader>AS" , "<cmd>ArduinoSerial<CR>",opts)
keymap("n", "<leader>AB" , "<cmd>ArduinoChooseBoard<CR>",opts)
keymap("n", "<Leadereadereader>AP" , "<cmd>ArduinoChooseProgrammer<CR>",opts)
