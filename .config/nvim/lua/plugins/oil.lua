-- ================================================================================================
-- TITLE : oil-nvim.lua
-- ABOUT : A file explorer buffer for Neovim, written in Lua.
-- LINKS :
--   > github : https://github.com/stevearc/oil.nvim
-- ================================================================================================
--
return {
    "stevearc/oil.nvim",
    ---@module 'oil'
    opts = {
        columns = {
            "icon",
            "permissions",
            "size",
        },

        win_options = {
            wrap = true,
            signcolumn = "yes",
            winbar = "%{v:lua.require('oil').get_current_dir()}",
        },

        delete_to_trash = true,
        skip_confirm_for_simple_edits = true,

        view_options = {
            show_hidden = true,
        },

        float = {
            max_width = 0.8,
            max_height = 0.8,
            border = "rounded",
        },

        confirmation = {
            border = "rounded",
        },

        progress = {
            border = "rounded",
        },

        ssh = {
            border = "rounded",
        },

        keymaps_help = {
            border = "rounded",
        },

        keymaps = {
            ["g?"] = { "actions.show_help", mode = "n" },
            ["<CR>"] = "actions.select",
            ["<C-s>"] = { "actions.select", opts = { vertical = true } },
            ["<C-h>"] = { "actions.select", opts = { horizontal = true } },
            ["<C-t>"] = { "actions.select", opts = { tab = true } },
            ["<C-p>"] = "actions.preview",
            ["<C-c>"] = false,
            ["<C-l>"] = "actions.refresh",
            ["-"] = { "actions.parent", mode = "n" },
            ["_"] = { "actions.open_cwd", mode = "n" },
            ["`"] = { "actions.cd", mode = "n" },
            ["g~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
            ["gs"] = { "actions.change_sort", mode = "n" },
            ["gx"] = "actions.open_external",
            ["g."] = { "actions.toggle_hidden", mode = "n" },
            ["g\\"] = { "actions.toggle_trash", mode = "n" },
        },
    },
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
}
