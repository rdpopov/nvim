local opts = {noremap = true, silent = true}
local term_opts = {silent = true}
local keymap = vim.api.nvim_set_keymap
local pth = vim.fn.stdpath('config')
vim.g.mapleader = ' '

require('aerial_conf')
require('telescope').setup{
	defaults = {
		file_ignore_patterns = { "target/.*","*tags*",".ccls-cache","compile_commands.json"},
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = false,
			override_file_sorter = true,
			case_mode = "smart_case",
		}
	}
}

keymap('n','<leader>g', ':call Grep(input(\"Search for: \"))<CR>',opts)
keymap('n','<leader>G', ':call Grep(expand(\"<cword>\"))<CR>',opts)
keymap('n','<leader>t', ':Telescope<CR>',opts)
keymap('n','<leader>tt', ':Telescope tags theme=get_ivy<CR>',opts)
keymap('n','<leader>tm', ':Telescope marks theme=get_ivy<CR>',opts)
keymap('n','<leader>tM', ':Telescope man_pages sections=ALL <CR>',opts)
keymap('n','<leader>tb', ':Telescope buffers<CR>',opts)
keymap('n','<leader>tO', ':Telescope oldfiles<CR>',opts)
keymap('n','<leader>to', ':Telescope find_files<CR>',opts)
keymap('n','<leader>tj', ':Telescope jumplist<CR>',opts)
keymap('n','<leader>th', ':Telescope help_tags<CR>',opts)
keymap('n','<leader>tk', ':Telescope keymaps<CR>',opts)
keymap('n','<leader>tF', ':Telescope current_buffer_fuzzy_find theme=get_ivy<CR>',opts)
keymap('n','<leader>tr', ':Telescope grep_string theme=get_ivy<CR>',opts)
keymap('v','<leader>tr', '"zy:lua require\'telescope.builtin\'.live_grep{theme=\'get_ivy\', default_text=vim.fn.getreg(\'z\')}<CR>',opts)
keymap('v','<leader>tM', '"zy:lua require\'telescope.builtin\'.man_pages{sections={\'ALL\'}, default_text=vim.fn.getreg(\'z\')}<CR>',opts) 
keymap('n','<leader>tR', ':Telescope live_grep theme=get_ivy<CR>',opts)

keymap('n','<leader>f', ':call CscopeFindInteractive(expand(\'<cword>\'))<CR>',opts)
keymap('n','<leader>l', ':call ToggleLocationList()<CR>',opts)

local leap = require('leap')
leap.setup {
  max_aot_targets = nil,
  highlight_unlabeled = false,
  case_sensitive = false,
  -- Groups of characters that should match each other.
  -- Obvious candidates are braces & quotes ('([{', ')]}', '`"\'').
  character_classes = { ' \t\r\n', },
  -- Leaving the appropriate list empty effectively disables "smart" mode,
  -- and forces auto-jump to be on or off.
  -- safe_labels = { . . . },
  -- labels = { . . . },
  -- These keys are captured directly by the plugin at runtime.
  -- (For `prev_match`, I suggest <s-enter> if possible in the terminal/GUI.)
  special_keys = {
    repeat_search = '<enter>',
    next_match    = '<enter>',
    prev_match    = '<tab>',
    next_group    = '<space>',
    prev_group    = '<tab>',
  },
}

 -- leap multiple cursor but on targets not lines
function leap_paranormal(targets)
  -- Get the :normal sequence to be executed.
  local input = vim.fn.input("normal! ")
  if #input < 1 then return end

  local ns = vim.api.nvim_create_namespace("")

  -- Set an extmark as an anchor for each target, so that we can also execute
  -- commands that modify the positions of other targets (insert/change/delete).
  for _, target in ipairs(targets) do
    local line, col = unpack(target.pos)
    id = vim.api.nvim_buf_set_extmark(0, ns, line - 1, col - 1, {})
    target.extmark_id = id
  end

  -- Jump to each extmark (anchored to the "moving" targets), and execute the
  -- command sequence.
  for _, target in ipairs(targets) do
    local id = target.extmark_id
    local pos = vim.api.nvim_buf_get_extmark_by_id(0, ns, id, {})
    vim.fn.cursor(pos[1] + 1, pos[2] + 1)
    vim.cmd("normal! " .. input)
  end

  -- Clean up the extmarks.
  vim.api.nvim_buf_clear_namespace(0, ns, 0, -1)
end
--
-- leap multicursor but its on lines
local function get_targets(winid)
  local wininfo =  vim.fn.getwininfo(winid)[1]
  local cur_line = vim.fn.line('.')
  -- Get targets.
  local targets = {}
  local lnum = wininfo.topline
  while lnum <= wininfo.botline do
    -- Skip folded ranges.
    local fold_end = vim.fn.foldclosedend(lnum)
    if fold_end ~= -1 then 
      lnum = fold_end + 1
    else
      if lnum ~= cur_line then
        table.insert(targets, { pos = { lnum, 1 } })
      end
      lnum = lnum + 1
    end
  end
  -- Sort them by vertical screen distance from cursor.
  local cur_screen_row = vim.fn.screenpos(winid, cur_line, 1)['row']
  local function screen_rows_from_cursor(t)
    local t_screen_row = vim.fn.screenpos(winid, t.pos[1], t.pos[2])['row']
    return math.abs(cur_screen_row - t_screen_row)
  end
  table.sort(targets, function (t1, t2)
    return screen_rows_from_cursor(t1) < screen_rows_from_cursor(t2)
  end)
  if #targets >= 1 then return targets end
end

-- Map this function to your preferred key.
local function leap_lines ()
  local winid = vim.api.nvim_get_current_win()
  leap.leap { multiselect = true,targets = get_targets(winid), target_windows = { winid }, action = leap_paranormal }
end

keymap('n','s','',{callback = function() leap.leap { target_windows = { vim.fn.win_getid() } } end ,noremap = true, silent = true}) -- bidirectional leap
keymap('n','S','',{callback = function() leap.leap { target_windows = { vim.fn.win_getid() }, action = leap_paranormal, multiselect = true, } end ,noremap = true, silent = true}) -- bidirectional select targets
keymap('n','<leader>mc', '',{callback = function() leap_lines() end ,noremap = true, silent = true}) -- bidirectional leap

vim.cmd('source ' .. pth .. "/".."configs/apathy.vim")
vim.cmd('source ' .. pth .. "/".."configs/lang.vim")
vim.cmd('source ' .. pth .. "/".."configs/netrw.vim")
vim.cmd('source ' .. pth .. "/".."configs/ref.vim")
vim.cmd('source ' .. pth .. "/".."configs/terminal_manager.vim")
vim.cmd('source ' .. pth .. "/".."configs/vinegar.vim")
vim.cmd('source ' .. pth .. "/".."configs/wiki.vim")

vim.cmd('source ' .. pth .. "/".."configs/utils.vim")
