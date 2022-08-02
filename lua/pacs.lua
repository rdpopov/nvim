local packages = {
    "nvim-lua/plenary.nvim";
    -- -- -- Missing features from emacs
    "junegunn/vim-easy-align";
    -- -- -- Git
    "lewis6991/gitsigns.nvim";
    "tpope/vim-fugitive";
    -- -- -- Language support
    "alaviss/nim.nvim";
    "preservim/vim-markdown";
    "simrat39/rust-tools.nvim";
    "rust-lang/rust.vim";
    {"nvim-treesitter/nvim-treesitter", run=function() vim.api.nvim_command("TSUpdate") end };
    -- -- -- Lsp
    "neovim/nvim-lspconfig";
    "hrsh7th/nvim-cmp";
    "hrsh7th/cmp-buffer";
    "hrsh7th/cmp-nvim-lsp";
    "hrsh7th/cmp-nvim-lsp-signature-help";
    "hrsh7th/cmp-nvim-lua";
    "hrsh7th/cmp-path";
    "f3fora/cmp-spell";
    'hrsh7th/cmp-vsnip';
    'hrsh7th/vim-vsnip';
    -- -- -- Navigation
    -- "nvim-telescope/telescope-symbols.nvim";
    "nvim-telescope/telescope.nvim";
    "brookhong/cscope.vim";
    {"nvim-telescope/telescope-fzf-native.nvim", run="make" };
    -- -- -- Documentation creation
    "jbyuki/venn.nvim";
    "lervag/wiki.vim";
    "lervag/lists.vim";
    -- -- -- Utilities
    "tpope/vim-commentary";
    "tpope/vim-dispatch";
    "mbbill/undotree";
    "stevearc/aerial.nvim";
    "norcalli/nvim-colorizer.lua";
    "lewis6991/impatient.nvim";
    -- "dstein64/vim-startuptime";
    "jpalardy/vim-slime";
    "williamboman/nvim-lsp-installer";
    "folke/todo-comments.nvim";
}
require "paq_bootstrap".bootstrap(packages)
