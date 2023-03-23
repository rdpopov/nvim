local packages = {
    "lewis6991/impatient.nvim";
    "nvim-lua/plenary.nvim";
    -- -- -- Missing features from emacs
    "junegunn/vim-easy-align";
    "tpope/vim-surround";
    -- -- -- Git
    "lewis6991/gitsigns.nvim";
    "tpope/vim-fugitive";
    -- -- -- Language support
    "alaviss/nim.nvim";
    "preservim/vim-markdown";
    "simrat39/rust-tools.nvim";
    "sirtaj/vim-openscad";
    "rust-lang/rust.vim";
    {"nvim-treesitter/nvim-treesitter", run=function() vim.api.nvim_command("TSUpdate") end };
    "nvim-treesitter/nvim-treesitter-context";
    -- -- -- Lsp
    "neovim/nvim-lspconfig";
    "hrsh7th/nvim-cmp";
    "hrsh7th/cmp-buffer";
    "hrsh7th/cmp-nvim-lsp";
    "hrsh7th/cmp-nvim-lsp-signature-help";
    "hrsh7th/cmp-nvim-lua";
    "hrsh7th/cmp-path";
    "f3fora/cmp-spell";
    "L3MON4D3/LuaSnip";
    "saadparwaiz1/cmp_luasnip";
    "rafamadriz/friendly-snippets";
    "williamboman/nvim-lsp-installer";
    -- -- -- Navigation
    -- "nvim-telescope/telescope-symbols.nvim";

    "ThePrimeagen/harpoon";
    "nvim-telescope/telescope.nvim";
    {"nvim-telescope/telescope-fzf-native.nvim", run="make" };
    -- -- -- Documentation creation
    "jbyuki/venn.nvim";
    "lervag/wiki.vim";
    "lervag/lists.vim";
    "danymat/neogen";
    -- -- -- Utilities
    "KabbAmine/zeavim.vim"; -- Zeal intergation
    "tpope/vim-commentary"; -- Make comments
    "tpope/vim-dispatch";   -- Build tools
    "mbbill/undotree";
    "stevearc/aerial.nvim";
    "norcalli/nvim-colorizer.lua";
    "jpalardy/vim-slime";
    "folke/todo-comments.nvim";
    "will133/vim-dirdiff";
    "rdpopov/CCTree";
    "dhananjaylatkar/cscope_maps.nvim";
}

local pq = require "paq_bootstrap"
pq.bootstrap(packages)
