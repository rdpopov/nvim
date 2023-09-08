-- Bootstrapping
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

bootstrap_paq({
	"savq/paq-nvim",
	'nvim-lua/plenary.nvim',
	'nvim-telescope/telescope.nvim',
}
)
