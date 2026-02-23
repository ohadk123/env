return {
    'saghen/blink.cmp',
    -- optional: provides snippets for the snippet source
    dependencies = { 'rafamadriz/friendly-snippets' },

    version = '1.*',
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        sources = {
            providers = {
                snippets = {
                    opts = {
                        friendly_snippets = true, -- default
                        filter_snippets = function(_, file)
                            return not (string.match(file, "friendly.snippets") and string.match(file, "framework"))
                        end,
                    },
                },
            },
        },
        -- All presets have the following mappings:
        -- C-space: Open menu or open docs if already open
        -- C-n/C-p or Up/Down: Select next/previous item
        -- C-e: Hide menu
        -- C-k: Toggle signature help (if signature.enabled = true)
        keymap = { preset = 'enter' },

        completion = { documentation = { auto_show = true } },
        signature = { enabled = true },
    },
}
