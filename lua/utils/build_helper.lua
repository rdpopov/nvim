---@module build_helper
---@author Rosen Popov
---@license fuk u
--- Somewhat tested

local data = {
    cmd = "Make",
    args = {},
    patterns = {},
}

local function augment_arg_dir()
    local wd = vim.fn.getcwd()
    local inp = nil
    local crr_cmd = ""
    if data.args[wd] == nil then
        for k,v in pairs(data.patterns) do
            print(k," ",v," ",vim.fn.match(wd,k))
            if vim.fn.match(wd,k) > 0 then
                crr_cmd = v
                break
            end
        end
    else
        crr_cmd = data.args[wd]
    end

    local ok,res = pcall(vim.fn.input,"Build args for dir " .. wd .. ": ",crr_cmd)
    if ok then
        inp = res
    else
        inp = ""
    end
    data.args[wd] = inp -- args will always supercede patterns, so exist or not it is getting a new patten
end
local function setup(cfg)
    if cfg == nil then
        cfg = data
    end
    for k,v in pairs(cfg) do
        if v ~= nil then
            data[k] = v
        end
    end
end

local function exec_bld()
    local wd = vim.fn.getcwd()
    local bld_cmd = ""
    if data.args[wd] ~= nil then
        bld_cmd = data.args[wd]
    else
        local is_in_patterns = false
        for k,v in pairs(data.patterns) do
            print(k," ",v," ",vim.fn.match(wd,k))
            if vim.fn.match(wd,k) > 0 then
                is_in_patterns = true
                bld_cmd = v
                break
            end
        end
        if is_in_patterns == false then
            augment_arg_dir()
            bld_cmd = data.args[wd]
        end
    end
    local cmd = ""
    if string.char(bld_cmd:byte(1))== "!" then
        -- override the current implementation to take advantage of running
        -- tasks in tmux panes instead of splitting
        cmd = data.cmd .. bld_cmd
    else
        cmd = data.cmd .. " " .. bld_cmd
    end
    print(cmd)
    vim.cmd(cmd)
end

return {
    setup = setup,
    augment = augment_arg_dir,
    run = exec_bld
}
