M = {}


function M.qf_toggle()
	local windows = vim.api.nvim_tabpage_list_wins(0)
	for _, w in pairs(windows) do
		local b = vim.api.nvim_win_get_buf(w)
		if vim.api.nvim_buf_get_option(b,'filetype') == 'qf' then
			vim.cmd 'cclose'
			return
		end
	end
	vim.cmd 'copen'
end


M.diagn_toggle = function()
	if vim.api.nvim_eval('get(getloclist(0, {\'winid\':0}), \'winid\', 0)') > 0 then
		vim.cmd'lclose'
	else
		vim.diagnostic.setloclist()
	end
end

-- This function replaces the word in search register in last visual selection into the word inuted
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

return M
