return {
    "greggh/claude-code.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim", -- Required for git operations
    },
    config = function()
        require("claude-code").setup({
            -- Terminal window settings
            window = {
                split_ratio = 0.26,          -- Percentage of screen for the terminal window (height for horizontal, width for vertical splits)
                position = "vertical",      -- Position of the window: "botright", "topleft", "vertical", "float", etc.
                enter_insert = false,        -- Whether to enter insert mode when opening Claude Code
                hide_numbers = true,        -- Hide line numbers in the terminal window
                hide_signcolumn = true,     -- Hide the sign column in the terminal window

            },
            command_variants = {
                -- Conversation management
                continue = "--continue",     -- Resume the most recent conversation
                resume = "--resume",         -- Display an interactive conversation picker

                -- Output options
                verbose = "--verbose",     -- Enable verbose logging with full turn-by-turn output
            },
            -- Keymaps
            keymaps = {
                toggle = {
                    normal = false,                -- Normal mode keymap for toggling Claude Code, false to disable
                    terminal = "<C-,>",              -- Terminal mode keymap for toggling Claude Code, false to disable
                    variants = {
                        continue = "<leader>cC",     -- Normal mode keymap for Claude Code with continue flag
                        verbose = "<leader>cV",      -- Normal mode keymap for Claude Code with verbose flag
                    },
                },
                window_navigation = true,     -- Enable window navigation keymaps (<C-h/j/k/l>)
                scrolling = true,             -- Enable scrolling keymaps (<C-f/b>) for page up/down
            }
        })
    end
}
