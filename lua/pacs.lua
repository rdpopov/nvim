local packages = {
    "Pocco81/TrueZen.nvim";
    "alaviss/nim.nvim";
    "antoinemadec/FixCursorHold.nvim";
    "f3fora/cmp-spell";
    "folke/todo-comments.nvim";
    "folke/twilight.nvim";
    "hrsh7th/cmp-buffer";
    "hrsh7th/cmp-nvim-lsp";
    "hrsh7th/cmp-nvim-lua";
    "hrsh7th/cmp-path";
    "hrsh7th/cmp-vsnip";
    "hrsh7th/nvim-cmp";
    "hrsh7th/vim-vsnip";
    "jpalardy/vim-slime";
    "jubnzv/virtual-types.nvim";
    "lewis6991/gitsigns.nvim";
    "mbbill/undotree";
    "neovim/nvim-lspconfig";
    "norcalli/nvim-colorizer.lua";
    "nvim-lua/plenary.nvim";
    "nvim-telescope/telescope-symbols.nvim";
    "nvim-telescope/telescope.nvim";
    "plasticboy/vim-markdown";
    "ray-x/lsp_signature.nvim";
    "savq/paq-nvim";
    "rlane/pounce.nvim";
    "rust-lang/rust.vim";
    "stevearc/aerial.nvim";
    "tpope/vim-abolish";
    "tpope/vim-commentary";
    "tpope/vim-dispatch";
    "tpope/vim-fugitive";
    "tweekmonster/startuptime.vim";
    {"nvim-telescope/telescope-fzf-native.nvim", run="make" };
    {"nvim-treesitter/nvim-treesitter", run=function() vim.api.nvim_command("TSUpdate") end };
    "nvim-treesitter/playground";
}
require "paq_bootstrap".bootstrap(packages)
