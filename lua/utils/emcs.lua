---@module emcs
---@author Rosen Popov
---@license fuk u
--- Could have named it emacs if i wanted anything more on the nose

local E = {}

-- Splits lines on a character defined
E.split_lines = function ()
	local inp = vim.fn.input("split on: ")
	vim.cmd('s/\\('.. inp ..  '\\)/\\1\\r/g')
end

-- TODO: Make it so you can append to his one
E.replace_in_selection_fn = function (global)
    local mode = ""
    if vim.api.nvim_get_mode()['mode'] ~= 'n' then
        mode = "'<,'>"
    end
    local replacable = vim.fn.getreg('/') 
    if replacable == "" then
        replacable = vim.fn.input("Search register empty. Replace: ") or ""
    end
    if #replacable == 0 then -- any arbitrary filter proc here, can replace empty string(more like bad idea)
        print(string.format("'%s' Is invalid string to replace",replacable))
    end
    local replace_with = vim.fn.input("Replace " .. replacable .. " with : ") or ""
    local cmd_s = string.format("%s s/%s/%s/%s",mode,replacable,replace_with,global and "g" or "")
    print(cmd_s)
    vim.fn.execute(cmd_s)
    vim.fn.setreg('/',"")
end

E.replace_in_selection = function (global)
    -- pcall(E.replace_in_selection_fn,global)
    E.replace_in_selection_fn(global)
end

return E
