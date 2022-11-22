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

return M
