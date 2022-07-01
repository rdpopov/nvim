---@module build_helper
---@author Rosen Popov
---@license fuk u
--not tested yet!!!!

local data = {
    cmd = "Make",
    args = { }, -- specific folders
    patterns = { } -- regexes describing calsses of folders, they will be made into objects later
}

--- Setupo function
---@param cfg
local function setup(cfg)
    for k,v in ipairs(cfg) do
        if v ~= nil then
            data[k] = v
        end
    end
    -- make the vim regex strings into vim regex objects, to do the coversiuon just once
    local transformed_patterns = {}
    for k,v in ipairs(data.patterns) do
        if k ~= nil then
            transformed_patterns[vim.regex(re)] = v
        end
    end
    data.patterns = transformed_patterns
end

--- Executes build command
---@param dir
local function exec_bld(dir,add_to)
    local cd = false
    if dir ~= nil then
        cd = true
    end
    local wd = dir or vim.fn.getcwd()
    local bld_cmd = ""
    if data.args[wd] ~= nil then
        bld_cmd = data.args[wd]
    else
        local is_in_patterns = false
        for k,v in ipairs(patterns) do
            if k:match(wd) then
                is_in_patterns = true
                bld_cmd = v -- Later we will prepend to it the cmd for make
                break
            end
        end
        if is_in_patterns == false then
            -- Query for user input only once
            local inp = nil
            vim.ui.input({
                prmpt = "Build args for dir " .. wd .. ": ",
                default = "",
                on_confirm = function (input)
                    inp = input
                end
            })
            if inp ~=nil then
                bld_cmd = inp
                if add_to == true then
                    data.args[wd] = inp
                end
            end
        end
    end
    if cd then
        print("not yet implemented")
    else
        vim.cmd(data.cmd .. " " .. bld_cmd)
    end
end

local function augment_arg_dir()
    local wd = dir or vim.fn.getcwd()
    local inp = nil
    vim.ui.input({
        prmpt = "Augment build args for dir " .. wd .. ": ",
        default = data.args[wd] or "",
        on_confirm = function (input)
            inp = input
        end
    })
    if inp ~=nil then
       data.args[wd] = inp
    end
end

return {
    setup = setup,
    augment = augment_arg_dir,
    run = exec_bld
}
