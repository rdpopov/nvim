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
    "hrsh7th/cmp-vsnip";
    "hrsh7th/vim-vsnip";
    "f3fora/cmp-spell";
    "jubnzv/virtual-types.nvim";
    "nvim-telescope/telescope.nvim";
    "nvim-lua/plenary.nvim";
    "folke/todo-comments.nvim";
    {"nvim-telescope/telescope-fzf-native.nvim", run="make" };
    "nvim-telescope/telescope-symbols.nvim";
    "tpope/vim-abolish";
    "phaazon/hop.nvim";
    "mbbill/undotree";
    "antoinemadec/FixCursorHold.nvim";
    "tpope/vim-fugitive";
    "lewis6991/gitsigns.nvim";
    "tpope/vim-dispatch";
    "norcalli/nvim-colorizer.lua";
    "jpalardy/vim-slime";
    "smithbm2316/centerpad.nvim";
}
require "paq_bootstrap".bootstrap(packages)
