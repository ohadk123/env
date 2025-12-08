require("oil").setup({
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
})
