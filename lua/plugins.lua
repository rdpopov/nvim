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
    -- need configuration
    'lewis6991/impatient.nvim',
    'savq/paq-nvim',
    'nvim-telescope/telescope.nvim',
    'stevearc/aerial.nvim',
    'lewis6991/gitsigns.nvim';
    {'nvim-treesitter/nvim-treesitter', build=function() vim.api.nvim_command('TSUpdate') end },
    'nvim-treesitter/nvim-treesitter-context',
    -- lsp
    'f3fora/cmp-spell',
    'hrsh7th/cmp-path',
    'L3MON4D3/LuaSnip',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/nvim-cmp',
    'neovim/nvim-lspconfig',
    'saadparwaiz1/cmp_luasnip',
    -- as is
    'tpope/vim-dispatch',
    'will133/vim-dirdiff',
    'tpope/vim-commentary',
    'junegunn/vim-easy-align',
    'tpope/vim-surround',
    'tpope/vim-fugitive',
    'rdpopov/vim-select-mode',
    'nvim-lua/plenary.nvim',
    'mbbill/undotree',
    'lervag/lists.vim',
    'lervag/wiki.vim',
    'dhananjaylatkar/cscope_maps.nvim',
    'norcalli/nvim-colorizer.lua',
    'williamboman/mason.nvim',
    'rdpopov/azenburn',
    'junegunn/goyo.vim',
    'mfussenegger/nvim-jdtls',
    'stevearc/vim-arduino',
}
)
