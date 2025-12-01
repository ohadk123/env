return {
    -- "github/copilot.vim",
    "rose-pine/neovim",
    "williamboman/mason.nvim",
    "mbbill/undotree",
    "nvim-treesitter/nvim-treesitter",
    "neovim/nvim-lspconfig",
    "ibhagwan/fzf-lua",
    {
        "saghen/blink.cmp",
        event = "VimEnter",
        version = "1.*",
        dependencies = {
            {
                "L3MON4D3/LuaSnip",
                version = "2.*",
                build = (function()
                    return "make install_jsregexp"
                end)(),
                dependencies = {
                    {
                        'rafamadriz/friendly-snippets',
                        config = function()
                            require('luasnip.loaders.from_vscode').lazy_load()
                        end,
                    },
                },
                opts = {},
            },
            "folke/lazydev.nvim",
        },
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
    },

    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },

    -- {
    --     "nvim-telescope/telescope.nvim",
    --     tag = "0.1.8",
    --     dependencies = { "nvim-lua/plenary.nvim" },
    -- },

    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
    },
    {
         "jake-stewart/multicursor.nvim",
        branch = "1.0",
    },
    {
        'stevearc/oil.nvim',
        ---@module 'oil'
        ---@type oil.SetupOpts
        opts = {},
        -- Optional dependencies
        dependencies = { { "nvim-mini/mini.icons", opts = {} } },
        -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
        -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
        lazy = false,
    }
}
