local opts = {noremap = true, silent = true}
local keymap = vim.api.nvim_set_keymap
vim.g.mapleader = ' '
keymap('t','<Esc>', '<C-\\><C-n>',{noremap = true, silent = true ,desc="Escape in to normal mode in nvim terminal"})
keymap('t','<C-w>', '<Esc><C-w>',{noremap = true, silent = true ,desc="Change windows properly from terminal mode"})
keymap('n','gT', ':tabclose<CR>',{noremap = true, silent = true ,desc="Close current tab"})
keymap('n','<leader>gt', ':tabprevious<CR>',{noremap = true, silent = true ,desc="Switch to previous tab"})
keymap('n','==', 'vi{=<Esc>',{noremap = true, silent = true ,desc="Fix indentation in the curretn block of code "})
keymap('n','<Leader>=', '1z=',{noremap = true, silent = true ,desc="Take the first speeling suggestion fo the word under cursor"})
keymap('v','//',"y/\\V<C-R>=escape(@\",\'/\')<CR><CR>",{noremap = true, silent = true ,desc="Use the text selected in visual mode as a search pattern"})
keymap("v","<C-J>", ":m '>+1<CR>gv=gv",{noremap = true, silent = true ,desc="Move selected text down"})
keymap("v","<C-K>", ":m '<-2<CR>gv=gv",{noremap = true, silent = true ,desc="Move selected text up"})
keymap('n','<Leader>]', ':exec "ltag " . expand("<cword>")<CR>',{noremap = true, silent = true ,desc="Execute ltag for word under the cursor"})
keymap('n','<Leader>w', ':w<CR>',{noremap = true, silent = true ,desc="Save file"})
keymap('n','<Leader><leader>', ':',{noremap = true, silent = true ,desc="Enter command mode wiht two spaces"})
keymap('n','<Leader>q', ':q<cr>',{noremap = true, silent = true ,desc="Quit/Close split"})
keymap('n','<Leader>Q', ':qa<cr>',{noremap = true, silent = true ,desc="Quit"})
keymap('i','jk', '<Esc>',{noremap = true, silent = true ,desc="Remap esc for insert mode"})
keymap('i','kj', '<Esc>',{noremap = true, silent = true ,desc="Remap esc for insert mode"})
keymap('n','[l',':lnext<CR>',{noremap = true, silent = true ,desc="Jump to next item in location list"})
keymap('n',']l',':lprevious<CR>',{noremap = true, silent = true ,desc="Jump to previous item in location list"})
keymap('n','<C-k>',':cprev<CR>',{noremap = true, silent = true ,desc="Swith to split up"})
keymap('n','<C-j>',':cnext<CR>',{noremap = true, silent = true ,desc="Swith to split down"})
keymap('n',',/', ':nohlsearch<CR>',{noremap = true, silent = true ,desc="Turn temporarily searching off"})


