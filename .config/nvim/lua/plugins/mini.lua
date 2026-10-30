-- ================================================================================================
-- TITLE : mini.nvim
-- LINKS :
--   > github : https://github.com/echasnovski/mini.nvim
-- ABOUT : Library of 40+ independent Lua modules.
-- ================================================================================================

return {
    "echasnovski/mini.nvim",
    version = false,
    config = function()
        -- File explorer (this works properly with oil unlike nvim-tree)
        require("mini.files").setup({
            mappings = {
                go_in = "<CR>", -- Map both Enter and L to enter directories or open files
                go_out = "-",
                go_out_plus = "<BS>",
            },
        })

        -- Surround
        -- INFO:
        -- saiw surround with no whitespace
        -- saw surround with whitespace
        require("mini.surround").setup({
            -- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
            highlight_duration = 300,

            mappings = { delete = 'ds' }, -- default is 'sd'

            -- Number of lines within which surrounding is searched
            n_lines = 50,

            -- Whether to respect selection type:
            -- - Place surroundings on separate lines in linewise mode.
            -- - Place surroundings on each line in blockwise mode.
            respect_selection_type = true,
        })

        -- Split & join
        local miniSplitJoin = require("mini.splitjoin")
        miniSplitJoin.setup({
            mappings = { toggle = "" }, -- Disable default mapping
        })
        vim.keymap.set({ "n", "x" }, "sj", function() miniSplitJoin.join() end, { desc = "Join arguments" })
        vim.keymap.set({ "n", "x" }, "sk", function() miniSplitJoin.split() end, { desc = "Split arguments" })
    end,
}
