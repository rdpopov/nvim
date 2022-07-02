local packages = {
    "JoosepAlviste/nvim-ts-context-commentstring";                                             -- similar to vim comentarry but treesitter aware
    "terrortylor/nvim-comment";                                                                -- A Comment plugin for nvim
    "L3MON4D3/LuaSnip";                                                                        -- Snippet manager
    "Pocco81/TrueZen.nvim";                                                                    -- Zen mode similar to goyo
    "SmiteshP/nvim-gps";                                                                       -- A little smarter way to show scope in a program via lsp or treesitter
    "alaviss/nim.nvim";                                                                        -- Nim compiler support
    "antoinemadec/FixCursorHold.nvim";                                                         -- someone said i should have it, should be eneral fix
    "danymat/neogen";                                                                          -- Way ro generate commentsring for definitions of functions/files/classes
    "f3fora/cmp-spell";                                                                        -- Cmp wrapper for vim spell completion
    "folke/todo-comments.nvim";                                                                -- Way to colorize and find certain comment strings
    "folke/twilight.nvim";                                                                     -- Way to dim inactive secttions in a file based on treesitter. Combines with zen
    "glepnir/dashboard-nvim";                                                                  -- Startip page plugin.
    "hrsh7th/cmp-buffer";                                                                      -- Cmp source for buffer completion
    "hrsh7th/cmp-nvim-lsp";                                                                    -- Cmp source for lsp
    "hrsh7th/cmp-nvim-lsp-signature-help";                                                     -- Cmp helper for function argument highlight
    "hrsh7th/cmp-nvim-lua";                                                                    -- Cmp source for the builtin lua functions for vim
    "hrsh7th/cmp-path";                                                                        -- Cmp wrapper for vim builtin file/direcory completion
    "hrsh7th/nvim-cmp";                                                                        -- Completion framework/agregator plugin
    "jbyuki/venn.nvim";                                                                        -- A way to draw boxes and arrows easily in vim
    "jpalardy/vim-slime";                                                                      -- A way to quickly push to visual selection to terminal
    "jubnzv/virtual-types.nvim";                                                               -- Virtual type annotations for some languages
    "junegunn/vim-easy-align";                                                                 -- a way to get emacs align functionality from vim
    "kyazdani42/nvim-tree.lua";                                                                -- file manager
    "lewis6991/gitsigns.nvim";                                                                 -- A git gutter type pluginthat can also navigate hunks and changes
    "lewis6991/impatient.nvim";                                                                -- Plugin that caches lua into bytecode so nvim starts up WAAAY faster
    "mbbill/undotree";                                                                         -- A wrapper around vim's undo functionality. A more visual way to show it
    "neovim/nvim-lspconfig";                                                                   -- A needed plugin to provide configurations for lsp-s
    "brookhong/cscope.vim";                                                                    -- Cscope integration
    "norcalli/nvim-colorizer.lua";                                                             -- A plugin that highlights colors with thmselves
    "nvim-lua/plenary.nvim";                                                                   -- A dependency plugin
    "nvim-telescope/telescope-symbols.nvim";                                                   -- Plugin for telescope to show Unicode glyphs
    "nvim-telescope/telescope.nvim";                                                           -- Fuzzy searcher framework plugin wa
    "preservim/vim-markdown";                                                                  -- Support for markdown
    "rafamadriz/friendly-snippets";                                                            -- A bundle of snippets
    "rust-lang/rust.vim";                                                                      -- Rust support for vim
    "saadparwaiz1/cmp_luasnip";                                                                -- Cmp luasnip intgration plugin
    "savq/paq-nvim";                                                                           -- A very simple package manager in lua
    "simrat39/rust-tools.nvim";                                                                -- More rust supprt for nivm
    "stevearc/aerial.nvim";                                                                    -- Outline plugin that can use treesitter and lsp
    "tpope/vim-abolish";                                                                       -- It's tpope
    "tpope/vim-dispatch";                                                                      -- A tool to make :make ran in a separate process to vim
    "tpope/vim-fugitive";                                                                      -- A git integration plugin
    "tweekmonster/startuptime.vim";                                                            -- A bechhmarking plugin for nvim
    "lervag/wiki.vim";                                                                         -- A plugin to make a personal wiki/diary
    "lervag/lists.vim";                                                                        -- List supprot for wiki.vim
    "williamboman/nvim-lsp-installer";                                                         -- Plugin to automatically install and setup lsp-s
    {"nvim-telescope/telescope-fzf-native.nvim", run="make" };                                 -- Faster telescope
    {"nvim-treesitter/nvim-treesitter", run=function() vim.api.nvim_command("TSUpdate") end }; -- treesitter is a highlight plugin
}
require "paq_bootstrap".bootstrap(packages)
