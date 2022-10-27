
local function clone_paq()
	local path = vim.fn.stdpath('data') .. '/site/pack/paqs/start/paq-nvim'
    if vim.fn.empty(vim.fn.glob(path)) < 0 then
        vim.fn.mkdir(data, "p", "0777")
    end
	if vim.fn.empty(vim.fn.glob(path)) > 0 then
		vim.fn.system {
			'git',
			'clone',
			'--depth=1',
			'https://github.com/savq/paq-nvim.git',
			path
		}
	end
end

local function bootstrap_paq(packages)
    clone_paq()
    vim.cmd('packadd paq-nvim')
    local paq = require('paq')
    paq(packages)
    paq.install()
end

-- local function get_ripgrep(rgv)
-- 	local path = vim.fn.stdpath('data') .. '/site/'
-- 	local rg_name = "ripgrep-".. rgv .."-x86_64-unknown-linux-musl"
-- 	print("Ripgrep missing, getting ",rg_name)
--     if vim.fn.empty(vim.fn.glob(path)) < 0 then
--         vim.fn.mkdir(vim.fs.normalize('~/.local/bin'), "p", "0777")
--     end
--     vim.fn.system {
--         'wget',
--         "https://github.com/BurntSushi/ripgrep/releases/download/".. rgv .. "/".. rg_name ..".tar.gz",
--         '-P',
--         path
--     }
--     vim.fn.system {
--         'tar',
--         '-xf',
--         path .. rg_name .. '.tar.gz',
--         '--directory',
--         path,
--         '--get',
--         rg_name .. '/rg' ,
--     }
--     vim.fn.system{
--         'cp',
--         path .. rg_name ..'/rg',
--         vim.fs.normalize('~/.local/bin/'),
--     }
-- end

return {
    bootstrap = bootstrap_paq,
    -- get_ripgrep = get_ripgrep,
}
