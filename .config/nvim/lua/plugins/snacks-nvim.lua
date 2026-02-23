return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        dashboard = {
            enabled = true,
            preset = {
                keys = {
                    { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
                    { icon = " ", key = "p", desc = "Find In Project", action = "<leader>sp" },
                    { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
                    { icon = "  ", key = "s", desc = "Find Session", action = "<leader>ss"},
                    { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
                    { icon = " ", key = "s", desc = "Restore Session", section = "session" },
                    { icon = " ", key = "q", desc = "Quit", action = ":qa" },
                },
                sections = {
                    { section = "header" },
                    { section = "keys" },
                },
            },
        },
        explorer = { enabled = true },
        indent = { enabled = true },
        input = { enabled = true },
        notifier = { enabled = true },
        quickfile = { enabled = true },
        scope = { enabled = true },
        scroll = { enabled = true },
        words = { enabled = true },
        image = { enabled = true },
        lazygit = { enabled = true },
    },

    keys = {
        { "<leader>G", function() require("snacks").lazygit() end, desc = "Lazy[G]it" },
    }
}
