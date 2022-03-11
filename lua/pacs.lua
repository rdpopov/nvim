local packages = {
    "rdpopov/paq-nvim";
    "alaviss/nim.nvim";
    "rust-lang/rust.vim";
    "plasticboy/vim-markdown";
    {"nvim-treesitter/nvim-treesitter", run=function() vim.api.nvim_command("TSUpdate") end };
    "tpope/vim-commentary";
    "neovim/nvim-lspconfig";
    "ray-x/lsp_signature.nvim";
    "stevearc/aerial.nvim";
    "hrsh7th/nvim-cmp";
    "hrsh7th/cmp-nvim-lsp";
    "hrsh7th/cmp-buffer";
    "hrsh7th/cmp-nvim-lua";
    "hrsh7th/cmp-path";
    "f3fora/cmp-spell";
    "jubnzv/virtual-types.nvim";
    -- Snippets:
    -- "L3MON4D3/LuaSnip";
    -- "rafamadriz/friendly-snippets";
    -- "saadparwaiz1/cmp_luasnip";
    "nvim-telescope/telescope.nvim";
    "nvim-lua/plenary.nvim";
    "folke/todo-comments.nvim";
    {"nvim-telescope/telescope-fzf-native.nvim", run="make" };
    "nvim-telescope/telescope-symbols.nvim";
    "tpope/vim-abolish";
    "phaazon/hop.nvim";
    "mbbill/undotree";
    "antoinemadec/FixCursorHold.nvim";
    -- "elihunter173/dirbuf.nvim";
    "tpope/vim-fugitive";
    "lewis6991/gitsigns.nvim";
    "tpope/vim-dispatch";
    "norcalli/nvim-colorizer.lua";
    "jpalardy/vim-slime";
    "dhruvasagar/vim-table-mode";
    "smithbm2316/centerpad.nvim";
    "EdenEast/nightfox.nvim";
    "tweekmonster/startuptime.vim";
    "liuchengxu/vista.vim";
    "ludovicchabant/vim-gutentags";
}
require "paq_bootstrap".bootstrap(packages)
