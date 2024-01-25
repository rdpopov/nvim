local function qf_toggle()
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


local data = {
    cmd = "Make",
    args = {},
    patterns =  { ["/exercism/rust/"] = "test -- --ignored" },
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

local build_helper = {
    setup = setup,
    augment = augment_arg_dir,
    run = exec_bld
}

local opts = {noremap = true, silent = true}
local keymap = vim.api.nvim_set_keymap
vim.g.mapleader = ' '
keymap('n','<Leader>x', '',{callback = function() build_helper.run() end ,noremap = true, silent = true, desc = "Run makeprg wrapper"})
keymap('n','<Leader>X', '',{callback = function() build_helper.augment() end ,noremap = true, silent = true, desc = "Change current build command argumetns"})
keymap('n','<Leader>c', '',{callback= qf_toggle, noremap = true, silent = true, desc="Toggle qf list"})
keymap('x','<leader><leader>',':<C-u>call VBlockNorm()<cr>' ,{silent = true, desc="Executer normal mode command over visual selecetion"})
keymap('n','<Leader>C', ':call g:LToggle()<cr>',{noremap = true, silent = true, desc="Toggle loc list"})
keymap('n','<Leader>l',':call CycleLanguagesUp()<CR>',{noremap = true, silent = true, desc="Switch to next language"})
keymap('n','<Leader>h', ':call ToggleLocalSpelling()<CR>',{noremap = true, silent = true, desc="Toggle spelling"})
keymap('n','<C-s>', ':call OpenTerm(v:false)<cr>',{noremap = true, silent = true, desc="Open a terminal"})
keymap('n','s', '<Plug>VimSakHihglightInMotion',{noremap = true, silent = true, desc="Highlight in current selecetion"})
keymap('n','<Leader>r', '<Plug>VimSakInteractiveReplace',{noremap = true, silent = true, desc="Replace in visuial selection"})
keymap('n','<Leader>c', '<Plug>VimSakAccumulate',{noremap = true, desc="Accumilate strings matching the pattern in visal selection"})
keymap('n','<Leader>s', '<Plug>VimSakRotate',{noremap = true, silent = true, desc="Replace in visuial selection"})
keymap('n','<Leader>i', '<Plug>VimSakInterleave',{noremap = true, desc="Accumilate strings matching the pattern in visal selection"})
