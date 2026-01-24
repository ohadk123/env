return {
    -- "github/copilot.vim",
    "rose-pine/neovim",
    "williamboman/mason.nvim",
    "mbbill/undotree",
    "neovim/nvim-lspconfig",
    "ibhagwan/fzf-lua",
    "Vonr/align.nvim",
    "f-person/git-blame.nvim",
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
    },
    {
        'nvim-treesitter/nvim-treesitter',
        branch = 'master', -- Explicitly use the old branch
        build = ':TSUpdate',
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "c", "lua", "vim", "vimdoc", "rust", "go" },
                sync_install = false,
                auto_install = true,

                highlight = {
                    enable = true,
                    disable = function(lang, buf)
                        local max_filesize = 1024 * 1024
                        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                        if ok and stats and stats.size > max_filesize then
                            return true
                        end
                    end,

                    additional_vim_regex_highlights = false,
                },
            })
        end,
    }
}
