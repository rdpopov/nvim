---@module emcs
---@author Rosen Popov
---@license fuk u
--- Could have named it emacs if i wanted anything more on the nose

local E = {}

E.split_lines = function ()
	local inp = vim.fn.input("split on: ")
	vim.cmd('s/\\('.. inp ..  '\\)/\\1\\r/g')
end

-- TODO: Make it so you can append to his one
E.replace_in_selection = function (global)
	local mode = (vim.api.nvim_get_mode()['mode'] == 'n') and "'<,'>" or ""
	local replacable = vim.fn.getreg('/') or vim.fn.input("Search register empty. Replace: ") or ""
	if #replacable == 0 then -- any arbitrary filter proc here, can replace empty string(more like bad idea)
		print(string.format("'%s' Is invalid string to replace",replacable))
	end
	local replace_with = vim.fn.input("Replace with: ") or ""
	local cmd_s = string.format("%s s/%s/%s/%s",mode,replacable,replace_with,global and "g" or "")
	vim.fn.execute(cmd_s)
end

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
E.leap_lines = function()
  winid = vim.api.nvim_get_current_win()
  require('leap').leap { multiselect = true,targets = get_targets(winid), target_windows = { winid }, }
end
return E
