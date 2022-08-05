---@module emcs
---@author Rosen Popov
---@license fuk u
--- Could have named it emacs if i wanted anything more on the nose

M = {}

M.split_lines = function ()
	local inp = vim.fn.input("split on: ")
	vim.cmd('s/\\('.. inp ..  '\\)/\\1\\r/g')
end

-- TODO: Make it so you can append to his one
M.replace_in_selection = function (global)
	local mode = (vim.api.nvim_get_mode()['mode'] == 'n') and "'<,'>" or ""
	local replacable = vim.fn.getreg('/') or vim.fn.input("Search register empty. Replace: ") or ""
	if #replacable == 0 then -- any arbitrary filter proc here, can replace empty string(more like bad idea)
		print(string.format("'%s' Is invalid string to replace",replacable))
	end
	local replace_with = vim.fn.input("Replace with: ") or ""
	local cmd_s = string.format("%s s/%s/%s/%s",mode,replacable,replace_with,global and "g" or "")
	vim.fn.execute(cmd_s)
end

M.apply_to_lines = function ()
		local reg = vim.fn.input("Register : ") or ""
		if #reg == 0 or #reg>1 then
			print("asda -> "..reg)
			return
		end
		vim.cmd("normal! @" .. reg)
		-- vim.fn.execute(":\'<,\'>normal! @" .. reg)
end

return M
