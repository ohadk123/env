return {
    "ej-shafran/compile-mode.nvim",
    branch = "latest",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "m00qek/baleia.nvim", -- ANSI colors in compilation output
    },
    config = function()
        ---@type CompileModeOpts
        vim.g.compile_mode = {
            default_command = "",
            baleia_setup = true,
        }
    end,
}
